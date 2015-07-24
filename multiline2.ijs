cocurrent 'z'
isNoun =: (0 = 4!:0 ( :: 0:))@:<  
arString=:3 :'z=.y 1 :y label_. 5!:1<''z'' '
ncS=:3 :'z=.y 1 :y label_. 4!:0 <''z'' ' :: _2: NB. nameclass of string
pD =:  1!:2&2
eval =: 1 : ' a: 1 :  m'
A =: 1 : 'u'
 cocurrent 'multiline'
Tacify =: 1  : 0 NB. predefine to bootstrap parenbutconjunction
pD lines=. addparen@:procmac@:stripcomment leaf LF cut m
1 (1 : (;: inv lines))
NB.for_line. |. lines do. end.
)

procmac =: 3 : 0
if. ('MAC' -:  3&{.@:>@{:) ;: y do. (;: inv  }: ;: y) 1 (1  : ( > {: ;: y))  else. y end.
)

addparen =: (')' ,~ '(' , ])^:(0<#)
NB. addquote =: '''' ,~ '''' , ]
stripcomment =: }:^:('NB.' -:  3&{.@:>@{:)&.;: 

NB.macros must return string
NB. example macro transforms a quoteless expr into a definition (1 2 3 4 13)
MACdef =: 1 :  0
(> {: ;: m) , ' : ' , (quote procmac ;: inv }: ;: m )
)
MACcompose =: 1 : 0 NB. inserts @: between consecutive verbs.  or adverb verb
;: inv ({. ;: m), 2 {:`('@:' , leaf {:)@.(((1=ncS@{. ) +. 3=ncS@{.) *. 3=ncS@{:)\ ;: m
)
MACcompose2 =: 1 : 0 
a=. (m , ' y') (13 :)
5!:5 <'a'
)
MACassignR =: 1 : 0 
NB. '( 13 : '  ,( quote (> {: ;: m) , ' =: ' ,  (;: inv }: ;: m )) , ')'
 ' 13 : ', ( quote (> {: ;: m) , ' =: ' ,  (procmac ;: inv }: ;: m ))
)
MACassign =: 1 : 0 

    (> {: ;: m) , ' =: ' ,  (procmac ;: inv }: ;: m )
)

sA =: 1 : 'u'
 NB. 3 Tacify 

parenbutnot1 =: 0 : 0  Tacify 
addparen 		NB. paren full line. has its own code to not paren 1 token.			
 `		NB. else
  > {: ;: MACcompose   		NB. dont paren 1 token
 @. 		NB. if
  1 = # @: ;: 	 	    NB. len is 1

)


NB. Tacify_z_ =:
 Tacify =: (0 :) 1  : 0 
NB. pD lines=. parenbutconjunction_multiline_@:procmac_multiline_@:stripcomment_multiline_ leaf LF cut m
pD LF cut m
pD lines=. parenbutnot1@:procmac@:stripcomment leaf LF cut m
1 (1 : (;: inv lines))
)
T2 =: (0 :) Tacify
TacifyC =: 2 : 0
pD lines=. parenbutnot1@:procmac@:stripcomment leaf v LF cut m
1 (1 : (;: inv lines))
)
TacifyR =:  (0 :) (TacifyC |.)
Tacify_z_ =: Tacify_multiline_

