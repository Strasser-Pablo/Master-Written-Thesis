imax=2
jmax=2
icenter=1
jcenter=1
tex.sprint('\\begin{center}')
tex.sprint('\\begin{tikzpicture}[x=3cm,y=3cm]')
for i=0,imax do
  for j=0,jmax do
    tex.sprint('\\draw ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
    if (i~=icenter) or j~=jcenter then
    tex.sprint('\\node[fill,circle,label={above:$p$}] at ('..(i+0.5)..','..(j+0.5)..'){}; ')
    else
    tex.sprint('\\node[fill=red,circle,label={above:$\\textcolor{red}{p}$}] at ('..(i+0.5)..','..(j+0.5)..'){}; ') 
    end
     if (i~=icenter and i~=icenter+1) or j~=jcenter then
    tex.sprint('\\draw[->] ('..(i-0.1)..','..(j+0.5)..') -- node[above]{$v_x$} ('..(i+0.1)..','..(j+0.5)..') ; ')
     else
       tex.sprint('\\draw[->,blue] ('..(i-0.1)..','..(j+0.5)..') -- node[above]{$v_x$} ('..(i+0.1)..','..(j+0.5)..') ; ')
     end
     if i~=icenter or (j~=jcenter and j~=jcenter+1) then
    tex.sprint('\\draw[->] ('..(i+0.5)..','..(j-0.1)..') -- node[left]{$v_y$} ('..(i+0.5)..','..(j+0.1)..') ; ')
     else
      tex.sprint('\\draw[->,blue] ('..(i+0.5)..','..(j-0.1)..') -- node[left]{$v_y$} ('..(i+0.5)..','..(j+0.1)..') ; ')
     end
  end
  tex.sprint('\\draw[->] ('..(i+0.5)..','..(jmax+1-0.1)..') -- node[left]{$v_y$} ('..(i+0.5)..','..(jmax+1+0.1)..') ; ')
end
for j=0,jmax do
  tex.sprint('\\draw[->] ('..(imax+0.9)..','..(j+0.5)..') -- node[above]{$v_x$} ('..(imax+1.1)..','..(j+0.5)..') ; ')
end
tex.sprint('\\end{tikzpicture}')
tex.sprint('\\end{center}')