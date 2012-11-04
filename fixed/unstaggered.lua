imax=2
jmax=2
tex.sprint('\\begin{center}')
tex.sprint('\\begin{tikzpicture}[x=2cm,y=2cm]')
for i=0,imax do
  for j=0,jmax do
    tex.sprint('\\draw ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
    tex.sprint('\\node[fill,circle,label={above:$v_{x}$, $v_{y}$, $p$}] at ('..(i)..','..(j)..'){}; ')
  end
  tex.sprint('\\node[fill,circle,label={above:$v_{x}$, $v_{y}$, $p$}] at ('..(i)..','..(jmax+1)..'){}; ')
end
for j=0,jmax+1 do
  tex.sprint('\\node[fill,circle,label={above:$v_{x}$, $v_{y}$, $p$}] at ('..(imax+1)..','..(j)..'){}; ')
end
tex.sprint('\\end{tikzpicture}')
tex.sprint('\\end{center}')