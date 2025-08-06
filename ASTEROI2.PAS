uses crt,dos;
const b=18;{£ãáâ®â }a=4;{à §­®®¡à §¨¥}dl=1;{áª®à®áâì}veroi=3000{¢¥à®ïâ­®áâì ä¨è¥ª};
var zub,def,chdef,chvn1,vn1,xk,vn,chvn,v1x,v1y,r1,rx1,r,rx,ry,ruk,fun,finish,finx,fin,iii,col,
change,rz,nr,z,zkx,zky,cx,cy,i1,xo,cap5x,cap5y,cap5,cap7x,cap7y,cap7,cap11x,cap11y,cap11,
idef,def1,cap12x,cap12y,cap12,r2,rx2,ry2,kkk,ccc,xxx,yyy,cap13x,cap13y,cap13,ry3,r3,rx3
,cap1x,cap1y,cap1,cap10x,cap10y,cap10,cap9x,cap9y,cap9,cap8x,cap8y,cap8,cap6x,cap6y,cap6,cap4x,cap4y,
cel,cap14x,cap14y,cap14,v2x,v2y,cap15x,cap15y,cap15,r4,r4x,r4y,v3x,cap16x,cap16y,cap16,
cap17x,cap17y,cap17,chet,cap18x,cap18y,cap18,
cap4,cap3x,cap3y,cap3,cap2x,cap2y,cap2,ix,iy,xm,ym,aaa,baa:integer;u:char;
metx:array[1..20]of integer;
mety:array[1..20]of integer;
sus:array[1..20]of integer;
min:array[1..20]of integer;
speed:array[1..20]of integer;
r5:array[1..20]of integer;
r5y:array[1..20]of integer;
r5x:array[1..20]of integer;
nx:array[1..20]of integer;
ny:array[1..20]of integer;
caa,daa:boolean;
cho,chfun,chmin:longint;
reg:registers;

procedure initmouse(var success:boolean; var num:integer);
begin
reg.ax:=0;
intr($33,reg);
if reg.ax=0 then success:=false
else success:=true;
num:=reg.bx;
end;

procedure showcursor;
begin
reg.ax:=1;
intr($33,reg);
end;

procedure putcursor(x,y:integer);
begin
with reg do
begin
ax:=4;
cx:=x;
dx:=y;
end;
intr($33,reg);
end;

procedure hidecursor;
begin
reg.ax:=2;
intr($33,reg);
end;


procedure mousecondition(var x,y:integer;var left,right:boolean);
begin
reg.ax:=3;
intr($33,reg);
x:=reg.cx;y:=reg.dx;
if reg.bx and 1=0 then left:=false
else left:=true;
if reg.bx and 2=0 then right:=false
else right:=true;
end;

procedure roun(cx,cy,rad:integer);
var xx1,yy1:integer;
begin
for xx1:=-rad to rad do begin
 for yy1:=-rad to rad do begin

  if xx1*xx1+yy1*yy1<=rad*rad then begin
  if (cx+2*xx1>0)and(cx+2*xx1<81)and(cy+yy1>0)and(cy+yy1<25) then begin
	gotoxy(cx+2*xx1,cy+yy1);
	if cx+2*xx1<>80 then write('ÛÛ') else write('Û');
	end;
  end;
 end;
end;
end;

procedure txc(xx1:integer);
begin
if def1=0 then
case ((cho+xx1) mod 3) of
0:textcolor(3);
1:textcolor(1);
2:textcolor(11);
end
else if def=0 then
case ((cho+xx1) mod 3) of
0:textcolor(4);
1:textcolor(12);
2:textcolor(15);
end
else
case ((cho+xx1) mod 3) of
0:textcolor(14);
1:textcolor(10);
2:textcolor(2);
end

end;

procedure defris(xx1:integer);
begin
if (xx1>3)and(iy>2)and(xx1<84) then begin
txc(0);
gotoxy(xx1-3,iy-2);write('Ú');
end;
if (iy>2)and(xx1<83)and(xx1>2) then begin
txc(1);
gotoxy(xx1-2,iy-2);write('Ä');
end;
if (iy>2)and(xx1<82)and(xx1>1) then begin
txc(2);
gotoxy(xx1-1,iy-2);write('Ä');
end;
if (iy>2)and(xx1<81)and(xx1>0) then begin
txc(0);
gotoxy(xx1,iy-2);write('¿');
end;
txc(1);
if (xx1<81)and(xx1>0) then begin
gotoxy(xx1,iy-1);write('À');
end;
txc(2);
if (xx1<80)and(xx1>-1) then begin
gotoxy(xx1+1,iy-1);write('Ä');
end;
txc(0);
if (xx1<79)and(xx1>-2) then begin
gotoxy(xx1+2,iy-1);write('Ä');
end;
txc(1);
if (xx1<78)and(xx1>-3) then begin
gotoxy(xx1+3,iy-1);write('Ä');
end;
txc(2);
if (xx1<77)and(xx1>-4) then begin
gotoxy(xx1+4,iy-1);write('¿');
end;
txc(0);
if (xx1<77)and(xx1>-4) then begin
gotoxy(xx1+4,iy);write('³');
end;
txc(1);
if (xx1<77)and(xx1>-4) then begin
gotoxy(xx1+4,iy+1);write('Ù');
end;
txc(2);
if (xx1<78)and(xx1>-3) then begin
gotoxy(xx1+3,iy+1);write('Ä');
end;
txc(0);
if (xx1<79)and(xx1>-2) then begin
gotoxy(xx1+2,iy+1);write('Ä');
end;
txc(1);
if (xx1<80)and(xx1>-1) then begin
gotoxy(xx1+1,iy+1);write('Ä');
end;
txc(2);
if (xx1<81)and(xx1>0) then begin
gotoxy(xx1,iy+1);write('Ú');
end;
if (iy<23)and(xx1<81)and(xx1>0) then begin
txc(0);
gotoxy(xx1,iy+2);write('Ù');
end;
if (iy<23)and(xx1<82)and(xx1>1) then begin
txc(1);
gotoxy(xx1-1,iy+2);write('Ä');
end;
if (iy<23)and(xx1<83)and(xx1>2) then begin
txc(2);
gotoxy(xx1-2,iy+2);write('Ä');
end;

if (iy<23)and(xx1>3)and(xx1<84) then begin
txc(0);
gotoxy(xx1-3,iy+2);write('À');
end;
if (xx1>3)and(xx1<84) then begin
txc(1);
gotoxy(xx1-3,iy+1);write('³');
end;
if (xx1>3)and(xx1<84) then begin
txc(2);
gotoxy(xx1-3,iy);write('³');
end;
if (xx1>3)and(xx1<84) then begin
txc(0);
gotoxy(xx1-3,iy-1);write('³');
end;
end;

procedure defster(xx1:integer);
begin
if (xx1>3)and(iy>2)and(xx1<84) then begin
gotoxy(xx1-3,iy-2);write(' ');
end;
if (iy>2)and(xx1<83)and(xx1>2) then begin
gotoxy(xx1-2,iy-2);write(' ');
end;
if (iy>2)and(xx1<82)and(xx1>1) then begin
gotoxy(xx1-1,iy-2);write(' ');
end;
if (iy>2)and(xx1<81)and(xx1>0) then begin
gotoxy(xx1,iy-2);write(' ');
end;
if (xx1<81)and(xx1>0) then begin
gotoxy(xx1,iy-1);write(' ');
end;
if (xx1<80)and(xx1>-1) then begin
gotoxy(xx1+1,iy-1);write(' ');
end;
if (xx1<79)and(xx1>-2) then begin
gotoxy(xx1+2,iy-1);write(' ');
end;
if (xx1<78)and(xx1>-3) then begin
gotoxy(xx1+3,iy-1);write(' ');
end;if (xx1<77)and(xx1>-4) then begin
gotoxy(xx1+4,iy-1);write(' ');
end;if (xx1<77)and(xx1>-4) then begin
gotoxy(xx1+4,iy);write(' ');
end;if (xx1<77)and(xx1>-4) then begin
gotoxy(xx1+4,iy+1);write(' ');
end;if (xx1<78)and(xx1>-3) then begin
gotoxy(xx1+3,iy+1);write(' ');
end;if (xx1<79)and(xx1>-2) then begin
gotoxy(xx1+2,iy+1);write(' ');
end;if (xx1<80)and(xx1>-1) then begin
gotoxy(xx1+1,iy+1);write(' ');
end;if (xx1<81)and(xx1>0) then begin
gotoxy(xx1,iy+1);write(' ');
end;
if (iy<23)and(xx1<81)and(xx1>0) then begin
gotoxy(xx1,iy+2);write(' ');
end;
if (iy<23)and(xx1<82)and(xx1>1) then begin
gotoxy(xx1-1,iy+2);write(' ');
end;
if (iy<23)and(xx1<83)and(xx1>2) then begin
gotoxy(xx1-2,iy+2);write(' ');
end;
if (iy<23)and(xx1>3)and(xx1<84) then begin
gotoxy(xx1-3,iy+2);write(' ');
end;
if (xx1>3)and(xx1<84) then begin
gotoxy(xx1-3,iy+1);write(' ');
end;
if (xx1>3)and(xx1<84) then begin
gotoxy(xx1-3,iy);write(' ');
end;
if (xx1>3)and(xx1<84) then begin
gotoxy(xx1-3,iy-1);write(' ');
end;


end;

procedure iris(xx1:integer);
begin
textcolor(15);
if (xx1<83)and(xx1>2) then begin
gotoxy(xx1-2,iy-1);write('Þ');
end;
if (xx1<82)and(xx1>1) then begin
gotoxy(xx1-1,iy-1);write('Û');
end;

textcolor(11);
textbackground(7);

if (xx1<83)and(xx1>2) then begin
gotoxy(xx1-2,iy);write(' ');
end;
if (xx1<82)and(xx1>1) then begin
gotoxy(xx1-1,iy);write('ý');
end;

textcolor(15);
if (xx1<80)and(xx1>-1) then begin
gotoxy(xx1+1,iy);write('Û');
end;
if (xx1<79)and(xx1>-2) then begin
gotoxy(xx1+2,iy);write('Û');
end;
if (xx1<78)and(xx1>-3) then begin
gotoxy(xx1+3,iy);write(' ');
end;

textbackground(0);
if (xx1<83)and(xx1>2) then begin
gotoxy(xx1-2,iy+1);write('Þ');
end;
if (xx1<82)and(xx1>1) then begin
gotoxy(xx1-1,iy+1);write('Û');
end;

textcolor(1);
if (xx1<81)and(xx1>0) then begin
gotoxy(xx1,iy);write('Û');
end;
if (def=1)or(def1=1) then
defris(xx1);
end;


procedure rcap1(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(1);textcolor(11);gotoxy(xx1,yy1);write(chr(24));
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(1);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap2(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(7);textcolor(4);gotoxy(xx1,yy1);write('+');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(7);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap3(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(5);textcolor(14);gotoxy(xx1,yy1);write('º');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(5);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap4(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(4);textcolor(15);gotoxy(xx1,yy1);write(chr(18));
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(4);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap5(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(3);textcolor(8);gotoxy(xx1,yy1);write(chr(16));
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(3);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap6(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(1);textcolor(15);gotoxy(xx1,yy1);write(chr(18));
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(1);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap7(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(7);textcolor(0);gotoxy(xx1,yy1);write('?');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(7);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap8(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(4);textcolor(12);gotoxy(xx1,yy1);write(chr(18));
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(4);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap9(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(1);textcolor(15);gotoxy(xx1,yy1);write('');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(1);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap10(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(2);textcolor(14);gotoxy(xx1,yy1);write(chr(26));
end;
if (xx1>-1)and(xx1<80) then begin
textcolor(14);
textbackground(2);gotoxy(xx1+1,yy1);write('*');
end;
textbackground(0);
end;

procedure rcap11(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(4);textcolor(15);gotoxy(xx1,yy1);write('');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(4);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap12(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(3);textcolor(4);gotoxy(xx1,yy1);write(chr(24));
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(3);textcolor(14);gotoxy(xx1+1,yy1);write(chr(15));
end;
textbackground(0);
end;

procedure rcap13(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(2);textcolor(15);gotoxy(xx1,yy1);write(chr(24));
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(2);textcolor(11);gotoxy(xx1+1,yy1);write('+');
end;
textbackground(0);
end;

procedure rcap14(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(5);textcolor(14);gotoxy(xx1,yy1);write('³');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(5);textcolor(14);gotoxy(xx1+1,yy1);write('³');
end;
textbackground(0);
end;

procedure rcap15(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(7);textcolor(2);gotoxy(xx1,yy1);write(chr(26));
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(7);textcolor(1);gotoxy(xx1+1,yy1);write(')');
end;
textbackground(0);
end;

procedure rcap16(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(5);textcolor(14);gotoxy(xx1,yy1);write('º');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(5);textcolor(14);gotoxy(xx1+1,yy1);write('º');
end;
textbackground(0);
end;

procedure rcap17(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(3);textcolor(10);gotoxy(xx1,yy1);write('ý');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(3);gotoxy(xx1+1,yy1);write(' ');
end;
textbackground(0);
end;

procedure rcap18(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
textbackground(7);textcolor(26);gotoxy(xx1,yy1);write('ø');
end;
if (xx1>-1)and(xx1<80) then begin
textbackground(7);textcolor(0);gotoxy(xx1+1,yy1);write('#');
end;
textbackground(0);
end;


procedure stercap(xx1,yy1:integer);
begin
if (xx1>0)and(xx1<81) then begin
gotoxy(xx1,yy1);write(' ');
end;
if (xx1>-1)and(xx1<80) then begin
gotoxy(xx1+1,yy1);write(' ');
end;
end;


procedure isches(xx1,yy1:integer);
begin
textcolor(15);
if (xx1>0)and(xx1<81) then begin
gotoxy(xx1,yy1);write(chr(15));
end;
if (xx1>-1)and(xx1<80) then begin
gotoxy(xx1+1,yy1);write(chr(15));
end;
delay(round(250*dl));
if (xx1>0)and(xx1<81) then begin
gotoxy(xx1,yy1);write('*');
end;
if (xx1>-1)and(xx1<80) then begin
gotoxy(xx1+1,yy1);write('*');
end;
delay(round(250*dl));
if (xx1>0)and(xx1<81) then begin
gotoxy(xx1,yy1);write('+');
end;
if (xx1>-1)and(xx1<80) then begin
gotoxy(xx1+1,yy1);write('+');
end;
delay(round(250*dl));
if (xx1>0)and(xx1<81) then begin
gotoxy(xx1,yy1);write('.');
end;
if (xx1>-1)and(xx1<80) then begin
gotoxy(xx1+1,yy1);write('.');
end;
delay(round(250*dl));
if (xx1>0)and(xx1<81) then begin
gotoxy(xx1,yy1);write(' ');
end;
if (xx1>-1)and(xx1<80) then begin
gotoxy(xx1+1,yy1);write(' ');
end;
end;

procedure ister(xx1:integer);
begin
if (xx1<83)and(xx1>2) then begin
gotoxy(xx1-2,iy-1);write(' ');
end;
if (xx1<82)and(xx1>1) then begin
gotoxy(xx1-1,iy-1);write(' ');
end;
if (xx1<83)and(xx1>2) then begin
gotoxy(xx1-2,iy+1);write(' ');
end;
if (xx1<82)and(xx1>1) then begin
gotoxy(xx1-1,iy+1);write(' ');
end;
if (xx1<83)and(xx1>2) then begin
gotoxy(xx1-2,iy);write(' ');
end;
if (xx1<82)and(xx1>1) then begin
gotoxy(xx1-1,iy);write(' ');
end;
if (xx1<81)and(xx1>0) then begin
gotoxy(xx1,iy);write(' ');
end;
if (xx1<80)and(xx1>-1) then begin
gotoxy(xx1+1,iy);write(' ');
end;
if (xx1<79)and(xx1>-2) then begin
gotoxy(xx1+2,iy);write(' ');
end;
if (xx1<78)and(xx1>-3) then begin
gotoxy(xx1+3,iy);write(' ');
end;

if (def=1)or(def1=1) then defster(xx1);
end;

procedure sound3;
begin
for xo:=70 to 75 do begin
sound(xo);
delay(round(60*dl));
nosound;
end;
end;

procedure sound1;
begin
for xo:=500 to 1000 do begin
sound(xo);
delay(1);
end;
nosound;
end;

procedure vzriv(alfa:integer);

begin
z:=random(5);
case z of
1:z:=4;
2:z:=11;
3:z:=12;
4:z:=15;
0:z:=14;
end;
for rz:=1 to 3 do begin
for zkx:=-rz to rz do begin
for zky:=-rz to rz do begin
if (zkx*zkx+zky*zky=rz*rz)or(zkx*zkx+zky*zky=rz*rz-1)or(zkx*zkx+zky*zky=rz*rz-2)or(zkx*zkx+zky*zky=rz*rz-3)or
(zkx*zkx+zky*zky=rz*rz-5)
then begin
if (cx+2*zkx>0)and(cx+2*zkx<81)and(cy+zky>0)and(cy+zky<25) then begin
gotoxy(cx+2*zkx,cy+zky);
if alfa=1 then begin
textcolor(z);
write('*');
end
else begin
textcolor(6);
write('Û');
end;
end;
end;
end;
end;
delay(round((500 div alfa)*dl));
for zkx:=-rz to rz do begin
for zky:=-rz to rz do begin
if (zkx*zkx+zky*zky=rz*rz)or(zkx*zkx+zky*zky=rz*rz-1)or(zkx*zkx+zky*zky=rz*rz-2)or(zkx*zkx+zky*zky=rz*rz-3)or
(zkx*zkx+zky*zky=rz*rz-5)
then begin
if (cx+2*zkx>0)and(cx+2*zkx<81)and(cy+zky>0)and(cy+zky<25)
then begin
gotoxy(cx+2*zkx,cy+zky);
write(' ');
end;
end;
end;
end;

end;

end;

procedure meteor(xx1,yy1,it:integer);
var che:integer;
begin
if (xx1>0)and(yy1>0)and(yy1<25) then
begin
che:=-1;
repeat
inc(che);
gotoxy(xx1+che,yy1);write('Û');
until (che=6)or(xx1+che=80);
end
else
if (xx1<=0)and(xx1>-6)and(yy1>0)and(yy1<25) then begin
che:=0;
repeat
inc(che);
gotoxy(che,yy1);write('Û');
until (che=xx1+6);

end;
if yy1>1 then begin
if (xx1>-2)and(xx1<79)and(yy1>2)and(yy1<26) then
begin
che:=-1;
repeat
inc(che);
gotoxy(xx1+che+2,yy1-1);write('Û');
until (che=2)or(xx1+che+2=80);
end
else
if (xx1<=0)and(xx1>-4)and(yy1>2)and(yy1<26) then begin
che:=0;
repeat
inc(che);
gotoxy(che,yy1-1);write('Û');
until (che=xx1+4);

end;
end;

if yy1<24 then begin
if (xx1>-2)and(xx1<79)and(yy1>0)and(yy1<24) then
begin
che:=-1;
repeat
inc(che);
gotoxy(xx1+che+2,yy1+1);write('Û');
until (che=2)or(xx1+che+2=80);
end
else
if (xx1<=0)and(xx1>-4)and(yy1>0)and(yy1<24) then begin
che:=0;
repeat
inc(che);
gotoxy(che,yy1+1);write('Û');
until (che=xx1+4);

end;
end;
if it=1 then begin
textbackground(7);
textcolor(30);
if (xx1>-2)and(xx1<79)and(yy1>0)and(yy1<25) then begin
gotoxy(xx1+2,yy1);write('ø');
end;
textcolor(0);
if (xx1>-3)and(xx1<78)and(yy1>0)and(yy1<25) then begin
gotoxy(xx1+3,yy1);write('#');
end;
textbackground(0);
end;
end;

procedure finris(xx2:integer);
var che:integer;
begin
if xx2>0 then begin
for che:=1 to 24 do begin
textcolor(11);
gotoxy(xx2,che);write('Ü');
end;
textcolor(14);
gotoxy(xx2,1);write('Û');
gotoxy(xx2,24);write('Û');
end;
if (xx2>-1)and(xx2<80) then begin
for che:=1 to 24 do begin
textcolor(11);
gotoxy(xx2+1,che);write('ß');
end;
textcolor(14);
gotoxy(xx2+1,1);write('Û');
gotoxy(xx2+1,24);write('Û');
textcolor(13);
gotoxy(xx2+1,10);write('”');
gotoxy(xx2+1,11);write('ˆ');
gotoxy(xx2+1,12);write('');
gotoxy(xx2+1,13);write('ˆ');
gotoxy(xx2+1,14);write('˜');
end;
if (xx2>-2)and(xx2<79) then begin
for che:=1 to 24 do begin
textcolor(11);
gotoxy(xx2+2,che);write('Ü');
end;
textcolor(14);
gotoxy(xx2+2,1);write('Û');
gotoxy(xx2+2,24);write('Û');

end;

end;

procedure fincleen(xx3:integer);
var che:integer;
begin
if (xx3>0)and(xx3<81) then
for che:=1 to 24 do begin
textbackground(0);
gotoxy(xx3,che);write(' ');
end;
if (xx3>-1)and(xx3<80) then
for che:=1 to 24 do begin
textbackground(0);
gotoxy(xx3+1,che);write(' ');
end;
if (xx3>-2)and(xx3<79) then
for che:=1 to 24 do begin
textbackground(0);
gotoxy(xx3+2,che);write(' ');
end;

end;

procedure v;
begin
ister(ix);
if iy>=3 then iy:=iy-1;
iris(ix);
end;

procedure n;
begin
ister(ix);
if iy<=22 then iy:=iy+1;
iris(ix);
end;

procedure p;
begin
ister(ix);
if ix<=26 then ix:=ix+1;
iris(ix);
end;

procedure l;
begin
ister(ix);
if ix>=4 then ix:=ix-1;
iris(ix);
end;

procedure srt(srr,ssr:integer);
begin
gotoxy(srr,ssr);write('.');
end;

procedure star;
begin
textcolor(15);
srt(49,4);srt(67,2);srt(75,2);srt(69,6);srt(59,7);srt(45,9);srt(69,10);srt(75,10);srt(35,10);
srt(13,12);srt(9,13);srt(35,13);srt(43,13);srt(49,14);srt(63,13);srt(73,13);srt(25,15);srt(17,16);
srt(11,18);srt(5,15);srt(11,24);srt(19,21);srt(23,23);srt(27,19);srt(35,17);srt(41,20);srt(47,18);
srt(61,17);srt(76,15);srt(59,20);srt(47,23);srt(54,24);srt(73,24);srt(71,19);
srt(1,10);srt(20,5);srt(7,3);srt(28,1);srt(10,8);srt(23,12);srt(12,7);srt(17,2);
end;

procedure caps;
begin
{ä¨èª¨}
begin
{1}
if cap1=1 then begin
stercap(cap1x,cap1y);
inc(cap1x,-1);
rcap1(cap1x,cap1y);
end;

begin
if (cap1=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap1:=1;cap1x:=80;cap1y:=random(24)+1;end;
end;

if (cap1x<=ix+4)and(cap1x>=ix-3)and(cap1y>=iy-1)and(cap1y<=iy+1)and(cap1=1) then
begin
isches(cap1x,cap1y);
iris(ix);
ruk:=1;
cap1:=0;
cap1x:=0;
cap1y:=0;
end;

if cap1x=-2 then begin
cap1:=0;
cap1x:=0;
cap1y:=0;
end;
end;

{2}
if cap2=1 then begin
stercap(cap2x,cap2y);
inc(cap2x,-1);
rcap2(cap2x,cap2y);
end;

begin
if (cap2=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap2:=1;cap2x:=80;cap2y:=random(24)+1;end;
end;

if (cap2x<=ix+4)and(cap2x>=ix-3)and(cap2y>=iy-1)and(cap2y<=iy+1)and(cap2=1) then
begin
isches(cap2x,cap2y);
iris(ix);
inc(i1,5);
cap2:=0;
cap2x:=0;
cap2y:=0;
end;

if cap2x=-2 then begin
cap2:=0;
cap2x:=0;
cap2y:=0;
end;
end;

{3}
if cap3=1 then begin
stercap(cap3x,cap3y);
inc(cap3x,-1);
rcap3(cap3x,cap3y);
end;

begin
if (cap3=0)and(fun<>1)then begin
change:=random(veroi);
if change=0 then begin cap3:=1;cap3x:=80;cap3y:=random(24)+1;end;
end;

if (cap3x<=ix+4)and(cap3x>=ix-3)and(cap3y>=iy-1)and(cap3y<=iy+1)and(cap3=1) then
begin
isches(cap3x,cap3y);
iris(ix);
ruk:=3;
cap3:=0;
cap3x:=0;
cap3y:=0;
end;

if cap3x=-2 then begin
cap3:=0;
cap3x:=0;
cap3y:=0;
end;
end;

{4}
if cap4=1 then begin
stercap(cap4x,cap4y);
inc(cap4x,-1);
rcap4(cap4x,cap4y);
end;

begin
if (cap4=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap4:=1;cap4x:=80;cap4y:=random(24)+1;end;
end;

if (cap4x<=ix+4)and(cap4x>=ix-3)and(cap4y>=iy-1)and(cap4y<=iy+1)and(cap4=1)then
begin
if not((def=1)and(def1=1)) then begin
isches(cap4x,cap4y);
vn:=1;
chvn:=cho;
cap4:=0;
cap4x:=0;
cap4y:=0;
end;
iris(ix);
end;

if cap4x=-2 then begin
cap4:=0;
cap4x:=0;
cap4y:=0;
end;
end;

{5}
if cap5=1 then begin
stercap(cap5x,cap5y);
inc(cap5x,-1);
rcap5(cap5x,cap5y);
end;

begin
if (cap5=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap5:=1;cap5x:=80;cap5y:=random(24)+1;end;
end;

if (cap5x<=ix+4)and(cap5x>=ix-3)and(cap5y>=iy-1)and(cap5y<=iy+1)and(cap5=1) then
begin
isches(cap5x,cap5y);
iris(ix);
ruk:=5;
cap5:=0;
cap5x:=0;
cap5y:=0;
end;

if cap5x=-2 then begin
cap5:=0;
cap5x:=0;
cap5y:=0;
end;
end;


{6}
if cap6=1 then begin
stercap(cap6x,cap6y);
inc(cap6x,-1);
rcap6(cap6x,cap6y);
end;

begin
if (cap6=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap6:=1;cap6x:=80;cap6y:=random(24)+1;end;
end;

if (cap6x<=ix+4)and(cap6x>=ix-3)and(cap6y>=iy-1)and(cap6y<=iy+1)and(cap6=1) then
begin
isches(cap6x,cap6y);
vn:=0;
vn1:=0;
cap6:=0;
cap6x:=0;
cap6y:=0;
iris(ix);
end;

if cap6x=-2 then begin
cap6:=0;
cap6x:=0;
cap6y:=0;
end;
end;

{7
if cap7=1 then begin
stercap(cap7x,cap7y);
inc(cap7x,-1);
rcap7(cap7x,cap7y);
end;

begin
if (cap7=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap7:=1;cap7x:=80;cap7y:=random(24)+1;end;
end;

if (cap7x<=ix+4)and(cap7x>=ix-3)and(cap7y>=iy-1)and(cap7y<=iy+1)and(cap7=1) then
begin
isches(cap7x,cap7y);
iris(ix);
change:=random(14);
case change of
0:ruk:=1;
1:inc(i1,5);
2:ruk:=3;
3:begin vn:=1;
chvn:=cho;
end;
4:ruk:=5;
5:begin vn:=0;
vn1:=0;
end;
6:begin vn1:=1;
chvn1:=cho;
end;
7:begin if ruk=11 then ruk:=2
else
ruk:=9;
end;
8:ruk:=10;
9:begin if ruk=9 then ruk:=2
else
ruk:=11;
end;
10:ruk:=12;
11:ruk:=13;
12:ruk:=14;
13:ruk:=15;
end;
cap7:=0;
cap7x:=0;
cap7y:=0;
end;

if cap7x=-2 then begin
cap7:=0;
cap7x:=0;
cap7y:=0;
end;
end;




{8}
if cap8=1 then begin
stercap(cap8x,cap8y);
inc(cap8x,-1);
rcap8(cap8x,cap8y);
end;

begin
if (cap8=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap8:=1;cap8x:=80;cap8y:=random(24)+1;end;
end;

if (cap8x<=ix+4)and(cap8x>=ix-3)and(cap8y>=iy-1)and(cap8y<=iy+1)and(cap8=1) then
begin
if not((def=1)and(def1=1))then begin
isches(cap8x,cap8y);
vn1:=1;
chvn1:=cho;
cap8:=0;
cap8x:=0;
cap8y:=0;
end;
iris(ix);
end;

if cap8x=-2 then begin
cap8:=0;
cap8x:=0;
cap8y:=0;
end;
end;

{9}
if cap9=1 then begin
stercap(cap9x,cap9y);
inc(cap9x,-1);
rcap9(cap9x,cap9y);
end;

begin
if (cap9=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap9:=1;cap9x:=80;cap9y:=random(24)+1;end;
end;

if (cap9x<=ix+4)and(cap9x>=ix-3)and(cap9y>=iy-1)and(cap9y<=iy+1)and(cap9=1) then
begin
isches(cap9x,cap9y);
iris(ix);
if ruk=11 then ruk:=2
else
ruk:=9;
cap9:=0;
cap9x:=0;
cap9y:=0;
end;

if cap9x=-2 then begin
cap9:=0;
cap9x:=0;
cap9y:=0;
end;
end;

if cap10=1 then begin
stercap(cap10x,cap10y);
inc(cap10x,-1);
rcap10(cap10x,cap10y);
end;

begin
if (cap10=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap10:=1;cap10x:=80;cap10y:=random(24)+1;end;
end;

if (cap10x<=ix+4)and(cap10x>=ix-3)and(cap10y>=iy-1)and(cap10y<=iy+1)and(cap10=1) then
begin
isches(cap10x,cap10y);
iris(ix);
ruk:=10;
cap10:=0;
cap10x:=0;
cap10y:=0;
end;

if cap10x=-2 then begin
cap10:=0;
cap10x:=0;
cap10y:=0;
end;
end;

{11}
if cap11=1 then begin
stercap(cap11x,cap11y);
inc(cap11x,-1);
rcap11(cap11x,cap11y);
end;

begin
if (cap11=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap11:=1;cap11x:=80;cap11y:=random(24)+1;end;
end;

if (cap11x<=ix+4)and(cap11x>=ix-3)and(cap11y>=iy-1)and(cap11y<=iy+1)and(cap11=1) then
begin
isches(cap11x,cap11y);
iris(ix);
if ruk=9 then ruk:=2
else
ruk:=11;
cap11:=0;
cap11x:=0;
cap11y:=0;
end;

if cap11x=-2 then begin
cap11:=0;
cap11x:=0;
cap11y:=0;
end;
end;

{12}
if cap12=1 then begin
stercap(cap12x,cap12y);
inc(cap12x,-1);
rcap12(cap12x,cap12y);
end;

begin
if (cap12=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap12:=1;cap12x:=80;cap12y:=random(24)+1;end;
end;

if (cap12x<=ix+4)and(cap12x>=ix-3)and(cap12y>=iy-1)and(cap12y<=iy+1)and(cap12=1) then
begin
isches(cap12x,cap12y);
iris(ix);
ruk:=12;
cap12:=0;
cap12x:=0;
cap12y:=0;
end;

if cap12x=-2 then begin
cap12:=0;
cap12x:=0;
cap12y:=0;
end;
end;


{13}
if cap13=1 then begin
stercap(cap13x,cap13y);
inc(cap13x,-1);
rcap13(cap13x,cap13y);
end;

begin
if (cap13=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap13:=1;cap13x:=80;cap13y:=random(24)+1;end;
end;

if (cap13x<=ix+4)and(cap13x>=ix-3)and(cap13y>=iy-1)and(cap13y<=iy+1)and(cap13=1) then
begin
isches(cap13x,cap13y);
iris(ix);
ruk:=13;
cap13:=0;
cap13x:=0;
cap13y:=0;
end;

if cap13x=-2 then begin
cap13:=0;
cap13x:=0;
cap13y:=0;
end;
end;

{14}
if cap14=1 then begin
stercap(cap14x,cap14y);
inc(cap14x,-1);
rcap14(cap14x,cap14y);
end;

begin
if (cap14=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap14:=1;cap14x:=80;cap14y:=random(24)+1;end;
end;

if (cap14x<=ix+4)and(cap14x>=ix-3)and(cap14y>=iy-1)and(cap14y<=iy+1)and(cap14=1) then
begin
isches(cap14x,cap14y);
iris(ix);
ruk:=14;
cap14:=0;
cap14x:=0;
cap14y:=0;
end;

if cap14x=-2 then begin
cap14:=0;
cap14x:=0;
cap14y:=0;
end;
end;

{15}
if cap15=1 then begin
stercap(cap15x,cap15y);
inc(cap15x,-1);
rcap15(cap15x,cap15y);
end;

begin
if (cap15=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap15:=1;cap15x:=80;cap15y:=random(24)+1;end;
end;

if (cap15x<=ix+4)and(cap15x>=ix-3)and(cap15y>=iy-1)and(cap15y<=iy+1)and(cap15=1) then
begin
isches(cap15x,cap15y);
iris(ix);
ruk:=15;
cap15:=0;
cap15x:=0;
cap15y:=0;
end;

if cap15x=-2 then begin
cap15:=0;
cap15x:=0;
cap15y:=0;
end;
end;

{16}
if cap16=1 then begin
stercap(cap16x,cap16y);
inc(cap16x,-1);
rcap16(cap16x,cap16y);
end;

begin
if (cap16=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap16:=1;cap16x:=80;cap16y:=random(24)+1;end;
end;

if (cap16x<=ix+4)and(cap16x>=ix-3)and(cap16y>=iy-1)and(cap16y<=iy+1)and(cap16=1) then
begin
isches(cap16x,cap16y);
iris(ix);
ruk:=16;
cap16:=0;
cap16x:=0;
cap16y:=0;
end;

if cap16x=-2 then begin
cap16:=0;
cap16x:=0;
cap16y:=0;
end;
end;

{17}
if cap17=1 then begin
stercap(cap17x,cap17y);
inc(cap17x,-1);
rcap17(cap17x,cap17y);
end;

begin
if (cap17=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap17:=1;cap17x:=80;cap17y:=random(24)+1;end;
end;

if (cap17x<=ix+4)and(cap17x>=ix-3)and(cap17y>=iy-1)and(cap17y<=iy+1)and(cap17=1) then
begin
isches(cap17x,cap17y);
iris(ix);
ruk:=17;
cap17:=0;
cap17x:=0;
cap17y:=0;
end;

if cap17x=-2 then begin
cap17:=0;
cap17x:=0;
cap17y:=0;
end;
end;

{18}
if cap18=1 then begin
stercap(cap18x,cap18y);
inc(cap18x,-1);
rcap18(cap18x,cap18y);
end;

begin
if (cap18=0)and(fun<>1) then begin
change:=random(veroi);
if change=0 then begin cap18:=1;cap18x:=80;cap18y:=random(24)+1;end;
end;

if (cap18x<=ix+4)and(cap18x>=ix-3)and(cap18y>=iy-1)and(cap18y<=iy+1)and(cap18=1) then
begin
isches(cap18x,cap18y);
iris(ix);
ruk:=18;
cap18:=0;
cap18x:=0;
cap18y:=0;
end;

if cap18x=-2 then begin
cap18:=0;
cap18x:=0;
cap18y:=0;
end;
end;




end;

end;

procedure sthyp;
begin
if cap1=1 then rcap1(cap1x,cap1y);
if cap2=1 then rcap2(cap2x,cap2y);
if cap3=1 then rcap3(cap3x,cap3y);
if cap4=1 then rcap4(cap4x,cap4y);
if cap5=1 then rcap5(cap5x,cap5y);
if cap6=1 then rcap6(cap6x,cap6y);
if cap7=1 then rcap7(cap7x,cap7y);
if cap8=1 then rcap8(cap8x,cap8y);
if cap9=1 then rcap9(cap9x,cap9y);
if cap10=1 then rcap10(cap10x,cap10y);
if cap11=1 then rcap11(cap11x,cap11y);
if cap12=1 then rcap12(cap12x,cap12y);
if cap13=1 then rcap13(cap13x,cap13y);
if cap14=1 then rcap14(cap14x,cap14y);
if cap15=1 then rcap15(cap15x,cap15y);
if cap16=1 then rcap16(cap16x,cap16y);
if cap17=1 then rcap17(cap17x,cap17y);
if cap18=1 then rcap18(cap18x,cap18y);
end;

procedure hyper;
var nnn:integer;
begin

for nnn:=ix to ix+10 do begin
star;
textcolor(6);
for iii:=1 to 20 do if (sus[iii]=1)and(mety[iii]>=iy-2)and(mety[iii]<=iy+2) then meteor(metx[iii],mety[iii],min[iii]);
sthyp;
iris(nnn);
delay(round(70*dl));
ister(nnn);
end;

for nnn:=ix+10 to ix+20 do begin
star;
textcolor(6);
for iii:=1 to 20 do if (sus[iii]=1)and(mety[iii]>=iy-2)and(mety[iii]<=iy+2) then meteor(metx[iii],mety[iii],min[iii]);
sthyp;iris(nnn);
delay(round(50*dl));
ister(nnn);
end;

for nnn:=ix+20 to ix+30 do begin
star;
textcolor(6);
for iii:=1 to 20 do if (sus[iii]=1)and(mety[iii]>=iy-2)and(mety[iii]<=iy+2) then meteor(metx[iii],mety[iii],min[iii]);
sthyp;iris(nnn);
delay(round(30*dl));
ister(nnn);
end;

for nnn:=ix+30 to ix+40 do begin
star;
textcolor(6);
for iii:=1 to 20 do if (sus[iii]=1)and(mety[iii]>=iy-2)and(mety[iii]<=iy+2) then meteor(metx[iii],mety[iii],min[iii]);
sthyp;iris(nnn);
delay(round(10*dl));
ister(nnn);
end;

for nnn:=ix+40 to 85 do begin
star;
textcolor(6);
for iii:=1 to 20 do if (sus[iii]=1)and(mety[iii]>=iy-2)and(mety[iii]<=iy+2) then meteor(metx[iii],mety[iii],min[iii]);
sthyp;iris(nnn);
delay(round(1*dl));
ister(nnn);
end;


inc(cho,2000);
for iii:=0 to 20 do sus[iii]:=0;
clrscr;
star;
cap1:=0;
cap2:=0;
cap3:=0;
cap4:=0;
cap5:=0;
cap6:=0;
cap7:=0;
cap8:=0;
cap9:=0;
cap10:=0;
cap11:=0;
cap12:=0;
cap13:=0;
cap14:=0;
cap15:=0;
cap16:=0;
cap17:=0;
cap18:=0;
nnn:=0;
for iii:=30 to 80 do begin
change:=random(b);if change=0 then begin
inc(nnn);
mety[nnn]:=random(24)+1;
metx[nnn]:=random(50)+31;
sus[nnn]:=1;
textcolor(6);
speed[nnn]:=random(a)+1;
meteor(metx[nnn],mety[nnn],min[nnn]);
end;
end;



for nnn:=-5 to ix-5 do begin
star;
textcolor(6);
for iii:=1 to 20 do if (sus[iii]=1)and(mety[iii]>=iy-2)and(mety[iii]<=iy+2) then meteor(metx[iii],mety[iii],min[iii]);
iris(nnn);
delay(round(1*dl));
ister(nnn);
end;

for nnn:=ix-5 to ix do begin
star;
textcolor(6);
for iii:=1 to 20 do if (sus[iii]=1)and(mety[iii]>=iy-2)and(mety[iii]<=iy+2) then meteor(metx[iii],mety[iii],min[iii]);
iris(nnn);
delay(round(70*dl));
ister(nnn);
end;


for iii:=36 to 78 do begin
gotoxy(iii,25);write(' ');
end;
end;


procedure line(xx1,xx2,yy,ci:integer);
var starwars:integer;
begin
for starwars:=xx1 to xx2 do begin
gotoxy(starwars,yy);write(chr(ci));
end;
end;

procedure pricel;
var l:real;
begin
cel:=0;
l:=1000;
for iii:=1 to 20 do begin
if (sus[iii]=1)and(metx[iii]>=ix+10) then begin
for xxx:=metx[iii] to metx[iii]+7 do begin
for yyy:=mety[iii]-1 to mety[iii]+1 do begin
if ((xxx-rx3)*(xxx-rx3)/4+(yyy-ry3)*(yyy-ry3))<l then begin
l:=((xxx-rx3)*(xxx-rx3)/4+(yyy-ry3)*(yyy-ry3));cel:=iii;
end;
end;
end;
end;
end;
end;

begin
randomize;
textbackground(0);
clrscr;
i1:=10;
fun:=0;
cap1:=0;
cap1x:=0;
cap1y:=0;
cap2:=0;
cap2x:=0;
cap2y:=0;
cap3:=0;
cap3x:=0;
cap3y:=0;
cap4:=0;
cap4x:=0;
cap4y:=0;
cap6:=0;
cap6x:=0;
cap6y:=0;
cap8:=0;
cap8x:=0;
cap8y:=0;
cap7:=0;
cap7x:=0;
cap7y:=0;
cap9:=0;
cap9x:=0;
cap9y:=0;
cap10:=0;
cap10x:=0;
cap10y:=0;
cap11:=0;
cap11x:=0;
cap11y:=0;
cap12:=0;
cap12x:=0;
cap12y:=0;
cap13:=0;
cap13x:=0;
cap13y:=0;
cap14:=0;
cap14x:=0;
cap14y:=0;
cap15:=0;
cap15x:=0;
cap15y:=0;
cap16:=0;
cap16x:=0;
cap16y:=0;
cap17:=0;
cap17x:=0;
cap17y:=0;
cap18:=0;
cap18x:=0;
cap18y:=0;
for iii:=1 to 20 do begin
r5[iii]:=0;
r5y[iii]:=0;
r5x[iii]:=0;
ny[iii]:=0;
nx[iii]:=0;
min[iii]:=0;
end;
r4:=0;
r4x:=0;
r4y:=0;
r3:=0;
rx3:=0;
ry3:=0;
idef:=0;
def1:=0;
vn:=0;
chvn:=0;
vn1:=0;
chvn1:=0;
chdef:=0;
chmin:=0;
def:=0;
r:=0;
r1:=0;
r2:=0;
rx:=0;
rx1:=0;
rx2:=0;
ry:=0;
ry2:=0;

ix:=5;
ruk:=0;
chfun:=40000;
fin:=0;
finx:=81;
finish:=0;
iy:=12;
iris(ix);
star;
for iii:=30 to 80 do begin
change:=random(b);if change=0 then begin
inc(col);
mety[col]:=random(24)+1;
metx[col]:=random(50)+31;
sus[col]:=1;
textcolor(6);
speed[col]:=random(a)+1;
meteor(metx[col],mety[col],min[col]);
end;
end;

col:=0;

cho:=0;
gotoxy(40,12);
textcolor(4);
write('3');
delay(round(6000*dl));
gotoxy(40,12);
textcolor(14);
write('2');
delay(round(6000*dl));
gotoxy(40,12);
textcolor(10);
write('1');
delay(round(6000*dl));
gotoxy(38,12);
textcolor(11);
write('‘’€’');
delay(round(6000*dl));
gotoxy(38,12);
write('     ');

hidecursor;

repeat
inc(cho);
star;

mousecondition(xm,ym,caa,daa);
if ym<iy then begin
  if vn1=1 then begin change:=random(4);
	case change of
	0:v;
	1:n;
	2:l;
	3:p;
	end;
	end
	else begin
  if vn=0 then
	v;
  if vn=1 then
	n;
	end;
	end;

if ym>iy then begin
  if vn1=1 then begin change:=random(4);
	case change of
	0:v;
	1:n;
	2:l;
	3:p;
	end;
	end
	else begin
	if vn=0 then
	n;
  if vn=1 then
	v;
	end;
	end;
if xm>ix then begin
  if vn1=1 then begin change:=random(4);
	case change of
	0:v;
	1:n;
	2:l;
	3:p;
	end;
	end
	else begin
	if vn=0 then
	p;
  if vn=1 then
	l;
	end;
	end;
if xm<ix then begin
  if vn1=1 then begin change:=random(4);
	case change of
	0:v;
	1:n;
	2:l;
	3:p;
	end;
	end
	else begin
	if vn=0 then
	l;
  if vn=1 then
	p;
	end;end;
	putcursor(ix,iy);
if caa=true then
begin
  case ruk of
  1: begin
  if r<>0 then begin gotoxy(rx,ry);write(' ');end;
  r:=1;
  rx:=ix+4;
  ry:=iy;
  ruk:=0;
  end;
  15: begin
  if r4<>0 then begin
  gotoxy(r4x-1,r4y-1);write('  ');
  gotoxy(r4x-1,r4y+1);write('  ');
  if r4x<81 then begin gotoxy(r4x,r4y);write(' ');end;
  end;
  r4:=1;
  r4x:=ix+4;
  r4y:=iy;
  ruk:=0;
  end;
  18: begin
  ruk:=0;
  for iii:=1 to 20 do begin
  if sus[iii]=1 then min[iii]:=1;
  end;
  chmin:=cho;
  end;
  17: begin
  inc(chet);
  if chet=21 then chet:=1;
  if r5[chet]<>0 then begin gotoxy(r5x[chet],r5y[chet]);write(' ');end;
  r5[chet]:=1;
  r5x[chet]:=ix+4;
  r5y[chet]:=iy;
  ny[chet]:=0;
  nx[chet]:=1;
  ruk:=0;
  end;
  2:begin
  inc(idef,5);
  def1:=1;
  if def=0 then
  chdef:=cho
  else inc(chdef,200);
  def:=1;
  ruk:=0;
  end;
  14:begin
  v2x:=ix+4;
  v2y:=iy;
  repeat
  inc(v2x);
  textcolor(14);
  line(ix+4,v2x,v2y,ord('Í'));
  for iii:=1 to 20 do begin
  if (sus[iii]=1)and(mety[iii]=v2y)and(metx[iii]>=v2x-6)and(metx[iii]<=v2x) then begin
  textcolor(0);
  meteor(metx[iii],mety[iii],min[iii]);
  change:=random(2);
  if change=0 then change:=-1;
  inc(mety[iii],change);
  textcolor(6);
  meteor(metx[iii],mety[iii],min[iii]);
  textcolor(14);
  line(ix+4,v2x,v2y,ord('Í'));
  end;
  if (sus[iii]=1)and((mety[iii]=v2y-1)or(mety[iii]=v2y+1))and(metx[iii]>=v2x-6)and(metx[iii]<=v2x) then begin
  textcolor(0);
  meteor(metx[iii],mety[iii],min[iii]);
  if mety[iii]=v2y-1 then change:=-1;
  if mety[iii]=v2y+1 then change:=1;
  inc(mety[iii],change);
  textcolor(6);
  meteor(metx[iii],mety[iii],min[iii]);
  textcolor(14);
  line(ix+4,v2x,v2y,ord('Í'));
  end;
  end;
  until v2x=80;
  sound1;
  line(ix+4,80,iy,ord(' '));
  v2x:=ix;
  repeat
  inc(v2x);
  textcolor(14);
  line(ix,v2x,v2y-1,ord('Ä'));
  line(ix,v2x,v2y+1,ord('Ä'));
  for iii:=1 to 20 do begin
  if (sus[iii]=1)and((mety[iii]=v2y-1)or(mety[iii]=v2y-2))and(metx[iii]>=v2x-6)and(metx[iii]<=v2x) then begin
  textcolor(0);
  meteor(metx[iii],mety[iii],min[iii]);
  if mety[iii]=v2y-1 then change:=-2;
  if mety[iii]=v2y-2 then change:=-1;
  inc(mety[iii],change);
  textcolor(6);
  meteor(metx[iii],mety[iii],min[iii]);
  textcolor(14);
  line(ix,v2x,v2y-1,ord('Ä'));
  end;
  if (sus[iii]=1)and((mety[iii]=v2y+1)or(mety[iii]=v2y+2))and(metx[iii]>=v2x-6)and(metx[iii]<=v2x) then begin
  textcolor(0);
  meteor(metx[iii],mety[iii],min[iii]);
  if mety[iii]=v2y+1 then change:=2;
  if mety[iii]=v2y+2 then change:=1;
  inc(mety[iii],change);
  textcolor(6);
  meteor(metx[iii],mety[iii],min[iii]);
  textcolor(14);
  line(ix,v2x,v2y+1,ord('Ä'));
  end;
  end;
  until v2x=80;
  sound1;
  line(ix,80,iy-1,ord(' '));
  line(ix,80,iy+1,ord(' '));
  ruk:=0;
  end;
  12: begin
  if r2<>0 then begin gotoxy(rx2,ry2);write(' ');end;
  r2:=1;
  rx2:=ix+4;
  ry2:=iy;
  ruk:=0;
  end;
  13: begin
  if r3<>0 then begin gotoxy(rx3,ry3);write(' ');end;
  r3:=1;
  rx3:=ix+4;
  ry3:=iy;
  nr:=1;
  pricel;
  ruk:=0;
  end;
  9: begin
  if def=0 then begin
  chdef:=cho;
  if def1=1 then chdef:=cho+200;
  end
  else inc(chdef,200);
  def:=1;
  ruk:=0;
  end;
  3: begin
  ruk:=0;
  v1x:=ix+3;
  v1y:=iy;
	 repeat
  inc(v1x);
  textcolor(14);
  line(ix+4,v1x,v1y,ord('Í'));
  for iii:=1 to 20 do begin
  if (v1x>=metx[iii])and(v1x<=metx[iii]+6)and(v1y>=mety[iii]-1)and(v1y<=mety[iii]+1)and(sus[iii]=1) then
begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(16);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;

  end;
  end;
  until v1x=80;
	 delay(round(100*dl));
	line(ix+4,80,iy,ord(' '));
  end;
  16: begin
  ruk:=0;
  v1x:=ix;
  repeat
  inc(v1x);
  textcolor(14);
  line(ix,v1x,iy-1,ord('Í'));
  line(ix,v1x,iy+1,ord('Í'));
  for iii:=1 to 20 do begin
  if (v1x>=metx[iii])and(v1x<=metx[iii]+6)and(iy>=mety[iii]-2)and(iy<=mety[iii]+2)and(sus[iii]=1) then
begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(16);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;

  end;
  end;
  until v1x=80;
	 delay(round(100*dl));
	line(ix,80,iy+1,ord(' '));
	line(ix,80,iy-1,ord(' '));
  end;
  5: begin
  if r1<>0 then for xk:=1 to 24 do begin gotoxy(rx1,xk);write(' ');end;
  r1:=1;
  rx1:=ix+4;
  ruk:=0;
  end;
  11: begin
  inc(idef,5);
  def1:=1;
  if def=1 then inc(chdef,200);
  ruk:=0;
  end;
  10: begin
  ruk:=0;
  hyper;
  if def=1 then inc(chdef,2000);
  if vn=1 then inc(chvn,2000);
  if vn1=1 then inc(chvn1,2000);
  end;
  end;
  end;


 if (keypressed) and (i1>0) then begin

	u:=readkey;
	if u=#0 then u:=readkey;

case u of

  #112:
  begin
  textcolor(15);
  gotoxy(37,12);
  write('€“‡€');
  readkey;
  gotoxy(37,12);
  write('     ');
  iris(ix);
  end;
end;
end;

if cho>=chmin+30 then begin
for kkk:=1 to 20 do begin
if (min[kkk]=1)and(sus[kkk]=1)then begin
sus[kkk]:=0;
cx:=metx[kkk]+3;
cy:=mety[kkk];
vzriv(6);
min[kkk]:=0;textcolor(0);
meteor(metx[kkk],mety[kkk],min[kkk]);
sound3;
end;
end;
end;

for kkk:=1 to 20 do begin
if r5[kkk]=1 then begin

for iii:=1 to 20 do begin
if (((r5x[kkk]>=metx[iii])and(r5x[kkk]<=metx[iii]+6)and(r5y[kkk]=mety[iii]))or((r5x[kkk]>=metx[iii]+2)
and(r5x[kkk]<=metx[iii]+5)and((r5y[kkk]=mety[iii]-1)or(r5y[kkk]=mety[iii]+1))))and(sus[iii]=1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
end;
if (r5y[kkk]=mety[iii]+1)and((r5x[kkk]=metx[iii])or(r5x[kkk]=metx[iii]+1))
and(sus[iii]=1)and(nx[kkk]=0)and(ny[kkk]=-1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=-1;
ny[kkk]:=0;
end;
if (r5y[kkk]=mety[iii]+1)and((r5x[kkk]=metx[iii])or(r5x[kkk]=metx[iii]+1))and(sus[iii]=1)and
(nx[kkk]=1)and(ny[kkk]=-1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=-1;
ny[kkk]:=1;
end;
if (r5y[kkk]=mety[iii]+1)and((r5x[kkk]=metx[iii])or(r5x[kkk]=metx[iii]+1))and(sus[iii]=1)
and(nx[kkk]=1)and(ny[kkk]=0) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=0;
ny[kkk]:=1;
end;

if (r5y[kkk]=mety[iii]-1)and((r5x[kkk]=metx[iii])or(r5x[kkk]=metx[iii]+1))and(sus[iii]=1)
and(nx[kkk]=0)and(ny[kkk]=1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=-1;
ny[kkk]:=0;
end;
if (r5y[kkk]=mety[iii]-1)and((r5x[kkk]=metx[iii])or(r5x[kkk]=metx[iii]+1))and(sus[iii]=1)
and(nx[kkk]=1)and(ny[kkk]=1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=-1;
ny[kkk]:=-1;
end;
if (r5y[kkk]=mety[iii]-1)and((r5x[kkk]=metx[iii])or(r5x[kkk]=metx[iii]+1))and(sus[iii]=1)
and(nx[kkk]=1)and(ny[kkk]=0) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=0;
ny[kkk]:=-1;
end;

if (r5y[kkk]=mety[iii]-1)and((r5x[kkk]=metx[iii]+5)or(r5x[kkk]=metx[iii]+6))and(sus[iii]=1)
and(nx[kkk]=0)and(ny[kkk]=1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=1;
ny[kkk]:=0;
end;
if (r5y[kkk]=mety[iii]-1)and((r5x[kkk]=metx[iii]+5)or(r5x[kkk]=metx[iii]+6))and(sus[iii]=1)
and(nx[kkk]=-1)and(ny[kkk]=1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=1;
ny[kkk]:=-1;
end;
if (r5y[kkk]=mety[iii]-1)and((r5x[kkk]=metx[iii]+5)or(r5x[kkk]=metx[iii]+6))and(sus[iii]=1)
and(nx[kkk]=-1)and(ny[kkk]=0) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=0;
ny[kkk]:=-1;
end;

if (r5y[kkk]=mety[iii]+1)and((r5x[kkk]=metx[iii]+5)or(r5x[kkk]=metx[iii]+6))and(sus[iii]=1)
and(nx[kkk]=0)and(ny[kkk]=-1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=1;
ny[kkk]:=0;
end;
if (r5y[kkk]=mety[iii]+1)and((r5x[kkk]=metx[iii]+5)or(r5x[kkk]=metx[iii]+6))and(sus[iii]=1)
and(nx[kkk]=-1)and(ny[kkk]=-1) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=1;
ny[kkk]:=1;
end;
if (r5y[kkk]=mety[iii]+1)and((r5x[kkk]=metx[iii]+5)or(r5x[kkk]=metx[iii]+6))and(sus[iii]=1)
and(nx[kkk]=-1)and(ny[kkk]=0) then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=0;
ny[kkk]:=1;
end;

if (r5x[kkk]=metx[iii]-1)and(r5y[kkk]=mety[iii])and(sus[iii]=1)and(nx[kkk]=1)then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=-1;
end;
if (r5x[kkk]=metx[iii]+7)and(r5y[kkk]=mety[iii])and(sus[iii]=1)and(nx[kkk]=-1)then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
nx[kkk]:=1;
end;
if (r5x[kkk]>=metx[iii]+2)and(r5x[kkk]<=metx[iii]+4)and(r5y[kkk]=mety[iii]-1)and(sus[iii]=1)and(ny[kkk]=1)then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
ny[kkk]:=-1;
end;

if (r5x[kkk]>=metx[iii]+2)and(r5x[kkk]<=metx[iii]+4)and(r5y[kkk]=mety[iii]+1)and(sus[iii]=1)and(ny[kkk]=-1)then begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
ny[kkk]:=1;
end;

end;
if (r5x[kkk]=1)and(nx[kkk]=-1) then nx[kkk]:=1;
if (r5y[kkk]=1)and(ny[kkk]=-1) then ny[kkk]:=1;
if (r5y[kkk]=24)and(ny[kkk]=1) then ny[kkk]:=-1;
if (r5x[kkk]=80)and(nx[kkk]=1) then begin r5[kkk]:=0;gotoxy(r5x[kkk],r5y[kkk]);write(' ');
r5x[kkk]:=0;r5y[kkk]:=0;nx[kkk]:=0;ny[kkk]:=0;end;

end;

if r5[kkk]=1 then begin
gotoxy(r5x[kkk],r5y[kkk]);write(' ');
inc(r5x[kkk],nx[kkk]);inc(r5y[kkk],ny[kkk]);
textcolor(10);
gotoxy(r5x[kkk],r5y[kkk]);write('ý');
end;
end;

if (sus[cel]=0)and(r3=1) then pricel;

if r3<>0 then begin
gotoxy(rx3,ry3);write(' ');
if metx[cel]<rx3 then begin nr:=-1;rx3:=rx3-1;end
 else begin
  if metx[cel]>rx3 then begin nr:=1;rx3:=rx3+1;end
	else begin
	 if mety[cel]<ry3 then ry3:=ry3-1
	  else ry3:=ry3+1;
	end;
 end;

gotoxy(rx3,ry3);textcolor(15);
if nr=1 then write(chr(26));
if nr=-1 then write(chr(27));
if (rx3>=80) or (rx3<=1) or(ry3<=1) or(ry3>=24)then begin r3:=0;gotoxy(rx3,ry3);write(' ');
rx3:=0;
ry3:=0;
end;
for iii:=1 to 20 do begin
if (rx3>=metx[iii])and(rx3<=metx[iii]+6)and(ry3>=mety[iii]-1)and(ry3<=mety[iii]+1)and(sus[iii]=1)and(r3=1) then
begin
gotoxy(rx3,ry3);write(' ');
r3:=0;
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
end;
end;
end;

if r=1 then begin
gotoxy(rx,ry);write(' ');
inc(rx);textcolor(11);
gotoxy(rx,ry);write(chr(26));
end;

if r4=1 then begin
gotoxy(r4x-1,r4y-1);write('  ');
gotoxy(r4x-1,r4y+1);write('  ');
if r4x<81 then begin gotoxy(r4x,r4y);write(' ');end;
inc(r4x);textcolor(11);
gotoxy(r4x-1,r4y-1);write('ßÜ');
gotoxy(r4x-1,r4y+1);write('Üß');
if r4x<81 then begin gotoxy(r4x,r4y);write('Û');end;
end;

if r2=1 then begin
gotoxy(rx2,ry2);write(' ');
inc(rx2);textcolor(4);
gotoxy(rx2,ry2);write(chr(26));
end;

if r1=1 then begin
for xk:=1 to 24 do begin gotoxy(rx1,xk);write(' ');end;
inc(rx1);textcolor(3);
for xk:=1 to 24 do begin gotoxy(rx1,xk);write(chr(16+(xk mod 2)));end;
end;

if (rx=80)and(r=1) then begin
gotoxy(rx,ry);write(' ');
r:=0;
end;

if (r4x=81)and(r4=1) then begin
gotoxy(r4x-1,r4y-1);write('  ');
gotoxy(r4x-1,r4y+1);write('  ');
if r4x<81 then begin gotoxy(r4x,r4y);write(' ');end;
r4:=0;
r4y:=0;
r4x:=0;
end;

if (rx1=80)and(r1=1) then begin
for iii:=1 to 24 do begin gotoxy(rx1,iii);write(' ');end;
r1:=0;
end;

if (rx2=80)and(r2=1) then begin
gotoxy(rx2,ry2);write(' ');
r2:=0;
end;

for iii:=1 to 20 do begin
if (rx>=metx[iii])and(rx<=metx[iii]+6)and(ry>=mety[iii]-1)and(ry<=mety[iii]+1)and(sus[iii]=1)and(r=1) then
begin
gotoxy(rx,ry);write(' ');
r:=0;
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
end;
end;

for iii:=1 to 20 do begin
if (r4x>=metx[iii])and(r4x<=metx[iii]+7)and(r4y>=mety[iii]-2)and(r4y<=mety[iii]+2)and(sus[iii]=1)and(r4=1) then
begin
textcolor(11);
gotoxy(r4x-1,r4y-1);write('ßÜ');
gotoxy(r4x-1,r4y+1);write('Üß');
if r4x<81 then begin gotoxy(r4x,r4y);write('Û');end;
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
end;
end;


for iii:=1 to 20 do begin
if (rx2>=metx[iii])and(rx2<=metx[iii]+6)and(ry2>=mety[iii]-1)and(ry2<=mety[iii]+1)and(sus[iii]=1)and(r2=1) then
begin
r2:=0;
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;

for kkk:=1 to 7 do begin

textcolor(14);
roun(rx2,ry2,kkk);
if kkk>1 then begin
textcolor(6);
roun(rx2,ry2,kkk-1);
end;
if kkk>2 then begin
textcolor(4);
roun(rx2,ry2,kkk-2);
end;
if kkk>3 then begin
textcolor(0);
roun(rx2,ry2,kkk-3);
end;
iris(ix);
for ccc:=1 to 20 do begin
if sus[ccc]=1 then begin
for xxx:=metx[ccc] to metx[ccc]+7 do begin
for yyy:=mety[ccc]-1 to mety[ccc]+1 do begin
if ((xxx-rx2)*(xxx-rx2)/4+(yyy-ry2)*(yyy-ry2)<=kkk*kkk)and(sus[ccc]=1) then begin
sus[ccc]:=0;
cx:=metx[ccc]+3;
cy:=mety[ccc];
vzriv(6);
textcolor(0);
meteor(metx[ccc],mety[ccc],min[ccc]);
sound3;
end;
end;
end;
end;
end;


delay(round(70*dl));
if kkk=7 then begin textcolor(0);roun(rx2,ry2,kkk);end;
end;

end;
end;

for iii:=1 to 20 do begin
if (rx1>=metx[iii])and(rx1<=metx[iii]+6)and(sus[iii]=1)and(r1=1) then
begin
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
sound3;
textcolor(3);
for xk:=1 to 24 do begin gotoxy(rx1,xk);write(chr(16+(xk mod 2)));end;
end;
end;



if cho>=20000 then
begin
if cho=20000 then fin:=1
else begin
if cho<20080 then begin
fin:=1;
finx:=20080-cho;
finris(finx);
end
else if fun=0 then begin fun:=1;chfun:=cho;zub:=180;end;
end;
end;

caps;
if cho>=chvn+200 then vn:=0;
if cho>=chvn1+200 then vn1:=0;
if cho>=chdef+200 then begin def:=0;defster(ix);end;


for iii:=1 to 20 do begin
if def=0 then begin
if (ix<=metx[iii]+8+def1)and(ix>=metx[iii]-4-def1)and(iy>=mety[iii]-2-def1)and(iy<=mety[iii]+2+def1)
and(sus[iii]=1) then begin
if (iy=mety[iii])and(fun=0) then inc(i1,(-3+3*def1));
if ((iy=mety[iii]-1)or(iy=mety[iii]+1))and(fun=0)then inc(i1,(-2+2*def1));
if ((iy=mety[iii]-2)or(iy=mety[iii]+2))and(fun=0)then inc(i1,(-1+def1));
inc(idef,-1);
inc(col);
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
iris(ix);
sound3;
end;
end
else begin
if (ix<=metx[iii]+9)and(ix>=metx[iii]-5)and(iy>=mety[iii]-3)and(iy<=mety[iii]+3)
and(sus[iii]=1) then begin
inc(col);
sus[iii]:=0;
cx:=metx[iii]+3;
cy:=mety[iii];
vzriv(6);
min[iii]:=0;textcolor(0);
meteor(metx[iii],mety[iii],min[iii]);
iris(ix);
sound3;
end;

end;
end;

if idef<=0 then begin idef:=0;def1:=0;defster(ix);end;

iris(ix);
iii:=0;
repeat
inc(iii);
until (sus[iii]=0)or(iii=20);
if sus[iii]=0 then begin
change:=random(b);
if change=0 then begin
metx[iii]:=80;
mety[iii]:=random(24)+1;
sus[iii]:=1;
min[iii]:=0;
speed[iii]:=random(a)+1;
textcolor(6);
meteor(metx[iii],mety[iii],min[iii]);
end;
end;

for iii:=1 to 20 do begin
if sus[iii]=1 then begin
textcolor(0);
meteor(metx[iii],mety[iii],0);
if cho mod (a+1-speed[iii])=0 then
metx[iii]:=metx[iii]-1;
textcolor(6);
meteor(metx[iii],mety[iii],min[iii]);
if metx[iii]<-5 then sus[iii]:=0;
end;
end;

if fin=1 then begin
fincleen(finx);
inc(finx,-1);
finris(finx);
iris(ix);
end;

delay(round(70*dl));

if (ix>=finx)and(fun=0) then begin fun:=1;chfun:=cho;zub:=80;end;

if fun=1 then begin
textcolor(10);
gotoxy(38,12);
write('”ˆˆ˜');
end;

if cho>=chfun+zub then finish:=1;

textcolor(15);
gotoxy(5,25);write('„¥ä«¥ªâ®àë ');
if i1>0 then begin
if i1>16 then textcolor(1)
else case i1 of
1:textcolor(4);
2:textcolor(5);
3:textcolor(12);
4:textcolor(12);
5:textcolor(13);
6:textcolor(6);
7:textcolor(14);
8:textcolor(14);
9:textcolor(10);
10:textcolor(2);
11:textcolor(2);
12:textcolor(9);
13:textcolor(11);
14:textcolor(11);
15:textcolor(3);
16:textcolor(3);
end;
write(i1);end
else begin textcolor(4);write('0 ');end;
if (def1=1)and(def=0) then begin
textcolor(12);write('+',idef,' ');
end;
if (def1=1)and(def=1) then begin
textcolor(10);write('() ');
end;
if (def1=0)and(def=1) then begin
textcolor(3);write('() ');
end;
if (def1=0)and(def=0) then
write('    ');


textcolor(15);
gotoxy(23,25);write('‘â®«ª­®¢¥­¨ï ',col);
gotoxy(39,25);write('¤® ä¨­¨è  ');
textcolor(4);
if fun<>1 then write('Û');
textcolor(14);
if fun=0 then
if fin=0 then write('ÛÛÛÛ') else
for iii:=1 to (round((finx-ix)/16)) do write('Û');
textcolor(10);
if fin=0 then begin for iii:=1 to (20000-cho) div 800+1 do write('Û');end;
write(' ');
case ruk of
1:rcap1(78,25);
2:begin textbackground(2);textcolor(15);gotoxy(78,25);write(' ');textbackground(0);end;
3:rcap3(78,25);
5:rcap5(78,25);
9:rcap9(78,25);
10:rcap10(78,25);
11:rcap11(78,25);
12:rcap12(78,25);
13:rcap13(78,25);
14:rcap14(78,25);
15:rcap15(78,25);
16:rcap16(78,25);
17:rcap17(78,25);
18:rcap18(78,25);
else stercap(78,25);
end;

if (i1<=0)and(fun=0) then begin
cx:=ix;
cy:=iy;
vzriv(1);
ister(ix);
textcolor(4);
gotoxy(30,12);
write('‚€˜ ŠŽ€‹œ ‚‡Ž‚€');
for iii:=1 to 25 do begin
delay(round(1000*dl));
end;
end;


 until (u=#27) or ((i1<=0)and(fun=0)) or (finish=1);
  end.