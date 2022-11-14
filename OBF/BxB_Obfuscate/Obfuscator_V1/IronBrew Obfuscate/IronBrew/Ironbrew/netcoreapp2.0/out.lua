local V=string.byte;local f=string.char;local d=string.sub;local M=table.concat;local r=math.ldexp;local F=getfenv or function()return _ENV end;local D=setmetatable;local J=select;local I=unpack;local t=tonumber;local function E(V)local e,o,a="","",{}local n=256;local c={}for l=0,n-1 do c[l]=f(l)end;local l=1;local function I()local e=t(d(V,l,l),36)l=l+1;local o=t(d(V,l,l+e-1),36)l=l+e;return o end;e=f(I())a[1]=e;while l<#V do local l=I()if c[l]then o=c[l]else o=e..d(e,1,1)end;c[n]=e..d(o,1,1)a[#a+1],e,n=o,o,n+1 end;return table.concat(a)end;local c=E('1S1V2752761V1U2771127622G23E22Z22K23422Y23522Z23122U22523E23C23A23423522H23423122723723I22U23E23122M23022U23523G1P27622P27623M2881V1F1V24H27622X1N27524H28J1V22P1728K28P28N27628G27522P28M28L27727621Q2772742752832351V1D27623A23021S23023A23123B22Y23122Z21S23G23723423029H23E1V1J27623323E23H23G21S23E22V23E23G22Y22Z29Q1M27622428423I23323023E21R21Z1V1G2A722I22922322E22922I22B21S22B22822M22J22I22J1V28M1V22423E27J23A23523E2371V1O2A729E29G29I1V1C27622722522822322822422A22M22422F22I2252AQ2AS2AU2AW29S27522723123422Z23422423623I23023B2801V1K27622C2252292AP2AR2AT2AV1V1R2CB2312352B628727522022522J22M22722E1V2A62CQ23E22M23123E22J23E22X2302CJ29923022X2361V1Q2BF2BZ22V2341V1L2762C623I23F23422W29Y23522X1V2CP2AZ23B2DN2DP1V2931V23923A22Z29R27622I2C522U22I22V23329M2E42D72DV23C27E2D223C1V1H27622K23I27X2C423123A22B22Y23I22I2DS2AX2EO2EQ23I2ES23A2D827527I2E42F61V2222352F92EN27522E22421S22122E22122M2BS2CH2AW2CK2752FK2FM2EM2762FH21S22K2282FZ2FO2BU2FA27G23G2DI2DK2FG23022I2372A127K27R2F02752GB2GD2BZ2962AH2752EI2A42A02A22C12CM2F329Q2DV23A23623327U2E52G82AZ23G2ET23322Z22W23I2D222R27622O1N26N26824528M22Q1N28E24228J24F2HB27524C2752HO2272HF24C2271V24F22O1F2HF24528E1V22Q22N2HL22N2HY22R2132HV2132HY22O172I228R2HJ27524X2HN2HP1V2HR2IA2IH26824C28P2HZ21R2HF24E21R2752IK1V2IM2IA2762IQ2HT26K2IT2271S2HZ21J2I221J2J128R24X2IV22R2I12IT28E2HZ21B2IY21B2J121J2BE24221J2JC22R21R2J924C21R2JC2I02I22I422Q2JI2JK2JM24C2JO22O2IC26824E2IE2I526F29824226F1T2HO26N26L2IT26N2KO22O22N2I22I92I52HK1V2HM2J52HQ2HS2JL2HV2KD22F2IY22F2J12672KL2672KO22R24N2KR24C24N2KU2HU2HG2HX2KZ2HL2IN2J62L52KB2KD21Z2IY2AF2I52472KL2472LG24F2LJ24F2KU23J2I223J2J12J02J32J02HO2IS2IU2IF23B2IY23B2J128M2J42HO2LT2IA22F2LJ22F2KU2332I22332MN2LR2L32IP2L52MH2IV22O22V2IY22V2MN2IL2LS2L42IA1N2LJ1N2KU24F2I224F2N02L12ND2N32IA2LV2IF2472IY2472J125J1E2L125J1U2HO25R26M2IT25R2O222O23Z2I223Z2NN2L22MQ2NE2MG2HV2N623R2IY23R2NB2J32NP2J722R23Z2O524C23Z2O825B2I225B28V1N2J025828M2892271U2462762HJ2N12OF2NQ2OH2IT2N624V2IY24V2ON2MP2IO2OQ22N2OT22N2O824N2I224N2OD2OP2LU2L72IF2672IY2672J11F2NZ2421F2O222R1N2OT1N2O825Z2I225Z2MC2IL2MF22R2N52IF25R2IY25R2PK2PW2IA2QN2O62IF25J2I225J2JH2IL2KA2PY2HZ2732IY2732J12532HL2532IA2OX2IT2OZ2HZ26V2I226V2PV2N22OQ2QL2HZ26N2IY26N2QQ2RK2L52M92IT2MB2HZ26F2I226F2RJ2PC2OQ2KF24C2IE2HZ1V2O52452782LQ2NO2RS2IR2OI2IF2QA2KG2QC2KZ2NC2SE2MQ2HV2HS2892HS2882I423W2I428W27523Q2AY2772B82762H222422Z23I22Z22Y23027G23F23E2E12992I92FR1V22L23423F22U2B72762D223222Y23E2302E52E12222312CO27622A27E23B2TK28Z2FF1V22T1V2J02OC27522T2P128F28M22W2IX26824H2MD2311V2HX28U1V2962MB2UO2391V2JS2UO23A28X2QR2SO2IT2HS2382KF2KH27522X21R2J02522MD22T172J025128R22T2SU2SW28M2SZ2751U2EL2762TH23C2GU2GG1V22E23022B2342DN23E23F2DU2762VX2VZ2W12TH22023I2F92T21V2GO2EI2EZ2WB22F22822822C22222522B2DJ27C27E2B023122X23A23G29Q2CA27522F22Z22Z2332WR2WT2WV2972TZ2H923827E2ED23I2WV2X32WU29Q2DE27523323G2EQ2B62U527D22Z2BY2TK22Y23G22Z22E23523D2DI2WB27W2XC23E22E2W12AY22J2T723E2232GX29Q2E12352DZ2BE2752VX2XK23723A22T2T727Q2352XE2X52XZ27X27Z2312D72WX1V2YH2EQ2Y02YT2BD27622523H22V22M2352EQ22U22Z2WU2302YP2WW2WP27F2YJ2B12XU2W12BW1V23B2X023321S2TP2TR2TT2E02DL2842TN2752ZS2TS2E52YW2242AJ2AL2AN2AP2212192ZV2752TW2B6182762ZO2X123021121C21C310H23323H2B321D27U23C21C2GO2W22752U022Z2U22W12E122G22I2232FA2TJ2TL2WO27522D2242282292D42G62TC2AG2A728421E22H2B32EI2312332ET27J2E62GH2EC2EE22Z21E22G22Y23A2W11A2DF2C023421E2222AC23121E2Y32ZJ23A23D23A2C81B2A7312D2B4237311L311N280311Q2B32E528Z2TH2B422V2E52WB2C72VZ2YU2FA2272BK31152WG23E31302D72ZM27G27J2ZJ21E22322U29U28D2762AA2ED2WU2YM27R21C2392302GF2H2311B311D2EY311G29Q2AY2T92802Z823629Q2NZ27522L22V22L21D22V22U22T21R2JZ22029V2U223423831191V23I22X2T72H921S29H2B62VO2ZN2ZP310J310L23G23F23521D23F29A2G623123F313K21D2G623621C2T72T623G23B314327J23021C21A21B21921A21421321221A219215218213315W213214216212218315K315M315O315Q21A21521721B21B218218316121621421421C22H2D223E21S2242F32ED316L22L22U21S22023A22V21S21A21D2392332EL2WB2G6313C311S1T2FW2AW2DV23E23623H2W02D72XH1V2ZB22Z2GC1V317727521H21H2FA2292VS15276314E21R2EB2A12A32W021R21Y27H23121R2242H423A2H621Q317O310B1V314S1V12310G314W310K21C22W318L21D2BZ23H29M22V3159234315B31402YU21C310W2FB31292Y32VT21C311Q234312F317K2YW2TC23031872H62YN2DD2762G629M2312TE24F26E26O2I92DV312F2B523F2D7312U2VS298311U317Y2A423F21R2Y9314321R2Y62A4319E2V62EQ2TR318C23J31AB311I27527T2312C422Z2YY23731A129Q317M2YX2WN317G2B121E2T9318Y2B32YJ2B42Z2319W2GR318031AL21R22K29M23G314K31AN29N2FA315731A531AN21M2LB279275211317L27621M22A31BJ27521M2242C92FW22922H22821R22722B22M21Y2BQ2FV27531AB23J312831412GU21R2112J01927631C422J29A2XB22U21R31C62GT31A231CA31BR27531CF23031CH317R31431V31451V31C422M23G2G627I22Z21R22M2EI31C92J02H231CZ31D127J31D529Q1I31CD31AB31CK21R22E22J31D71V31DF31C331AB2XQ31962AD31CN2CY2VU31BT31BV22G22M22A22I31CV31DG23J2Y02WV21R31CT2AD31DM2U531C431E62AD31DK31DM2YF31CX31DQ27X31E722128029D27R31DM2ZM31EE31EN2YU319D31CC31DP31E52ET314O2A42X328031DJ31DL31CN317G22D23423H319131DO31DW31BU317W21Z22I22K2222BJ22531AY31EJ23J317X2GR27U31E831C831CN2H231C422F22W312131DM2GM31FO31B4312G27J31F531DM31FD31C427G31D227L31EB31E431AJ31G731CN2AY31AJ2Y22W12U52BY317B23A22Y236317V2AM31BU313I31EY22E22731D423F23F2D223023031DM2WG2ZP2XO1V3123275310N314X315C23323A21D3188312E22U310R2312EL2DV22K2252AV22E31152CW31EY22K2D2315331D331CA22L21R31BV31BV22A21O21721A21821721R1L2V831IE31IF31HD318J2Z523H21E29G23H21D27P310Z22Y31IN27Q21C314722L316M2E423E21C31C41D31BG2HD2I22P42U81V24G2ST2V92K72MO2UZ2QK2SG2HZ2HE2HG31J62JS2P828V1V2I931J928V1F28E24M2I422O2JE2HG2JG28N2UD25B31J62UR27622S31JI28Y2U61N2MZ31K82302KW2UI2KY2VC2J024H28R22W31K728M22X1F31KB2I42342L92UI2LB1V22X2VD28F28R2302LN2452LP2351F2PJ23N2I42392I424H2I423C31KM27523D21B2Q224H2JS1V31842UV2MD2382MK2UI2MM2E221J2R624H31JZ2392UD31K831LE2HF31K831LH31KB31LL21S2N82KG2NA1V23D31KY24A28R23G31LF1V23H2IE1U24H2KI31MK2Q731MN27521S2LN24H2LP21Y26F318X23P26F26822O22P31LL23L31LL22P2KI23L2KI21T1F2JS24U2I422031MI22122731KB2LP2282OA2UI2UA22131KY31KJ2FS22721B31MM2LP2211F31KI2I422431JI24928M2292LZ23T2LZ22931M028M22D2UY31AE28T2EO2RC24H2OZ1V1W25331M32RA1V1Y2L028Y2S22PX2JN2HY31ON2I231OQ22L24F23J2P72NM1V2JZ2HV2MF1W2PS2HG2PU31OR2L02OE2PM2L51V2SP2HY22K2JM2492I41X31MB25431MB31BI2J02442762112672OV24H2Q21V21125R24V31MM2QP1V1X31O028F31PQ24F26731MM31P621031MI21124731KB2NW1V21831KE24H2KY21131NS28R31QL2O724H31QO21931P625431P631QU2J024Q28R2152MD2UJ2752182RO2UI2RQ1V21C2RY2UI2S01V21G2S82UI2SB21K2SI28L27931R928E31RB31QP1F2O524E2Q731RH172S91727921H2UA2542UA21L2PJ2HY31SD22R2JQ2IT2JS24F1524722N1T24631QO1525Z24F1U23V2QG1V162K92NR2R231SL31SN31SP27521931SS31SU31SW2Q92HV2HN21D31J724Z27622R24V2682IT31TI22O21D2OM1V25431TO21G31OO26823X31OQ21H25331P424H31OQ21L31JO28F27621L31Q331Q227521L25R2271T24H31Q921P313I2UO21P21324E31UD21327921L21B23231MM31NW1V21O31MI21P24N31KB31PE1431QR2KY21P31QV27531UX23Z31UD31PE317T2I92UO1522724U31UD2P61V1523J25Q31UD31P41V1822V2O524H22V2791523325A31MM2332791931OF2X62UN2761G2OS31NP2791K31MI1L2RI31MM2RI2DJ26V31MQ31WG31WD21B1S24H31WG1O25B31VS25B2791H27327331MM2R629724726631MM2472791G24V31VS31Q72C931WC31WE31WO27531WD31WJ31XE26V23331WN31WP26731VS31QG2EM31WW31WY2751D25331X231U02791D25Z21Q31UD25Z31XX25R24U31WN2O72EM2KI31MR2WO2UV2T326V27231XK2792B82KR28G31771T21J1F1R31LX27526C1F31YJ1F317726G1731YJ1731YL2V828F2MD2681V31YJ31BJ1P2RQ31UD31RG1L26F27231MM26F27931ID25P31Z3317728731YC2751P26V22631YP26V27927431Z7317726821B31YJ21B31772691V23231YP2SB26C22N31YJ31SN1V26931QC31LC31YR2MT31KU31YW32002UI32021V26H1F320631LC27926K22731YJ31UC320O320F2I426K320I24H2MV1V26O320L31LK317726P21R320R21R27926S21Z31YJ21Z3219320Z27526S31Z631RP31YL26F31UC24H31RL1P26F26M31ZG2791P21R31ZK2UJ31YL2UU31U42751T26V26631ZT27926823B31YJ23B317726C31MI26D2QC31MM2SK322J1E322L279322J21A31WN2SK26G321N31YK1V26K23331YJ233317726O31JI2HH275321A1U1U24J321D1V321A322O2UJ279321A26M31YP323C321M31ZX1V26W2M52UI2M71V27031MI27131UN31MM31UN1V323W323F323Z32411Q31MN27925C322W31BJ25G23Z31YJ31V81V25K31MI25L2P631NX279324I323F31VI324I23231WN31VI25O3249317725S23R31YJ23R317725W31X72UI31X926031MI26131W031VZ2793257323F31W01V3257324Q24H325D26431XM2UI31XO31J9323N32041U31WN2SB1T31ZH31UD31ZH317L21R27131ZL320D32242UO26926V22M324531ZU1V26C25331YJ253317726H21R31WM31RX26K324U321524V31YJ24V317726S31MI26T21J26628F21J27926W326K2702LI2UI2LL1V25C31MI25D22N24E32452PQ1V25G326K25K25Z31YJ25Z317725O31MI25P21Z25A324521Z27925S326K322J26631UD2SK26926F1E325V279269325Y326026D326227626D26V24U326727926G27331YJ273317726L2MB28F328K26O326K26S26V31YJ26V317726X31OL31OK275270326K25C2KQ31RF317725H2LP31MV27525K326K25O26F31YJ2KN1V25T31KV321327525W326K260322Y31RP27426431MI26531VU31MM31VU1V329R323F329U329W1P31VT279325N321O320Y325Q320S1V26D26F31Y0321S322Q32843222320O328727526H26V21Q32A0326826K172J931KJ274323431M328M321A22M32A0323C26W21J32AQ2JX323D31V51V323M32A426L1722631UD31S6320O26F21A3281320O328424I21R328I32AH31Z626V23I32AM27926L26F23232A0325W26L32AE32BL31Y831RW2KI1D27331X225131WX1V31W228E25528M1524F31VY25131ST1V31V42V928R21L27331W032C7317N31QC2522VJ2SY2AY');local n=bit and bit.bxor or function(l,o)local e,n=1,0 while l>0 and o>0 do local d,c=l%2,o%2 if d~=c then n=n+e end l,o,e=(l-d)/2,(o-c)/2,e*2 end if l<o then l=o end while l>0 do local o=l%2 if o>0 then n=n+e end l,e=(l-o)/2,e*2 end return n end local function l(e,l,o)if o then local l=(e/2^(l-1))%2^((o-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(e%(l+l)>=l)and 1 or 0;end;end;local e=1;local function o()local o,l,d,c=V(c,e,e+3);o=n(o,31)l=n(l,31)d=n(d,31)c=n(c,31)e=e+4;return(c*16777216)+(d*65536)+(l*256)+o;end;local function a()local l=n(V(c,e,e),31);e=e+1;return l;end;local function t()local e=o();local o=o();local d=1;local n=(l(o,1,20)*(2^32))+e;local e=l(o,21,31);local l=((-1)^l(o,32));if(e==0)then if(n==0)then return l*0;else e=1;d=0;end;elseif(e==2047)then return(n==0)and(l*(1/0))or(l*(0/0));end;return r(l,e-1023)*(d+(n/(2^52)));end;local E=o;local function r(l)local o;if(not l)then l=E();if(l==0)then return'';end;end;o=d(c,e,e+l-1);e=e+l;local e={}for l=1,#o do e[l]=f(n(V(d(o,l,l)),31))end return M(e);end;local e=o;local function f(...)return{...},J('#',...)end local function i()local V={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local e={0,0,0};local d={};local c={V,nil,e,nil,d};for l=1,o()do e[l-1]=i();end;local e=o()local d={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for o=1,e do local e=a();local l;if(e==1)then l=(a()~=0);elseif(e==3)then l=t();elseif(e==0)then l=r();end;d[o]=l;end;c[2]=d for c=1,o()do local d=n(o(),126);local o=n(o(),190);local n=l(d,1,2);local e=l(o,1,11);local e={e,l(d,3,11),nil,nil,o};if(n==0)then e[3]=l(d,12,20);e[5]=l(d,21,29);elseif(n==1)then e[3]=l(o,12,33);elseif(n==2)then e[3]=l(o,12,32)-1048575;elseif(n==3)then e[3]=l(o,12,32)-1048575;e[5]=l(d,21,29);end;V[c]=e;end;c[4]=a();return c;end;local function H(l,r,V)local n=l[1];local e=l[2];local o=l[3];local l=l[4];return function(...)local n=n;local d=e;local A=o;local c=l;local l=f local e=1;local t=-1;local M={};local f={...};local a=J('#',...)-1;local E={};local o={};for l=0,a do if(l>=c)then M[l-c]=f[l+1];else o[l]=f[l+1];end;end;local l=a-c+1 local l;local c;while true do l=n[e];c=l[1];if c<=33 then if c<=16 then if c<=7 then if c<=3 then if c<=1 then if c==0 then o[l[2]]=(l[3]~=0);else local n=l[2];local e=o[l[3]];o[n+1]=e;o[n]=e[d[l[5]]];end;elseif c>2 then local V;local a;local c;o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];c=l[2];a=o[c];V=l[3];for l=1,V do a[l]=o[c+l]end;else local E;local r;local J;local M;local f;local c;local a;o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];a=l[3];c=o[a]for l=a+1,l[5]do c=c..o[l];end;o[l[2]]=c;e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];a=l[3];c=o[a]for l=a+1,l[5]do c=c..o[l];end;o[l[2]]=c;e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];a=l[3];c=o[a]for l=a+1,l[5]do c=c..o[l];end;o[l[2]]=c;e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];f=l[2];a=o[l[3]];o[f+1]=a;o[f]=a[d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];f=l[2];M={};J=0;r=f+l[3]-1;for l=f+1,r do J=J+1;M[J]=o[l];end;E={o[f](I(M,1,r-f))};r=f+l[5]-2;J=0;for l=f,r do J=J+1;o[l]=E[J];end;t=r;e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];a=l[3];c=o[a]for l=a+1,l[5]do c=c..o[l];end;o[l[2]]=c;e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];end;elseif c<=5 then if c==4 then o[l[2]]=(l[3]~=0);else o[l[2]]=d[l[3]];end;elseif c>6 then local e=l[2];local d={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;d[n]=o[l];end;o[e](I(d,1,l-e));t=e;else o[l[2]]={};end;elseif c<=11 then if c<=9 then if c==8 then local n=l[3];local e=o[n]for l=n+1,l[5]do e=e..o[l];end;o[l[2]]=e;else if not o[l[2]]then e=e+1;else e=e+l[3];end;end;elseif c==10 then o[l[2]]=r[l[3]];else local J;local r;local M;local V;local a;local f;local c;c=l[2];f={};a=0;V=c+l[3]-1;for l=c+1,V do a=a+1;f[a]=o[l];end;M={o[c](I(f,1,V-c))};V=c+l[5]-2;a=0;for l=c,V do a=a+1;o[l]=M[a];end;t=V;e=e+1;l=n[e];o[l[2]]={unpack({},1,l[3])};e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];r=o[c];J=l[3];for l=1,J do r[l]=o[c+l]end;end;elseif c<=13 then if c>12 then local n=l[2];local d=n+l[3]-2;local e={};local l=0;for n=n,d do l=l+1;e[l]=o[n];end;do return I(e,1,l)end;else o[l[2]][d[l[3]]]=o[l[5]];end;elseif c<=14 then local e=l[2];local d={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;d[n]=o[l];end;o[e](I(d,1,l-e));t=e;elseif c>15 then if o[l[2]]then e=e+1;else e=e+l[3];end;else local r;local M;local f;local a;local J;local c;c=l[2];J={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;J[a]=o[l];end;M={o[c](I(J,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=M[a];end;t=f;e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];c=l[2];r=o[l[3]];o[c+1]=r;o[c]=r[d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];J={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;J[a]=o[l];end;M={o[c](I(J,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=M[a];end;t=f;e=e+1;l=n[e];c=l[2];r=o[l[3]];o[c+1]=r;o[c]=r[d[l[5]]];e=e+1;l=n[e];c=l[2];J={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;J[a]=o[l];end;M={o[c](I(J,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=M[a];end;t=f;end;elseif c<=24 then if c<=20 then if c<=18 then if c>17 then local n=l[2];local c=l[5];local l=n+2;local d={o[n](o[n+1],o[l])};for e=1,c do o[l+e]=d[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;else local f=A[l[3]];local a;local d={};a=D({},{__index=function(e,l)local l=d[l];return l[1][l[2]];end,__newindex=function(o,l,e)local l=d[l]l[1][l[2]]=e;end;});for c=1,l[5]do e=e+1;local l=n[e];if l[1]==32 then d[c-1]={o,l[3]};else d[c-1]={r,l[3]};end;E[#E+1]=d;end;o[l[2]]=H(f,a,V);end;elseif c==19 then o[l[2]]=r[l[3]];else o[l[2]][d[l[3]]]=o[l[5]];end;elseif c<=22 then if c==21 then local e=l[2];local n=o[e];local l=l[3];for l=1,l do n[l]=o[e+l]end;else local n=l[3];local e=o[n]for l=n+1,l[5]do e=e..o[l];end;o[l[2]]=e;end;elseif c>23 then local e=l[2];local n=o[e];local l=l[3];for l=1,l do n[l]=o[e+l]end;else local n=l[2];local c={};local e=0;local d=n+l[3]-1;for l=n+1,d do e=e+1;c[e]=o[l];end;local d={o[n](I(c,1,d-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=d[e];end;t=l;end;elseif c<=28 then if c<=26 then if c>25 then e=e+l[3];else o[l[2]]=o[l[3]];end;elseif c==27 then local n=l[2];local d=t;local e={};local l=0;for n=n,d do l=l+1;e[l]=o[n];end;do return I(e,1,l)end;else local n=l[2];local c=l[5];local l=n+2;local d={o[n](o[n+1],o[l])};for e=1,c do o[l+e]=d[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;end;elseif c<=30 then if c>29 then local c;local r;local M;local a;local c;local J,f;local c;c=l[2];J,f={o[c]()};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=J[a];end;t=f;e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];c=l[2];M=o[l[3]];o[c+1]=M;o[c]=M[d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];r={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;r[a]=o[l];end;J={o[c](I(r,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=J[a];end;t=f;e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];c=l[2];M=o[l[3]];o[c+1]=M;o[c]=M[d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];r={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;r[a]=o[l];end;J={o[c](I(r,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=J[a];end;t=f;else local e=l[2];local d,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=d[l];end;t=n;end;elseif c<=31 then o[l[2]][d[l[3]]]=d[l[5]];elseif c>32 then o[l[2]]=V[d[l[3]]];else o[l[2]]=o[l[3]];end;elseif c<=50 then if c<=41 then if c<=37 then if c<=35 then if c>34 then local V;local J;local a;local f;local M;local c;o[l[2]]=r[l[3]];e=e+1;l=n[e];c=l[2];M=o[l[3]];o[c+1]=M;o[c]=M[d[l[5]]];e=e+1;l=n[e];o[l[2]]=r[l[3]];e=e+1;l=n[e];c=l[2];f={};a=c+l[3]-1;for l=c+1,a do f[#f+1]=o[l];end;do return o[c](I(f,1,a-c))end;e=e+1;l=n[e];c=l[2];a=t;J={};V=0;for l=c,a do V=V+1;J[V]=o[l];end;do return I(J,1,V)end;e=e+1;l=n[e];do return end;else local M;local c,c;local J;local f;local a;local r;local c;o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];c=l[2];r={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;r[a]=o[l];end;J={o[c](I(r,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=J[a];end;t=f;e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];c=l[2];J,f={o[c]()};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=J[a];end;t=f;e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];c=l[2];M=o[l[3]];o[c+1]=M;o[c]=M[d[l[5]]];end;elseif c==36 then local f=A[l[3]];local a;local d={};a=D({},{__index=function(e,l)local l=d[l];return l[1][l[2]];end,__newindex=function(o,l,e)local l=d[l]l[1][l[2]]=e;end;});for c=1,l[5]do e=e+1;local l=n[e];if l[1]==32 then d[c-1]={o,l[3]};else d[c-1]={r,l[3]};end;E[#E+1]=d;end;o[l[2]]=H(f,a,V);else o[l[2]]={unpack({},1,l[3])};end;elseif c<=39 then if c==38 then for l=l[2],l[3]do o[l]=nil;end;else do return end;end;elseif c==40 then local f;local c;local I,a;local c;o[l[2]]=o[l[3]];e=e+1;l=n[e];c=l[2];I,a={o[c]()};a=c+l[5]-2;f=0;for l=c,a do f=f+1;o[l]=I[f];end;t=a;e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];if not o[l[2]]then e=e+1;else e=e+l[3];end;else do return end;end;elseif c<=45 then if c<=43 then if c==42 then o[l[2]]=o[l[3]][o[l[5]]];else local n=l[2];local d={};local e=0;local c=n+l[3]-1;for l=n+1,c do e=e+1;d[e]=o[l];end;local d={o[n](I(d,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=d[e];end;t=l;end;elseif c>44 then local e=l[2];local d=e+l[3]-2;local n={};local l=0;for e=e,d do l=l+1;n[l]=o[e];end;do return I(n,1,l)end;else local r;local E;local f;local a;local M;local J;local c;o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];c=l[2];J=o[l[3]];o[c+1]=J;o[c]=J[d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];M={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;M[a]=o[l];end;E={o[c](I(M,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=E[a];end;t=f;e=e+1;l=n[e];c=l[2];J=o[l[3]];o[c+1]=J;o[c]=J[d[l[5]]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]={unpack({},1,l[3])};e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];J=l[3];r=o[J]for l=J+1,l[5]do r=r..o[l];end;o[l[2]]=r;e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];J=l[3];r=o[J]for l=J+1,l[5]do r=r..o[l];end;o[l[2]]=r;e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]={unpack({},1,l[3])};e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];J=o[l[3]];o[c+1]=J;o[c]=J[d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];M={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;M[a]=o[l];end;E={o[c](I(M,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=E[a];end;t=f;e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];J=l[3];r=o[J]for l=J+1,l[5]do r=r..o[l];end;o[l[2]]=r;e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];M={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;M[a]=o[l];end;E={o[c](I(M,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=E[a];end;t=f;e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];M={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;M[a]=o[l];end;E={o[c](I(M,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=E[a];end;t=f;e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];M={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;M[a]=o[l];end;E={o[c](I(M,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=E[a];end;t=f;e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];J=l[3];r=o[J]for l=J+1,l[5]do r=r..o[l];end;o[l[2]]=r;e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];o[l[2]]=d[l[3]];end;elseif c<=47 then if c>46 then local e=l[2];local n=o[l[3]];o[e+1]=n;o[e]=n[d[l[5]]];else o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];if o[l[2]]then e=e+1;else e=e+l[3];end;end;elseif c<=48 then o[l[2]]={};elseif c>49 then o[l[2]]=H(A[l[3]],nil,V);else o[l[2]]=o[l[3]][o[l[5]]];end;elseif c<=58 then if c<=54 then if c<=52 then if c==51 then if not o[l[2]]then e=e+1;else e=e+l[3];end;else o[l[2]]=V[d[l[3]]];end;elseif c>53 then local n=l[2];local d=t;local e={};local l=0;for n=n,d do l=l+1;e[l]=o[n];end;do return I(e,1,l)end;else local r;local M;local f;local a;local J;local c;o[l[2]]={};e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];o[l[2]][d[l[3]]]=d[l[5]];e=e+1;l=n[e];c=l[2];J={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;J[a]=o[l];end;M={o[c](I(J,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=M[a];end;t=f;e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];c=l[2];r=o[l[3]];o[c+1]=r;o[c]=r[d[l[5]]];e=e+1;l=n[e];o[l[2]]=d[l[3]];e=e+1;l=n[e];c=l[2];J={};a=0;f=c+l[3]-1;for l=c+1,f do a=a+1;J[a]=o[l];end;M={o[c](I(J,1,f-c))};f=c+l[5]-2;a=0;for l=c,f do a=a+1;o[l]=M[a];end;t=f;e=e+1;l=n[e];c=l[2];r=o[l[3]];o[c+1]=r;o[c]=r[d[l[5]]];end;elseif c<=56 then if c>55 then o[l[2]]=H(A[l[3]],nil,V);else o[l[2]]=o[l[3]][d[l[5]]];end;elseif c==57 then local e=l[2];local n={};local l=e+l[3]-1;for l=e+1,l do n[#n+1]=o[l];end;do return o[e](I(n,1,l-e))end;else local e=l[2];local n={};local l=e+l[3]-1;for l=e+1,l do n[#n+1]=o[l];end;do return o[e](I(n,1,l-e))end;end;elseif c<=62 then if c<=60 then if c>59 then if o[l[2]]then e=e+1;else e=e+l[3];end;else local r;local f;local c;local J;local a;a=l[2];J={};c=0;f=a+l[3]-1;for l=a+1,f do c=c+1;J[c]=o[l];end;r={o[a](I(J,1,f-a))};f=a+l[5]-2;c=0;for l=a,f do c=c+1;o[l]=r[c];end;t=f;e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][d[l[5]]];e=e+1;l=n[e];o[l[2]]=V[d[l[3]]];end;elseif c>61 then for l=l[2],l[3]do o[l]=nil;end;else e=e+l[3];end;elseif c<=64 then if c==63 then o[l[2]]=d[l[3]];else o[l[2]][d[l[3]]]=d[l[5]];end;elseif c<=65 then local e=l[2];local d,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=d[l];end;t=n;elseif c>66 then o[l[2]]=o[l[3]][d[l[5]]];else o[l[2]]={unpack({},1,l[3])};end;e=e+1;end;end;end;return H(i(),{},F())();