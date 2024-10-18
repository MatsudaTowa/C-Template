xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 237;
 0.53802;24.00530;1.33202;,
 -2.47474;23.09185;-2.13377;,
 -4.04300;23.09185;1.01168;,
 0.53802;24.00530;1.33202;,
 0.85835;23.09185;-3.24900;,
 0.53802;24.00530;1.33202;,
 4.00380;23.09185;-1.68074;,
 0.53802;24.00530;1.33202;,
 5.11903;23.09185;1.65235;,
 0.53802;24.00530;1.33202;,
 3.55078;23.09185;4.79780;,
 0.53802;24.00530;1.33202;,
 0.21768;23.09185;5.91303;,
 0.53802;24.00530;1.33202;,
 -2.92777;23.09185;4.34478;,
 0.53802;24.00530;1.33202;,
 -4.04300;23.09185;1.01168;,
 -5.02883;20.49058;-5.07191;,
 -7.92660;20.49058;0.74011;,
 1.12992;20.49058;-7.13260;,
 6.94194;20.49058;-4.23483;,
 9.00263;20.49058;1.92392;,
 6.10486;20.49058;7.73594;,
 -0.05389;20.49058;9.79663;,
 -5.86591;20.49058;6.89886;,
 -7.92660;20.49058;0.74011;,
 -6.73542;16.59750;-7.03512;,
 -10.52153;16.59750;0.55866;,
 1.31138;16.59750;-9.72753;,
 8.90515;16.59750;-5.94142;,
 11.59756;16.59750;2.10538;,
 7.81145;16.59750;9.69915;,
 -0.23534;16.59750;12.39157;,
 -7.82911;16.59750;8.60545;,
 -10.52153;16.59750;0.55866;,
 -7.33469;12.00530;-7.72450;,
 -11.43275;12.00530;0.49494;,
 1.37509;12.00530;-10.63875;,
 9.59453;12.00530;-6.54069;,
 12.50879;12.00530;2.16910;,
 8.41073;12.00530;10.38853;,
 -0.29906;12.00530;13.30279;,
 -8.51850;12.00530;9.20473;,
 -11.43275;12.00530;0.49494;,
 -6.73542;7.41310;-7.03512;,
 -10.52153;7.41310;0.55866;,
 1.31138;7.41310;-9.72753;,
 8.90515;7.41310;-5.94142;,
 11.59756;7.41310;2.10538;,
 7.81145;7.41310;9.69915;,
 -0.23534;7.41310;12.39157;,
 -7.82911;7.41310;8.60545;,
 -10.52153;7.41310;0.55866;,
 -5.02883;3.52002;-5.07191;,
 -7.92660;3.52002;0.74011;,
 1.12992;3.52002;-7.13260;,
 6.94194;3.52002;-4.23483;,
 9.00263;3.52002;1.92392;,
 6.10486;3.52002;7.73594;,
 -0.05389;3.52002;9.79663;,
 -5.86591;3.52002;6.89886;,
 -7.92660;3.52002;0.74011;,
 -2.47474;0.91875;-2.13377;,
 -4.04300;0.91875;1.01168;,
 0.85835;0.91875;-3.24900;,
 4.00380;0.91875;-1.68074;,
 5.11903;0.91875;1.65235;,
 3.55078;0.91875;4.79780;,
 0.21768;0.91875;5.91303;,
 -2.92777;0.91875;4.34478;,
 -4.04300;0.91875;1.01168;,
 0.53802;0.00530;1.33202;,
 0.53802;0.00530;1.33202;,
 0.53802;0.00530;1.33202;,
 0.53802;0.00530;1.33202;,
 0.53802;0.00530;1.33202;,
 0.53802;0.00530;1.33202;,
 0.53802;0.00530;1.33202;,
 0.53802;0.00530;1.33202;,
 1.52315;14.63168;-9.65215;,
 1.14655;14.51750;-10.08538;,
 0.95052;14.51750;-9.69220;,
 1.52315;14.63168;-9.65215;,
 1.56319;14.51750;-10.22478;,
 1.52315;14.63168;-9.65215;,
 1.95637;14.51750;-10.02875;,
 1.52315;14.63168;-9.65215;,
 2.09577;14.51750;-9.61211;,
 1.52315;14.63168;-9.65215;,
 1.89974;14.51750;-9.21893;,
 1.52315;14.63168;-9.65215;,
 1.48310;14.51750;-9.07952;,
 1.52315;14.63168;-9.65215;,
 1.08992;14.51750;-9.27556;,
 1.52315;14.63168;-9.65215;,
 0.95052;14.51750;-9.69220;,
 0.82729;14.19234;-10.45265;,
 0.46507;14.19234;-9.72614;,
 1.59713;14.19234;-10.71023;,
 2.32364;14.19234;-10.34801;,
 2.58122;14.19234;-9.57817;,
 2.21900;14.19234;-8.85167;,
 1.44915;14.19234;-8.59408;,
 0.72265;14.19234;-8.95630;,
 0.46507;14.19234;-9.72614;,
 0.61396;13.70571;-10.69805;,
 0.14070;13.70571;-9.74883;,
 1.61981;13.70571;-11.03460;,
 2.56904;13.70571;-10.56133;,
 2.90559;13.70571;-9.55549;,
 2.43232;13.70571;-8.60626;,
 1.42648;13.70571;-8.26971;,
 0.47725;13.70571;-8.74297;,
 0.14070;13.70571;-9.74883;,
 0.53905;13.13168;-10.78422;,
 0.02680;13.13168;-9.75679;,
 1.62778;13.13168;-11.14850;,
 2.65521;13.13168;-10.63624;,
 3.01949;13.13168;-9.54752;,
 2.50723;13.13168;-8.52009;,
 1.41851;13.13168;-8.15581;,
 0.39108;13.13168;-8.66806;,
 0.02680;13.13168;-9.75679;,
 0.61396;12.55766;-10.69805;,
 0.14070;12.55766;-9.74883;,
 1.61981;12.55766;-11.03460;,
 2.56904;12.55766;-10.56133;,
 2.90559;12.55766;-9.55549;,
 2.43232;12.55766;-8.60626;,
 1.42648;12.55766;-8.26971;,
 0.47725;12.55766;-8.74297;,
 0.14070;12.55766;-9.74883;,
 0.82729;12.07102;-10.45265;,
 0.46507;12.07102;-9.72614;,
 1.59713;12.07102;-10.71023;,
 2.32364;12.07102;-10.34801;,
 2.58122;12.07102;-9.57817;,
 2.21900;12.07102;-8.85167;,
 1.44915;12.07102;-8.59408;,
 0.72265;12.07102;-8.95630;,
 0.46507;12.07102;-9.72614;,
 1.14655;11.74587;-10.08538;,
 0.95052;11.74587;-9.69220;,
 1.56319;11.74587;-10.22478;,
 1.95637;11.74587;-10.02875;,
 2.09577;11.74587;-9.61211;,
 1.89974;11.74587;-9.21893;,
 1.48310;11.74587;-9.07952;,
 1.08992;11.74587;-9.27556;,
 0.95052;11.74587;-9.69220;,
 1.52315;11.63168;-9.65215;,
 1.52315;11.63168;-9.65215;,
 1.52315;11.63168;-9.65215;,
 1.52315;11.63168;-9.65215;,
 1.52315;11.63168;-9.65215;,
 1.52315;11.63168;-9.65215;,
 1.52315;11.63168;-9.65215;,
 1.52315;11.63168;-9.65215;,
 1.45071;10.98830;-9.81347;,
 1.07412;10.87412;-10.24669;,
 0.87808;10.87412;-9.85351;,
 1.45071;10.98830;-9.81347;,
 1.49075;10.87412;-10.38610;,
 1.45071;10.98830;-9.81347;,
 1.88393;10.87412;-10.19006;,
 1.45071;10.98830;-9.81347;,
 2.02334;10.87412;-9.77343;,
 1.45071;10.98830;-9.81347;,
 1.82731;10.87412;-9.38025;,
 1.45071;10.98830;-9.81347;,
 1.41067;10.87412;-9.24084;,
 1.45071;10.98830;-9.81347;,
 1.01749;10.87412;-9.43687;,
 1.45071;10.98830;-9.81347;,
 0.87808;10.87412;-9.85351;,
 0.75486;10.54896;-10.61396;,
 0.39263;10.54896;-9.88746;,
 1.52470;10.54896;-10.87155;,
 2.25120;10.54896;-10.50932;,
 2.50879;10.54896;-9.73948;,
 2.14657;10.54896;-9.01298;,
 1.37672;10.54896;-8.75539;,
 0.65022;10.54896;-9.11761;,
 0.39263;10.54896;-9.88746;,
 0.54153;10.06233;-10.85936;,
 0.06827;10.06233;-9.91014;,
 1.54738;10.06233;-11.19591;,
 2.49660;10.06233;-10.72265;,
 2.83315;10.06233;-9.71680;,
 2.35989;10.06233;-8.76758;,
 1.35404;10.06233;-8.43102;,
 0.40482;10.06233;-8.90429;,
 0.06827;10.06233;-9.91014;,
 0.46662;9.48830;-10.94553;,
 -0.04564;9.48830;-9.91811;,
 1.55534;9.48830;-11.30982;,
 2.58278;9.48830;-10.79756;,
 2.94706;9.48830;-9.70883;,
 2.43480;9.48830;-8.68141;,
 1.34608;9.48830;-8.31712;,
 0.31865;9.48830;-8.82938;,
 -0.04564;9.48830;-9.91811;,
 0.54153;8.91428;-10.85936;,
 0.06827;8.91428;-9.91014;,
 1.54738;8.91428;-11.19591;,
 2.49660;8.91428;-10.72265;,
 2.83315;8.91428;-9.71680;,
 2.35989;8.91428;-8.76758;,
 1.35404;8.91428;-8.43102;,
 0.40482;8.91428;-8.90429;,
 0.06827;8.91428;-9.91014;,
 0.75486;8.42764;-10.61396;,
 0.39263;8.42764;-9.88746;,
 1.52470;8.42764;-10.87155;,
 2.25120;8.42764;-10.50932;,
 2.50879;8.42764;-9.73948;,
 2.14657;8.42764;-9.01298;,
 1.37672;8.42764;-8.75539;,
 0.65022;8.42764;-9.11761;,
 0.39263;8.42764;-9.88746;,
 1.07412;8.10248;-10.24669;,
 0.87808;8.10248;-9.85351;,
 1.49075;8.10248;-10.38610;,
 1.88393;8.10248;-10.19006;,
 2.02334;8.10248;-9.77343;,
 1.82731;8.10248;-9.38025;,
 1.41067;8.10248;-9.24084;,
 1.01749;8.10248;-9.43688;,
 0.87808;8.10248;-9.85351;,
 1.45071;7.98830;-9.81347;,
 1.45071;7.98830;-9.81347;,
 1.45071;7.98830;-9.81347;,
 1.45071;7.98830;-9.81347;,
 1.45071;7.98830;-9.81347;,
 1.45071;7.98830;-9.81347;,
 1.45071;7.98830;-9.81347;,
 1.45071;7.98830;-9.81347;;
 
 192;
 3;0,1,2;,
 3;3,4,1;,
 3;5,6,4;,
 3;7,8,6;,
 3;9,10,8;,
 3;11,12,10;,
 3;13,14,12;,
 3;15,16,14;,
 4;2,1,17,18;,
 4;1,4,19,17;,
 4;4,6,20,19;,
 4;6,8,21,20;,
 4;8,10,22,21;,
 4;10,12,23,22;,
 4;12,14,24,23;,
 4;14,16,25,24;,
 4;18,17,26,27;,
 4;17,19,28,26;,
 4;19,20,29,28;,
 4;20,21,30,29;,
 4;21,22,31,30;,
 4;22,23,32,31;,
 4;23,24,33,32;,
 4;24,25,34,33;,
 4;27,26,35,36;,
 4;26,28,37,35;,
 4;28,29,38,37;,
 4;29,30,39,38;,
 4;30,31,40,39;,
 4;31,32,41,40;,
 4;32,33,42,41;,
 4;33,34,43,42;,
 4;36,35,44,45;,
 4;35,37,46,44;,
 4;37,38,47,46;,
 4;38,39,48,47;,
 4;39,40,49,48;,
 4;40,41,50,49;,
 4;41,42,51,50;,
 4;42,43,52,51;,
 4;45,44,53,54;,
 4;44,46,55,53;,
 4;46,47,56,55;,
 4;47,48,57,56;,
 4;48,49,58,57;,
 4;49,50,59,58;,
 4;50,51,60,59;,
 4;51,52,61,60;,
 4;54,53,62,63;,
 4;53,55,64,62;,
 4;55,56,65,64;,
 4;56,57,66,65;,
 4;57,58,67,66;,
 4;58,59,68,67;,
 4;59,60,69,68;,
 4;60,61,70,69;,
 3;63,62,71;,
 3;62,64,72;,
 3;64,65,73;,
 3;65,66,74;,
 3;66,67,75;,
 3;67,68,76;,
 3;68,69,77;,
 3;69,70,78;,
 3;79,80,81;,
 3;82,83,80;,
 3;84,85,83;,
 3;86,87,85;,
 3;88,89,87;,
 3;90,91,89;,
 3;92,93,91;,
 3;94,95,93;,
 4;81,80,96,97;,
 4;80,83,98,96;,
 4;83,85,99,98;,
 4;85,87,100,99;,
 4;87,89,101,100;,
 4;89,91,102,101;,
 4;91,93,103,102;,
 4;93,95,104,103;,
 4;97,96,105,106;,
 4;96,98,107,105;,
 4;98,99,108,107;,
 4;99,100,109,108;,
 4;100,101,110,109;,
 4;101,102,111,110;,
 4;102,103,112,111;,
 4;103,104,113,112;,
 4;106,105,114,115;,
 4;105,107,116,114;,
 4;107,108,117,116;,
 4;108,109,118,117;,
 4;109,110,119,118;,
 4;110,111,120,119;,
 4;111,112,121,120;,
 4;112,113,122,121;,
 4;115,114,123,124;,
 4;114,116,125,123;,
 4;116,117,126,125;,
 4;117,118,127,126;,
 4;118,119,128,127;,
 4;119,120,129,128;,
 4;120,121,130,129;,
 4;121,122,131,130;,
 4;124,123,132,133;,
 4;123,125,134,132;,
 4;125,126,135,134;,
 4;126,127,136,135;,
 4;127,128,137,136;,
 4;128,129,138,137;,
 4;129,130,139,138;,
 4;130,131,140,139;,
 4;133,132,141,142;,
 4;132,134,143,141;,
 4;134,135,144,143;,
 4;135,136,145,144;,
 4;136,137,146,145;,
 4;137,138,147,146;,
 4;138,139,148,147;,
 4;139,140,149,148;,
 3;142,141,150;,
 3;141,143,151;,
 3;143,144,152;,
 3;144,145,153;,
 3;145,146,154;,
 3;146,147,155;,
 3;147,148,156;,
 3;148,149,157;,
 3;158,159,160;,
 3;161,162,159;,
 3;163,164,162;,
 3;165,166,164;,
 3;167,168,166;,
 3;169,170,168;,
 3;171,172,170;,
 3;173,174,172;,
 4;160,159,175,176;,
 4;159,162,177,175;,
 4;162,164,178,177;,
 4;164,166,179,178;,
 4;166,168,180,179;,
 4;168,170,181,180;,
 4;170,172,182,181;,
 4;172,174,183,182;,
 4;176,175,184,185;,
 4;175,177,186,184;,
 4;177,178,187,186;,
 4;178,179,188,187;,
 4;179,180,189,188;,
 4;180,181,190,189;,
 4;181,182,191,190;,
 4;182,183,192,191;,
 4;185,184,193,194;,
 4;184,186,195,193;,
 4;186,187,196,195;,
 4;187,188,197,196;,
 4;188,189,198,197;,
 4;189,190,199,198;,
 4;190,191,200,199;,
 4;191,192,201,200;,
 4;194,193,202,203;,
 4;193,195,204,202;,
 4;195,196,205,204;,
 4;196,197,206,205;,
 4;197,198,207,206;,
 4;198,199,208,207;,
 4;199,200,209,208;,
 4;200,201,210,209;,
 4;203,202,211,212;,
 4;202,204,213,211;,
 4;204,205,214,213;,
 4;205,206,215,214;,
 4;206,207,216,215;,
 4;207,208,217,216;,
 4;208,209,218,217;,
 4;209,210,219,218;,
 4;212,211,220,221;,
 4;211,213,222,220;,
 4;213,214,223,222;,
 4;214,215,224,223;,
 4;215,216,225,224;,
 4;216,217,226,225;,
 4;217,218,227,226;,
 4;218,219,228,227;,
 3;221,220,229;,
 3;220,222,230;,
 3;222,223,231;,
 3;223,224,232;,
 3;224,225,233;,
 3;225,226,234;,
 3;226,227,235;,
 3;227,228,236;;
 
 MeshMaterialList {
  3;
  192;
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.338824;0.037647;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  174;
  0.000000;1.000000;0.000000;,
  -0.379684;0.924735;-0.026550;,
  -0.249703;0.924735;-0.287251;,
  0.026550;0.924735;-0.379684;,
  0.287251;0.924735;-0.249703;,
  0.379684;0.924735;0.026550;,
  0.249703;0.924735;0.287251;,
  -0.026550;0.924735;0.379684;,
  -0.287251;0.924735;0.249703;,
  -0.703259;0.709231;-0.049177;,
  -0.462506;0.709231;-0.532053;,
  0.049177;0.709230;-0.703259;,
  0.532052;0.709231;-0.462506;,
  0.703259;0.709230;0.049177;,
  0.462506;0.709231;0.532053;,
  -0.049177;0.709231;0.703259;,
  -0.532052;0.709231;0.462506;,
  -0.920855;0.384551;-0.064392;,
  -0.605611;0.384551;-0.696675;,
  0.064392;0.384551;-0.920855;,
  0.696675;0.384551;-0.605610;,
  0.920855;0.384551;0.064393;,
  0.605611;0.384551;0.696675;,
  -0.064393;0.384551;0.920855;,
  -0.696675;0.384551;0.605610;,
  -0.997564;0.000000;-0.069756;,
  -0.656059;0.000000;-0.754710;,
  0.069756;0.000000;-0.997564;,
  0.754710;0.000000;-0.656059;,
  0.997564;0.000000;0.069757;,
  0.656059;0.000000;0.754710;,
  -0.069757;0.000000;0.997564;,
  -0.754710;0.000000;0.656059;,
  -0.920855;-0.384551;-0.064392;,
  -0.605611;-0.384551;-0.696675;,
  0.064392;-0.384551;-0.920855;,
  0.696675;-0.384551;-0.605611;,
  0.920855;-0.384551;0.064393;,
  0.605610;-0.384551;0.696675;,
  -0.064393;-0.384551;0.920855;,
  -0.696675;-0.384551;0.605611;,
  -0.703260;-0.709230;-0.049177;,
  -0.462506;-0.709231;-0.532053;,
  0.049177;-0.709230;-0.703260;,
  0.532053;-0.709231;-0.462506;,
  0.703259;-0.709230;0.049177;,
  0.462506;-0.709231;0.532053;,
  -0.049177;-0.709231;0.703259;,
  -0.532053;-0.709230;0.462506;,
  -0.379684;-0.924735;-0.026550;,
  -0.249703;-0.924735;-0.287251;,
  0.026550;-0.924735;-0.379684;,
  0.287251;-0.924735;-0.249703;,
  0.379684;-0.924735;0.026550;,
  0.249703;-0.924735;0.287251;,
  -0.026550;-0.924735;0.379684;,
  -0.287251;-0.924735;0.249703;,
  0.000000;-1.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  -0.379683;0.924735;-0.026550;,
  -0.249703;0.924735;-0.287251;,
  0.026551;0.924735;-0.379684;,
  0.287252;0.924735;-0.249703;,
  0.379685;0.924735;0.026551;,
  0.249704;0.924734;0.287253;,
  -0.026551;0.924734;0.379686;,
  -0.287252;0.924735;0.249703;,
  -0.703258;0.709232;-0.049177;,
  -0.462505;0.709232;-0.532052;,
  0.049177;0.709232;-0.703258;,
  0.532052;0.709232;-0.462505;,
  0.703259;0.709231;0.049178;,
  0.462506;0.709230;0.532053;,
  -0.049176;0.709231;0.703259;,
  -0.532052;0.709231;0.462505;,
  -0.920855;0.384551;-0.064393;,
  -0.605610;0.384551;-0.696676;,
  0.064393;0.384551;-0.920855;,
  0.696675;0.384551;-0.605610;,
  0.920855;0.384551;0.064392;,
  0.605611;0.384552;0.696674;,
  -0.064391;0.384552;0.920855;,
  -0.696675;0.384552;0.605611;,
  -0.997564;-0.000001;-0.069757;,
  -0.656059;-0.000000;-0.754710;,
  0.069757;-0.000000;-0.997564;,
  0.754710;-0.000000;-0.656058;,
  0.997564;-0.000000;0.069756;,
  0.656060;-0.000000;0.754709;,
  -0.069755;-0.000000;0.997564;,
  -0.754709;-0.000001;0.656060;,
  -0.920855;-0.384552;-0.064393;,
  -0.605610;-0.384552;-0.696675;,
  0.064393;-0.384552;-0.920855;,
  0.696675;-0.384552;-0.605610;,
  0.920855;-0.384551;0.064392;,
  0.605611;-0.384552;0.696674;,
  -0.064391;-0.384552;0.920855;,
  -0.696675;-0.384552;0.605610;,
  -0.703258;-0.709232;-0.049177;,
  -0.462505;-0.709232;-0.532052;,
  0.049177;-0.709232;-0.703258;,
  0.532052;-0.709232;-0.462505;,
  0.703259;-0.709231;0.049178;,
  0.462506;-0.709230;0.532053;,
  -0.049176;-0.709231;0.703259;,
  -0.532052;-0.709231;0.462505;,
  -0.379683;-0.924735;-0.026550;,
  -0.249703;-0.924735;-0.287251;,
  0.026551;-0.924735;-0.379684;,
  0.287252;-0.924735;-0.249703;,
  0.379685;-0.924735;0.026551;,
  0.249704;-0.924734;0.287253;,
  -0.026551;-0.924735;0.379686;,
  -0.287252;-0.924735;0.249703;,
  0.000000;-1.000000;0.000000;,
  -0.000000;1.000000;-0.000001;,
  -0.379684;0.924735;-0.026551;,
  -0.249704;0.924735;-0.287251;,
  0.026550;0.924735;-0.379684;,
  0.287251;0.924735;-0.249703;,
  0.379684;0.924735;0.026550;,
  0.249704;0.924735;0.287250;,
  -0.026549;0.924735;0.379683;,
  -0.287250;0.924735;0.249703;,
  -0.703259;0.709231;-0.049177;,
  -0.462506;0.709230;-0.532053;,
  0.049176;0.709231;-0.703259;,
  0.532053;0.709230;-0.462506;,
  0.703260;0.709230;0.049177;,
  0.462507;0.709230;0.532053;,
  -0.049176;0.709230;0.703260;,
  -0.532052;0.709230;0.462507;,
  -0.920854;0.384553;-0.064392;,
  -0.605609;0.384554;-0.696675;,
  0.064393;0.384552;-0.920855;,
  0.696675;0.384551;-0.605610;,
  0.920855;0.384552;0.064394;,
  0.605611;0.384551;0.696675;,
  -0.064391;0.384551;0.920855;,
  -0.696675;0.384551;0.605610;,
  -0.997564;-0.000000;-0.069756;,
  -0.656059;0.000000;-0.754710;,
  0.069757;0.000000;-0.997564;,
  0.754710;0.000000;-0.656059;,
  0.997564;-0.000000;0.069759;,
  0.656059;0.000000;0.754709;,
  -0.069756;0.000000;0.997564;,
  -0.754710;-0.000000;0.656059;,
  -0.920854;-0.384553;-0.064392;,
  -0.605609;-0.384554;-0.696675;,
  0.064393;-0.384552;-0.920855;,
  0.696675;-0.384551;-0.605610;,
  0.920855;-0.384552;0.064394;,
  0.605611;-0.384551;0.696675;,
  -0.064391;-0.384551;0.920855;,
  -0.696675;-0.384551;0.605610;,
  -0.703259;-0.709231;-0.049177;,
  -0.462506;-0.709230;-0.532053;,
  0.049176;-0.709231;-0.703259;,
  0.532053;-0.709230;-0.462506;,
  0.703260;-0.709230;0.049177;,
  0.462507;-0.709230;0.532053;,
  -0.049176;-0.709230;0.703259;,
  -0.532052;-0.709231;0.462506;,
  -0.379684;-0.924735;-0.026551;,
  -0.249704;-0.924735;-0.287251;,
  0.026550;-0.924735;-0.379684;,
  0.287251;-0.924735;-0.249703;,
  0.379684;-0.924735;0.026550;,
  0.249704;-0.924735;0.287250;,
  -0.026550;-0.924736;0.379683;,
  -0.287251;-0.924735;0.249703;,
  -0.000000;-1.000000;-0.000000;;
  192;
  3;0,2,1;,
  3;0,3,2;,
  3;0,4,3;,
  3;0,5,4;,
  3;0,6,5;,
  3;0,7,6;,
  3;0,8,7;,
  3;0,1,8;,
  4;1,2,10,9;,
  4;2,3,11,10;,
  4;3,4,12,11;,
  4;4,5,13,12;,
  4;5,6,14,13;,
  4;6,7,15,14;,
  4;7,8,16,15;,
  4;8,1,9,16;,
  4;9,10,18,17;,
  4;10,11,19,18;,
  4;11,12,20,19;,
  4;12,13,21,20;,
  4;13,14,22,21;,
  4;14,15,23,22;,
  4;15,16,24,23;,
  4;16,9,17,24;,
  4;17,18,26,25;,
  4;18,19,27,26;,
  4;19,20,28,27;,
  4;20,21,29,28;,
  4;21,22,30,29;,
  4;22,23,31,30;,
  4;23,24,32,31;,
  4;24,17,25,32;,
  4;25,26,34,33;,
  4;26,27,35,34;,
  4;27,28,36,35;,
  4;28,29,37,36;,
  4;29,30,38,37;,
  4;30,31,39,38;,
  4;31,32,40,39;,
  4;32,25,33,40;,
  4;33,34,42,41;,
  4;34,35,43,42;,
  4;35,36,44,43;,
  4;36,37,45,44;,
  4;37,38,46,45;,
  4;38,39,47,46;,
  4;39,40,48,47;,
  4;40,33,41,48;,
  4;41,42,50,49;,
  4;42,43,51,50;,
  4;43,44,52,51;,
  4;44,45,53,52;,
  4;45,46,54,53;,
  4;46,47,55,54;,
  4;47,48,56,55;,
  4;48,41,49,56;,
  3;49,50,57;,
  3;50,51,57;,
  3;51,52,57;,
  3;52,53,57;,
  3;53,54,57;,
  3;54,55,57;,
  3;55,56,57;,
  3;56,49,57;,
  3;58,60,59;,
  3;58,61,60;,
  3;58,62,61;,
  3;58,63,62;,
  3;58,64,63;,
  3;58,65,64;,
  3;58,66,65;,
  3;58,59,66;,
  4;59,60,68,67;,
  4;60,61,69,68;,
  4;61,62,70,69;,
  4;62,63,71,70;,
  4;63,64,72,71;,
  4;64,65,73,72;,
  4;65,66,74,73;,
  4;66,59,67,74;,
  4;67,68,76,75;,
  4;68,69,77,76;,
  4;69,70,78,77;,
  4;70,71,79,78;,
  4;71,72,80,79;,
  4;72,73,81,80;,
  4;73,74,82,81;,
  4;74,67,75,82;,
  4;75,76,84,83;,
  4;76,77,85,84;,
  4;77,78,86,85;,
  4;78,79,87,86;,
  4;79,80,88,87;,
  4;80,81,89,88;,
  4;81,82,90,89;,
  4;82,75,83,90;,
  4;83,84,92,91;,
  4;84,85,93,92;,
  4;85,86,94,93;,
  4;86,87,95,94;,
  4;87,88,96,95;,
  4;88,89,97,96;,
  4;89,90,98,97;,
  4;90,83,91,98;,
  4;91,92,100,99;,
  4;92,93,101,100;,
  4;93,94,102,101;,
  4;94,95,103,102;,
  4;95,96,104,103;,
  4;96,97,105,104;,
  4;97,98,106,105;,
  4;98,91,99,106;,
  4;99,100,108,107;,
  4;100,101,109,108;,
  4;101,102,110,109;,
  4;102,103,111,110;,
  4;103,104,112,111;,
  4;104,105,113,112;,
  4;105,106,114,113;,
  4;106,99,107,114;,
  3;107,108,115;,
  3;108,109,115;,
  3;109,110,115;,
  3;110,111,115;,
  3;111,112,115;,
  3;112,113,115;,
  3;113,114,115;,
  3;114,107,115;,
  3;116,118,117;,
  3;116,119,118;,
  3;116,120,119;,
  3;116,121,120;,
  3;116,122,121;,
  3;116,123,122;,
  3;116,124,123;,
  3;116,117,124;,
  4;117,118,126,125;,
  4;118,119,127,126;,
  4;119,120,128,127;,
  4;120,121,129,128;,
  4;121,122,130,129;,
  4;122,123,131,130;,
  4;123,124,132,131;,
  4;124,117,125,132;,
  4;125,126,134,133;,
  4;126,127,135,134;,
  4;127,128,136,135;,
  4;128,129,137,136;,
  4;129,130,138,137;,
  4;130,131,139,138;,
  4;131,132,140,139;,
  4;132,125,133,140;,
  4;133,134,142,141;,
  4;134,135,143,142;,
  4;135,136,144,143;,
  4;136,137,145,144;,
  4;137,138,146,145;,
  4;138,139,147,146;,
  4;139,140,148,147;,
  4;140,133,141,148;,
  4;141,142,150,149;,
  4;142,143,151,150;,
  4;143,144,152,151;,
  4;144,145,153,152;,
  4;145,146,154,153;,
  4;146,147,155,154;,
  4;147,148,156,155;,
  4;148,141,149,156;,
  4;149,150,158,157;,
  4;150,151,159,158;,
  4;151,152,160,159;,
  4;152,153,161,160;,
  4;153,154,162,161;,
  4;154,155,163,162;,
  4;155,156,164,163;,
  4;156,149,157,164;,
  4;157,158,166,165;,
  4;158,159,167,166;,
  4;159,160,168,167;,
  4;160,161,169,168;,
  4;161,162,170,169;,
  4;162,163,171,170;,
  4;163,164,172,171;,
  4;164,157,165,172;,
  3;165,166,173;,
  3;166,167,173;,
  3;167,168,173;,
  3;168,169,173;,
  3;169,170,173;,
  3;170,171,173;,
  3;171,172,173;,
  3;172,165,173;;
 }
 MeshTextureCoords {
  237;
  0.062500;0.000000;,
  0.125000;0.125000;,
  0.000000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.312500;0.000000;,
  0.375000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.562500;0.000000;,
  0.625000;0.125000;,
  0.687500;0.000000;,
  0.750000;0.125000;,
  0.812500;0.000000;,
  0.875000;0.125000;,
  0.937500;0.000000;,
  1.000000;0.125000;,
  0.125000;0.250000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.750000;0.250000;,
  0.875000;0.250000;,
  1.000000;0.250000;,
  0.125000;0.375000;,
  0.000000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.750000;0.375000;,
  0.875000;0.375000;,
  1.000000;0.375000;,
  0.125000;0.500000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.750000;0.500000;,
  0.875000;0.500000;,
  1.000000;0.500000;,
  0.125000;0.625000;,
  0.000000;0.625000;,
  0.250000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.625000;0.625000;,
  0.750000;0.625000;,
  0.875000;0.625000;,
  1.000000;0.625000;,
  0.125000;0.750000;,
  0.000000;0.750000;,
  0.250000;0.750000;,
  0.375000;0.750000;,
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  1.000000;0.750000;,
  0.125000;0.875000;,
  0.000000;0.875000;,
  0.250000;0.875000;,
  0.375000;0.875000;,
  0.500000;0.875000;,
  0.625000;0.875000;,
  0.750000;0.875000;,
  0.875000;0.875000;,
  1.000000;0.875000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;,
  0.062500;0.000000;,
  0.125000;0.125000;,
  0.000000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.312500;0.000000;,
  0.375000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.562500;0.000000;,
  0.625000;0.125000;,
  0.687500;0.000000;,
  0.750000;0.125000;,
  0.812500;0.000000;,
  0.875000;0.125000;,
  0.937500;0.000000;,
  1.000000;0.125000;,
  0.125000;0.250000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.750000;0.250000;,
  0.875000;0.250000;,
  1.000000;0.250000;,
  0.125000;0.375000;,
  0.000000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.750000;0.375000;,
  0.875000;0.375000;,
  1.000000;0.375000;,
  0.125000;0.500000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.750000;0.500000;,
  0.875000;0.500000;,
  1.000000;0.500000;,
  0.125000;0.625000;,
  0.000000;0.625000;,
  0.250000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.625000;0.625000;,
  0.750000;0.625000;,
  0.875000;0.625000;,
  1.000000;0.625000;,
  0.125000;0.750000;,
  0.000000;0.750000;,
  0.250000;0.750000;,
  0.375000;0.750000;,
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  1.000000;0.750000;,
  0.125000;0.875000;,
  0.000000;0.875000;,
  0.250000;0.875000;,
  0.375000;0.875000;,
  0.500000;0.875000;,
  0.625000;0.875000;,
  0.750000;0.875000;,
  0.875000;0.875000;,
  1.000000;0.875000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;,
  0.062500;0.000000;,
  0.125000;0.125000;,
  0.000000;0.125000;,
  0.187500;0.000000;,
  0.250000;0.125000;,
  0.312500;0.000000;,
  0.375000;0.125000;,
  0.437500;0.000000;,
  0.500000;0.125000;,
  0.562500;0.000000;,
  0.625000;0.125000;,
  0.687500;0.000000;,
  0.750000;0.125000;,
  0.812500;0.000000;,
  0.875000;0.125000;,
  0.937500;0.000000;,
  1.000000;0.125000;,
  0.125000;0.250000;,
  0.000000;0.250000;,
  0.250000;0.250000;,
  0.375000;0.250000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.750000;0.250000;,
  0.875000;0.250000;,
  1.000000;0.250000;,
  0.125000;0.375000;,
  0.000000;0.375000;,
  0.250000;0.375000;,
  0.375000;0.375000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.750000;0.375000;,
  0.875000;0.375000;,
  1.000000;0.375000;,
  0.125000;0.500000;,
  0.000000;0.500000;,
  0.250000;0.500000;,
  0.375000;0.500000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.750000;0.500000;,
  0.875000;0.500000;,
  1.000000;0.500000;,
  0.125000;0.625000;,
  0.000000;0.625000;,
  0.250000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.625000;0.625000;,
  0.750000;0.625000;,
  0.875000;0.625000;,
  1.000000;0.625000;,
  0.125000;0.750000;,
  0.000000;0.750000;,
  0.250000;0.750000;,
  0.375000;0.750000;,
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  1.000000;0.750000;,
  0.125000;0.875000;,
  0.000000;0.875000;,
  0.250000;0.875000;,
  0.375000;0.875000;,
  0.500000;0.875000;,
  0.625000;0.875000;,
  0.750000;0.875000;,
  0.875000;0.875000;,
  1.000000;0.875000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;;
 }
}