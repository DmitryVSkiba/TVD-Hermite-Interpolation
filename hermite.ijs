x=: 0.01 * i. 100
NB. y=: ( *:`%: @. (] > &0.5))"0 x


x1=:0 0.25 0.35 0.5 0.8 1.0
y1 =: 0 0.25 0.4 0.7 1 1

require 'plot'



NB.x1=: 0.1 * i.10
NB.y1=: ( *:`%: @. (] > &0.5))"0 x1
pd 'reset'
 pd 'output pdf'

NB.pd x;y
pd 'color red;type marker'

pd x1;y1

pd 'show'




h=: 2 -~/\ x1
del=: (2 -~/\ y1) % h
H=: 2 +/\ h
w1=: ((}:h)+H) %(3*H)
w2=: ((}.h)+H) %(3*H)
dmax=: 2>./\del
dmin=: 2<./\del
A=: (dmin*dmax)%((w1*(}.del))+(w2*(}:del)))
d=: A * (((}.del)*(}:del))>0)
D0=: ((((1{h)+2*(0{h))*(0{del))-((0{h)*(1{del)))%((0{h)+(1{h))
DNM=: ((((_2{h)+2*(_1{h))*(_1{del))-((_1{h)*(_2{del)))%((_1{h)+(_2{h))
D0=: D0 * ((D0*(0{del))>0)
DNM=: DNM * ((DNM*(_1{del))>0)
D=: D0,d,DNM

P1=: (del-(}:D))%(h)
P2=: ((}.D)-del)%(h)

indx=: ((x1 I. x)-1)<.((#x1)-2)
indx=: (indx)>.(0)
indx1=: (indx+1)
indx1=: ((#x1)-1)<.indx1
indx1=: (indx1)>.(0)
teta=: (x - (indx{x1))
PP2=: indx{P2
PP1=: indx{P1
DD=: indx{D
yz=: (indx{y1)
yz=: yz+teta*(DD+teta*(((2*PP1)-PP2)+teta*((PP2-PP1)%(indx{h))))
pd 'color blue;type line'
pd x;yz
pd 'show'