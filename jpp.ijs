require 'debug/dissect'
coclass 'jpp'
 MYDIR =: getpath_j_  '\/' rplc~ > (4!:4<'thisfile'){(4!:3)  thisfile=:'' NB. boilerplate to set the working directory
require MYDIR , 'multiline2.ijs'
coinsert 'multiline'
lr_z_ =: 3 : '5!:5 < ''y'''
lrA_z_ =: 1 : '5!:5 < ''u'''
pD_z_ =:  1!:2&2
findline =: 3 : 0
  NB. ft =. WinText_jqtide_
  NB. fs =. WinSelect_jqtide_
'ft fs' =.  {:"1 wd 'sm get term;'
 fs =. 0 ". fs
  ft =. 7 u: ft   NB.pD 'ft'; _50 {. 
  NB. If a single value is selected, take the whole line; otherwise the selected region
  if. 1 < # ~. fs do.
   8 u:  (-~/\ fs) (];.0~ ,.)~ ft 
  else.
    fs =.  {.fs
 
    8 u: (LF taketo&.|. fs {. ft) , LF taketo fs }. ft
  end.
)
execM =: 3 : 0

NB. pD@:lr y
pD ( pD procmac y) eval lrA

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