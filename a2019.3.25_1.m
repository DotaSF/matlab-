vec=[4 5 2 8 4 7 2 64 2 57 2 45 7 43 2 5 7 3 3 6253 3 4 3 0 -65 -343];
vecR=vec';
a=vec(1:13);
b=vec(14:26);
vecB(1:13)=b;
vecB(14:26)=a;
small=vec<45;
vecS=vec(small);
vec3R=vec(end:-3:1);
vecN=find(vec==2|vec==4);
[value]=vecN(find(mod(vecN,2)));
vec(value)=0;
vec(vec==0)=[];
vecG=vec;
