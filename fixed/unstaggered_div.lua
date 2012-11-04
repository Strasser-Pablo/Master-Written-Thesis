imax=3
jmax=3
tex.sprint('\\begin{center}')
tex.sprint('\\begin{tikzpicture}[x=2cm,y=2cm]')
for i=0,imax do
  for j=0,jmax do
    tex.sprint('\\draw ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
  end
end

icenter=2
jcenter=2

tex.sprint('\\node[fill=red,circle] at ('..icenter..','..jcenter..') {};')

tex.sprint('\\node[fill=blue,circle] at ('..(icenter+1)..','..jcenter..') {};')
tex.sprint('\\node[fill=blue,circle] at ('..(icenter-1)..','..jcenter..') {};')
tex.sprint('\\node[fill=blue,circle] at ('..icenter..','..(jcenter+1)..') {};')
tex.sprint('\\node[fill=blue,circle] at ('..icenter..','..(jcenter-1)..') {};')

tex.sprint('\\end{tikzpicture}')
tex.sprint('\\end{center}')