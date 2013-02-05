tex.sprint('\\begin{tikzpicture}[x=3cm,y=3cm]')
for i=0,1 do
  for j=0,1 do
    colfluid=''
    if j==0 then
      colfluid='fill=blue!10'
    end
    color1='blue'
    color2='blue'
    if i==1 then
      color1='red'
    end
    if j==1 then
      color2='red'
    end
      tex.sprint('\\draw['..colfluid..'] ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
    if i==1 and j==1 then
      tex.sprint('\\draw[red,->] ('..(i+0.5)..','..(j-0.1)..') -- ('..(i+0.5)..','..(j+0.1)..') ; ')
    end
   end
end
tex.sprint('\\node[circle,fill,label=below:1] at(0.5,0.5){};')
tex.sprint('\\node[circle,fill,label=below:2] at(1.5,0.5){};')
tex.sprint('\\end{tikzpicture}')