g_use_svg = 0; %0 for postscript, 1 for svg
prologues:=3;
u=1cm;

outputtemplate := "%j-%c.eps";
if g_use_svg > 0:
	outputtemplate := "%j-%c.svg";
	outputformat := "svg";
fi

def refleja(expr p)=
  drawarrow p cutbefore (fullcircle scaled 10pt shifted point 0 of p) cutafter
    (fullcircle scaled 10pt shifted point 0 of reverse p) dashed evenly;
  draw ((0,-.1u)--(0,.1u)) rotated angle direction .5*length p of p
    shifted point .5*length p of p withcolor blue withpen pencircle
    scaled 3pt;
enddef;
interim ahlength:=1.5*ahlength;
a=2u;
b=1u;
c=1.5u;
N=1;
NM1=N+1;
NM12=N+.5;
NM112=N+1.5;

beginfig(1)
  z0=(.5u,.3u);
  z1=(-x0,y0);
  z2=(x0,-y0);
  z3=(-x0,-y0);
  for i:=-2*N-1 upto 2*NM1+1:
    draw (i*a,-2*NM12*b)--(i*a,2*NM112*b);
    draw (-2*NM12*a,i*b)--(2*NM112*a,i*b);
  endfor
  for i:=-N upto NM1:
    for j:= -N upto NM1:
      draw z0 shifted(2*i*a, 2*j*b) withpen pencircle scaled 5pt
	withcolor blue;
      draw z1 shifted(2*i*a, 2*j*b) withpen pencircle scaled 5pt
	withcolor blue;
      draw z2 shifted(2*i*a, 2*j*b) withpen pencircle scaled 5pt
	withcolor blue;
      draw z3 shifted(2*i*a, 2*j*b) withpen pencircle scaled 5pt
	withcolor blue;
    endfor
  endfor
  fill unitsquare xscaled a yscaled b withcolor .7white+.3blue;
  draw z0 withpen pencircle scaled 5pt withcolor red;
  refleja(z0{up}..z1{down});
  refleja(z0{right}..z2{left});
  refleja(z0{dir 25}..z1 shifted(2a,0){dir -25});
  refleja(z0{dir 45}..z2 shifted(0,2b){dir 135});
  refleja(z1{left}..z3{right});
  refleja(z1{dir 75}..z0 shifted(2*a,0){dir -75});
  refleja(z2{down}..z3{up});
  refleja(z2{dir -45}..z3 shifted(2*a,0){dir 45});
  refleja(z3{dir -80}..z2 shifted(2*a,0){dir 80});
  refleja(z2 shifted(2*a,0){dir 45}..z0 shifted(2*a,2*b){dir 135});
  refleja(z0 shifted(2*a,0){dir 100}..z1 shifted(-2a,0){dir -100});
  draw unitsquare shifted (-.5,-.5) xscaled 2a yscaled 2b shifted
    (4a,2b) dashed evenly scaled 2 withpen pencircle scaled 2pt;
  %interim ahangle:=180;
  drawdblarrow ((0,0)--(a,0)) shifted (0,-.2u) shifted (0,-2NM12*b);
  label.bot(btex $a$ etex scaled 2, (.5a,0) shifted (0,-.2u) shifted (0,-2NM12*b));
  drawdblarrow ((0,0)--(0,b)) shifted (-.2u,0) shifted (-2NM12*a,0);
  label.lft(btex $b$ etex scaled 2, (0,.5b) shifted (-.2u,0) shifted (-2NM12*a,0));
  drawdblarrow ((-a,0)--(a,0)) shifted (4a,0) shifted (0,-.2u) shifted (0,-2NM12*b);
  label.bot(btex $2a$ etex scaled 2, (4a,0) shifted (0,-.2u) shifted (0,-2NM12*b));
  drawdblarrow ((0,-b)--(0,b)) shifted (0,2b) shifted (-.2u,0) shifted (-2NM12*a,0);
  label.lft(btex $2b$ etex scaled 2, (0,2b) shifted (-.2u,0) shifted (-2NM12*a,0));
endfig;

beginfig(2)
  z0=(.5u,1.u);
  z1=(-x0,y0);
  z2=(x0,-y0);
  z3=(-x0,-y0);
  for i:=-2*N-1 upto 2*NM1+1:
    draw (i*a,-2*NM12*c)--(i*a,2*NM112*c);
    draw (-2*NM12*a,i*c)--(2*NM112*a,i*c);
  endfor
  for i:=-N upto NM1:
    for j:= -N upto NM1:
      if j mod 2=0:
	filldraw fullcircle scaled 4pt shifted z0 shifted(2*i*a, 2*j*c) withpen pencircle scaled 1.5pt
	  withcolor green;
	filldraw fullcircle scaled 4pt shifted z1 shifted(2*i*a, 2*j*c) withpen pencircle scaled 1.5pt
	  withcolor green;
	draw fullcircle scaled 4pt shifted z2 shifted(2*i*a, 2*j*c) withpen pencircle scaled 1.5pt
	  withcolor green;
	draw fullcircle scaled 4pt shifted z3 shifted(2*i*a, 2*j*c) withpen pencircle scaled 1.5pt
	  withcolor green;
      fi;
      if j mod 2=1:
	filldraw fullcircle scaled 4pt shifted z2 shifted(2*i*a, 2*j*c) withpen pencircle scaled 1.5pt
	  withcolor green;
	filldraw fullcircle scaled 4pt shifted z3 shifted(2*i*a, 2*j*c) withpen pencircle scaled 1.5pt
	  withcolor green;
	draw fullcircle scaled 4pt shifted z0 shifted(2*i*a, 2*j*c) withpen pencircle scaled 1.5pt
	  withcolor green;
	draw fullcircle scaled 4pt shifted z1 shifted(2*i*a, 2*j*c) withpen pencircle scaled 1.5pt
	  withcolor green;
      fi;
    endfor
  endfor
  for i:=-N upto NM1:
    draw z0 shifted(2*i*a, 0) withpen pencircle scaled 5pt
      withcolor blue;
    draw z1 shifted(2*i*a, 0) withpen pencircle scaled 5pt
      withcolor blue;
  endfor
  fill unitsquare xscaled a yscaled c withcolor .7white+.3blue;
  filldraw fullcircle scaled 4pt shifted z0 withpen pencircle scaled 1.5pt withcolor red;
  refleja(z0{dir -135}..z1{dir 135});
  refleja(z0{dir -45}..z2{dir -135});
  refleja(z0{dir 135}..z2 shifted(0,2c){dir 45});
  refleja(z2 shifted(0,2c){dir -45}..z0 shifted(0,-2c){dir -135});
  refleja(z2{dir 150}..z0 shifted(0,2c){dir 30});
  refleja(z0 shifted(0,-2c){dir 150}..z2 shifted(0,4c){dir 30});
  draw unitsquare shifted (-.5,-.5) xscaled 2a yscaled 4c shifted
    (4a,c) dashed evenly scaled 2 withpen pencircle scaled 2pt;
  %interim ahangle:=180;
  drawdblarrow ((0,0)--(a,0)) shifted (0,-.2u) shifted (0,-2NM12*c);
  label.bot(btex $a$ etex scaled 2, (.5a,0) shifted (0,-.2u) shifted (0,-2NM12*c));
  drawdblarrow ((0,0)--(0,c)) shifted (-.2u,0) shifted (-2NM12*a,0);
  label.lft(btex $c$ etex scaled 2, (0,.5c) shifted (-.2u,0) shifted (-2NM12*a,0));
  drawdblarrow ((-a,0)--(a,0)) shifted (4a,0) shifted (0,-.2u) shifted (0,-2NM12*c);
  label.bot(btex $2a$ etex scaled 2, (4a,0) shifted (0,-.2u) shifted (0,-2NM12*c));
  drawdblarrow ((0,-2c)--(0,2c)) shifted (0,c) shifted (.2u,0) shifted (2NM112*a,0);
  label.rt(btex $4c$ etex scaled 2, (0,c) shifted (.2u,0) shifted (2NM112*a,0));

endfig;
end.