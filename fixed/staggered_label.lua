imax=2
jmax=2
tex.sprint('\\begin{center}')
tex.sprint('\\begin{tikzpicture}[x=3cm,y=3cm]')
for i=0,imax do
  for j=0,jmax do
    tex.sprint('\\draw ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
    tex.sprint('\\node[fill,circle,label={above:$p_{'..i..j..'}$}] (p'..i..j..') at ('..(i+0.5)..','..(j+0.5)..'){}; ')
    tex.sprint('\\draw[->] ('..(i-0.1)..','..(j+0.5)..') -- node[above]{${v_x}_{'..i..j..'}$} ('..(i+0.1)..','..(j+0.5)..') ; ')
    tex.sprint('\\draw[->] ('..(i+0.5)..','..(j-0.1)..') -- node[left]{${v_y}_{'..i..j..'}$} ('..(i+0.5)..','..(j+0.1)..') ; ')
    tex.sprint('\\node[] (vx'..i..j..') at ('..(i)..','..(j+0.5)..'){}; ')
    tex.sprint('\\node[] (vy'..i..j..') at ('..(i+0.5)..','..(j)..'){}; ')
    tex.sprint('\\node[] (v2x'..i..j..') at ('..(i)..','..(j+0.7)..'){}; ')
    tex.sprint('\\node[] (v2y'..i..j..') at ('..(i+0.3)..','..(j)..'){}; ')
    tex.sprint('\\node[fill,circle,label={above:$p_{'..i..j..'}$}] (p'..i..j..') at ('..(i+0.5)..','..(j+0.5)..'){}; ')
    tex.sprint('\\begin{pgfonlayer}{background}')
    tex.sprint('\\node[fill=blue!20,ellipse,inner sep=0,fit=(p'..i..j..') (vx'..i..j..') (v2x'..i..j..')]{};') 
    tex.sprint('\\node[fill=blue!20,ellipse,inner sep=0,fit=(p'..i..j..') (vy'..i..j..') (v2y'..i..j..')]{};')
    tex.sprint('\\end{pgfonlayer}')
  end
  tex.sprint('\\draw[->] ('..(i+0.5)..','..(jmax+1-0.1)..') -- node[left]{${v_y}_{'..i..(jmax+1)..'}$} ('..(i+0.5)..','..(jmax+1+0.1)..') ; ')
end
for j=0,jmax do
  tex.sprint('\\draw[->] ('..(imax+0.9)..','..(j+0.5)..') -- node[above]{${v_x}_{'..(imax+1)..j..'}$} ('..(imax+1.1)..','..(j+0.5)..') ; ')
end
tex.sprint('\\end{tikzpicture}')
tex.sprint('\\end{center}')