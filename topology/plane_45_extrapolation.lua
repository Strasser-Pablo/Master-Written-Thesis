
function coordinatetostring(i,j,dir)
  ret='i'
  offset=0
  if i~=0 or dir==1 then
    if i>0 then
      ret=ret..'+'
      offset=-2
    else
      ret=ret..'-'
      i=-i;
    end
    if dir==1 then
      ret=ret..[[\frac{]]..(2*i+1+offset)..[[}{2}]]
    else
    ret=ret..i
    end
  end
  ret=ret..',j'
  offset=0
  if j~=0 or dir==2 then
    if j>0 then
      ret=ret..'+'
      offset=-2
    else
      ret=ret..'-'
      j=-j;
    end
    if dir==2 then
      ret=ret..[[\frac{]]..(2*j+1+offset)..[[}{2}]]
    else
    ret=ret..j
    end
  end
  return ret
end
tex.sprint('\\begin{center}')
tex.sprint('\\begin{tikzpicture}[x=3cm,y=3cm]')
for i=0,1 do
  for j=0,1 do
    colfluid=''
    if j==0 and i==0 then
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
    if not(i==1 and j==1) then
      tex.sprint('\\draw['..colfluid..'] ('..i..','..j..') rectangle ('..(i+1)..','..(j+1)..');')
    end
    if i==0 then
      tex.sprint('\\draw[->] ('..(i+0.5)..','..(j-0.1)..') -- node[left]{$\\textcolor{'..color2..'}{v^2_{'..coordinatetostring(i,j,2)..'}}$} ('..(i+0.5)..','..(j+0.1)..') ; ')
    end
    if j==0 then
      tex.sprint('\\draw[->] ('..(i-0.1)..','..(j+0.5)..') -- node[above]{$\\textcolor{'..color1..'}{v^1_{'..coordinatetostring(i,j,1)..'}}$} ('..(i+0.1)..','..(j+0.5)..') ; ')
    end
   end
end
tex.sprint([[ \node[rectangle split, rectangle split parts=2,rectangle split part fill={green, red}] at (0.5,0.5){}; ]])
tex.sprint('\\end{tikzpicture}')
tex.sprint('\\end{center}')