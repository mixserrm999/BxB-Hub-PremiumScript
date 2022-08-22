--[[
Beginning notes:

This thread does not have actual code you can use, it is just pseudo-code. This is to discourage pasting, etc.
This thread is meant to be used as a learning resource, not just to give this stuff away. People who actually try to implement these will be the ones who succeed, not the ones who just try to paste them in for their own gain.
If there is something that you feel should be included or there is something wrong, feel free to leave a reply.


With that out of the way, here is my thread:
When you think of most basic whitelisted script on the market, most of them usually just have a static response from the server and thats it.
]]--
--Example of your typical lua whitelist and how to bypass it:
--Code:
local whitelisted = false;
local response = game:HttpGet("https://whitelist.com/whitelist/authentication?key=" .. whitelistKey);
if response == "successfully whitelisted" then
whitelisted = true
end

repeat wait() until whitelisted
print('user has authenticated!');

Bypass:
Code:
local oldHttpGet; do
oldHttpGet = hookfunction(game.HttpGet, function(self, url, ...)
if typeof(url) == "string" then
if string.find(url, "https://whitelist.com/whitelist/authentication") then
return "successfully whitelisted"
end
end
return oldHttpGet(self, url, ...)
end)
end
-- [[ ========================================================================================================================================================= ]]--
--[[
A static response based whitelist is not the way to go at all. Once someone figures out your response, it is game over for your script.

Any lua script can be cracked due to Lua itself never being designed to be secure.
The difficulty of cracking a script is dependent on how the maker goes about writing their whitelist.
The objective of this thread is to hopefully make people more aware about script security and how they can improve the security of their scripts.

Anyways, lets get started with some examples of how to make your whitelist more resistent to cracking!
]]--

--1. Communication encryption between the client (you) and the server (website).
--One thing you may do to slow down crackers is to use encryption to cloak how your whitelist data is sent and recieved.

--An example of encrypting data:
--Code:
-- // client (pseudo code)
-- // a note: your server encryption key should always be dynamic. using a static encryption key is not a good idea

local server_encryption_key = calculate_server_encryption();
-- // your data encoding / data encryption functions are to be determined by you.
-- // an example would be using AES encryption for encrypt and encoding it with base64;

local network_state = json_encode({
wlkey = encode(encrypt(whitelist_key, server_encryption_key));
})

local data = game:HttpGet('https://whitelist.com/whitelist/authentication?data=' .. network_state)
local response = decrypt(decode(data), server_encryption_key)
local expected = checksum(key .. server_encryption_key) -- you can add other factors here
if response == expected then
whitelist = true
end

repeat wait() until whitelisted
print('user has authenticated!');


-- [[ ========================================================================================================================================================= ]]--

--[[
This makes it much harder to spoof the correct response since the data is encrypted with a dynamic encryption key.
Of course, it is still possible to crack this if you know how to calculate the checksum and encrypt the correct response.
However it stops basic script kiddies from being able to just spoof the response;

2. Using dependencies retrieved from the server to stop cracking
]]--
--Another point of cracking is EQ / JMP based cracks (APPLIES TO ALL VM OBFUSCATION SOLUTIONS [IRONBREW, LURAPH, XEN, etc])
--An example of a JMP based attack, using our old example:
--Code:
-- // client (pseudo code) [jmp based attack]

local whitelisted = false;
local server_encryption_key = calculate_server_encryption();
local network_state = json_encode({
wlkey = encode(encrypt(whitelist_key, server_encryption_key));
})

local data = game:HttpGet('https://whitelist.com/whitelist/authentication?data=' .. network_state)
local response = decrypt(decode(data), server_encryption_key)
local expected = checksum(whitelist_key .. server_encryption_key)
if response == expected then
whitelisted = true
end

repeat wait() until whitelisted -- when the VM obfuscator gets to this statement, increase the current instruction to "jump" over this loop and run the script as normal, even though we're not whitelisted
print('user has authenticated!');
-- [[ ========================================================================================================================================================= ]]--

--[[
A (simple and not super effective) way to counteract this would be to have multiple whitelist checks sprinkled throughout the script.
]]--
--Example:
--Code:
-- // client (pseudo code) [jmp based attack]

local whitelisted = false;
local server_encryption_key = calculate_server_encryption();
local network_state = json_encode({
wlkey = encode(encrypt(whitelist_key, server_encryption_key));
})

local data = game:HttpGet('https://whitelist.com/whitelist/authentication?data=' .. network_state)
local response = decrypt(decode(data), server_encryption_key)
local expected = checksum(whitelist_key .. server_encryption_key)
if response == expected then
whitelisted = true
end

repeat wait() until whitelisted -- when the VM obfuscator gets to this statement, increase the current instruction counter to "jump" over this loop and run the script as normal, even though we're not whitelisted
print('user has authenticated!');

local function aimbot_step()
lock_on_to_player()
if (not whitelistCheck()) then
repeat crash() until nil
end
end

-- [[ ========================================================================================================================================================= ]]--

--[[
That simple check would be enough to stop JMP based attacks (if you have mutliple in varying places, etc) in their tracks.

EQ hooks are similar to JMP based attacks (where the VM obfuscator is modified). Except instead of jumping over the loop, they make your script think the servers invalid response is the correct response.
]]--
--Example:
--Code:
-- // client (pseudo code) [jmp based attack]

local whitelisted = false;
local server_encryption_key = calculate_server_encryption();
local network_state = json_encode({
wlkey = encode(encrypt(whitelist_key, server_encryption_key));
})

local data = game:HttpGet('https://whitelist.com/whitelist/authentication?data=' .. network_state)
local response = decrypt(decode(data), server_encryption_key)
local expected = checksum(whitelist_key .. server_encryption_key)
if response == expected then -- when the VM obfuscator gets to this statement, trick the script into thinking these two things "response" & "expected" are equal
whitelisted = true
end

repeat wait() until whitelisted
print('user has authenticated!');

local function aimbot_step()
lock_on_to_player()
if (not whitelistCheck()) then
repeat crash() until nil
end
end
-- [[ ========================================================================================================================================================= ]]--

--[[
So, how do we stop EQ & JMP hooks? Well, the solution is tough to say the least.
We have already overviewed one method (having mutliple whitelist checks).
Another method would be to use different methods to check the equality of the strings.
An example of this would be going through each character in the two strings and if the characters do not match, you know the string is not equal (and the whitelist check fails).

3. Having your script require server dependencies;

This ties in with anti EQ / JMP hooks (as using server dependencies makes it harder to jump over / eq hook without spoofing the correct server data)
An example of a server "dependency" is a table of constants you require for certain functions or a module you load from the server.
Something that the script ABSOLUTELY NEEDS for the script to work as normal!
]]--
--Example:
--Code:
-- // client (pseudo code) [jmp based attack]

local whitelisted = false;
local server_constants = nil;
local server_encryption_key = calculate_server_encryption();
local network_state = json_encode({
wlkey = encode(encrypt(whitelist_key, server_encryption_key));
})

local data = game:HttpGet('https://whitelist.com/whitelist/authentication?data=' .. network_state)
local returned = decrypt(decode(data), server_encryption_key)
local expected = checksum(whitelist_key .. server_encryption_key)
local decoded = json_decode(returned)
local response = decoded.response;
local data = response.data;

if response == expected then -- when the VM obfuscator gets to this statement, trick the script into thinking these two things "response" & "expected" are equal
whitelisted = true
server_constants = json_decode(decrypt(data, server_encryption_key));
end

repeat wait() until whitelisted
repeat until server_constants -- if they jump over or EQ hook the whitelist check, if the server data is not there then we put them into an inifnite loop
print('user has authenticated!');

local function aimbot_step()
lock_on_to_player()
if (not whitelistCheck()) then
repeat crash() until nil
end
if (not server_constants) then
repeat crash() until nil
end
end

local players = game:GetService(server_constants['4597VNDFJKIVNDFIURYFNVJDFNKJVNDFJK']) -- "Players"
local function kill_all() -- pseudo code
local argument_1 = server_constants['KVDJKNDJKRUEWIOVDFJKVNKDFJNV'] -- "danage player"
local argument_2 = server_constants['VKMFDKVMDKLVJDFLVNDFJKVNDFJK'] -- static remote key
for i, player in next, players:GetPlayers() do
if player ~= localPlayer then
fireServer(game.ReplicatedStorage.Remotes[server_constants['RFERFV7DV7DF89V7FD9B789B789FG7B']], argument_1, argument_2, player, 9e9)
end
end
end
-- [[ ========================================================================================================================================================= ]]--

--[[
There you have it, some methods that (if used correctly) can help make your script whitelist more resilient against cracks.

Notes:
If you use a dynamic encryption key, make sure it is hard to figure out how it is calculated :)
These methods are, unfortunately, weak against replay attacks.

Simple example of a replay attack:
Cracker stores encryption key for old response data.
Cracker spoofs your encryption key / method of calculating it.
Cracker returns old data that was encrypted with the encryption key that they stored.
I do not have a very good method of protecting against replay attacks, so that is why I did not mention them in the thread
These will not make your script uncrackable, it only makes it harder for regular script kiddies. People with time and determination will be able to crack your script, the goal is to make it so hard that they just give up trying to do it.

I hope everyone learns from this thread, as I wrote it to be a learning resource (not a thread to paste from).
]]--
