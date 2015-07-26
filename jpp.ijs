require 'debug/dissect'
coclass 'jpp'
 MYDIR =: getpath_j_  '\/' rplc~ > (4!:4<'thisfile'){(4!:3)  thisfile=:'' NB. boilerplate to set the working directory
require MYDIR , 'multiline2.ijs'
coinsert 'multiline'
lr_z_ =: 3 : '5!:5 < ''y'''
lrA_z_ =: 1 : '5!:5 < ''u'''
pD_z_ =:  1!:2&2
NB. findline =: 3 : 0
NB.   NB. ft =. WinText_jqtide_
NB.   NB. fs =. WinSelect_jqtide_
NB. 'ft fs' =.  {:"1 wd 'sm get term;'
NB.  fs =. 0 ". fs
NB.   ft =. 7 u: ft   NB.pD 'ft'; _50 {. 
NB.   NB. If a single value is selected, take the whole line; otherwise the selected region
NB.   if. 1 < # ~. fs do.
NB.    8 u:  (-~/\ fs) (];.0~ ,.)~ ft 
NB.   else.
NB.     fs =.  {.fs
NB.  
NB.     8 u: (LF taketo&.|. fs {. ft) , LF taketo fs }. ft
NB.   end.
NB. )
NB.
findline =: 3 : 0  NB. y is added to line or selected text
'' findline y
:
  ft =. 7 u: WinText_jqtide_
   fs =. WinSelect_jqtide_
NB.   NB. If a single value is selected, take the whole line; otherwise the selected region
  if. 1 < # ~. fs do.
   x,~ 8 u:  (-~/\ fs) (];.0~ ,.)~ ft 
  else.
    fs =.  {.fs
 
    x,~ pD 8 u:  (LF taketo&.|. fs {. ft) , LF taketo fs }. ft
  end.
)
DoWithMacro_z_ =: execM =: 3 : 0

NB. pD@:lr y
pD ( pD procmac_jpp_ y) eval lrA

)

MACm =: 1 : 0
 (> {: ;: m) ,  quote procmac ;: inv }: ;: m 
)

splitlasttoken =: ((<'9:') $: ]) : (4 : 0)  NB. presumed list of boxes
p =. x i:~ y
'split token is requred (9: is default)' assert p < #y
(p {. y) ,&< (>:p) }. y
)
 
MACd =: 1 : 0
 'b a' =. splitlasttoken }: ;: m
 ( ;: inv a) , ' ' , (> {: ;: m) ,  quote procmac ;: inv b 
)