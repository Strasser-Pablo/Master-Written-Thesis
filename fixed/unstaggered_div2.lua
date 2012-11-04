imax=3
jmax=3
tex.sprint('\\begin{center}')
tex.sprint('\\begin{tikzpicture}[x=2cm,y=2cm]')
for i=0,imax do
  for j=0,jmax do
    tex.sprint('\\draw ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
  end
end

for i=0,imax+1 do
  for j=0,jmax+1 do
    if i%2==0 and j%2==0 then
      tex.sprint('\\node[] at ('..i..','..j..') {$(\\textcolor{red}{2},\\textcolor{blue}{3})$};')
    end
     if i%2==0 and j%2==1 then
      tex.sprint('\\node[] at ('..i..','..j..') {$(\\textcolor{red}{2},\\textcolor{green}{5})$};')
    end
    if i%2==1 and j%2==0 then
      tex.sprint('\\node[] at ('..i..','..j..') {$(\\textcolor{magenta}{7},\\textcolor{blue}{3})$};')
    end
     if i%2==1 and j%2==1 then
      tex.sprint('\\node[] at ('..i..','..j..') {$(\\textcolor{magenta}{7},\\textcolor{green}{5})$};')
    end
  end
end


tex.sprint('\\end{tikzpicture}')
tex.sprint('\\end{center}')