imax=0
jmax=1
tex.sprint('\\begin{center}')
tex.sprint('\\begin{tikzpicture}[x=3cm,y=3cm]')
for i=0,imax do
  for j=0,jmax do
    tex.sprint('\\draw ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
  end
end
icenter=1
jcenter=1
for i=0,imax+1 do
  for j=0,jmax do
    if j==jcenter and i==icenter then
    tex.sprint('\\draw[->,red] ('..(i-0.1-0.5)..','..(j)..') -- ('..(i+0.1-0.5)..','..(j)..') ; ')
    end
    if (j==jcenter or j==jcenter -1)  and (i==icenter or i==icenter-1) then
    tex.sprint('\\draw[->,blue] ('..(i-0.1)..','..(j+0.5)..') -- ('..(i+0.1)..','..(j+0.5)..') ; ')
    end
  end
end
tex.sprint('\\end{tikzpicture}')
tex.sprint('\\end{center}')