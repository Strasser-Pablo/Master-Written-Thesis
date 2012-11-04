imax=2
jmax=2
tex.sprint('\\begin{center}')
tex.sprint('\\begin{tikzpicture}[x=3cm,y=3cm]')
for i=0,imax do
  for j=0,jmax do
    tex.sprint('\\draw ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
    tex.sprint('\\node[fill,circle,label={above:$p$}] at ('..(i+0.5)..','..(j+0.5)..'){}; ')
    tex.sprint('\\draw[->] ('..(i-0.1)..','..(j+0.5)..') -- node[above]{$v_x$} ('..(i+0.1)..','..(j+0.5)..') ; ')
    tex.sprint('\\draw[->] ('..(i+0.5)..','..(j-0.1)..') -- node[left]{$v_y$} ('..(i+0.5)..','..(j+0.1)..') ; ')
  end
  tex.sprint('\\draw[->] ('..(i+0.5)..','..(jmax+1-0.1)..') -- node[left]{$v_y$} ('..(i+0.5)..','..(jmax+1+0.1)..') ; ')
end
for j=0,jmax do
  tex.sprint('\\draw[->] ('..(imax+0.9)..','..(j+0.5)..') -- node[above]{$v_x$} ('..(imax+1.1)..','..(j+0.5)..') ; ')
end
tex.sprint('\\end{tikzpicture}')
tex.sprint('\\end{center}')