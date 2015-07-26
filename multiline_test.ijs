
cocurrent 'base'
MYDIR =: getpath_j_  '\/' rplc~ > (4!:4<'thisfile'){(4!:3)  thisfile=:'' NB. boilerplate to set the working directory
require MYDIR , 'multiline2.ijs'

NB. parenbutconjunction_multiline_ not used as it produces non standard (but valid) output.  see test4
parenbutconjunction_multiline_ =: 0 : 0  Tacify 
addparen 		NB. paren full line. has its own code to not paren 1 token.			
 `		NB. else
   (> {: ;: MACcompose  NB. open cross line paren: 	dont paren 1 token
     ` 		NB. else
    ( > {: ;:)  ,~  (,&' ')@: addparen @: (;: inv) @: }: ;:  MACcompose
  			NB. fork: paren what is prior to conj.
    @.(1 < # @: ;:) )   	NB. then if len > 1 (conjunction)
 @. 		NB. if
   (  1 = # @: ;: 	 	NB. len is 1
	   +.	 	NB. or	
      2 = ncS@>@{:@: ;: )   	NB. last is conjunction
)

test =:  0 Tacify 
( +/ 
  x % y 13 MACdef  		NB.macro that will call 13 : x % y and return %
  #)
                NB. blank line with comment next without comment

   @:>
)


test2 =:  0  Tacify 
+: y 3 MACdef
 ( @:+:
   @:+
   /)
)

test3 =:  0  Tacify 
4 + [	      NB. bivalent verb will use 4 + x if called dyadically. 4+ y if monad.
 +
2
 x + y 4 MACdef
]
)


test4 =: 0 Tacify
-:
  +: @  NB. note this creates expression leading with +:@-:
  @ +: 
  @ +: 
  @
  +/ +:@ +: MACcompose
)

test5 =:  0 Tacify
 ( 
  +/ 
  x % y 13 MACdef
  #
 ) 	      NB. single ) must be indented at least 1. Otherwise 0:0 ends.
                NB. blank line with comment next without comment

   @:>
)
test6 =: 0 TacifyR_multiline_
)   NB. too weird. When reversing, parens must be single line and close at top, open at bottom
 #)
 %
 (+/
( 
)

test7 =: 0  Tacify
  +: @  NB. note this creates expression leading with +:@-:
  @ -: 
  @ +:("1) 
  @ +:
)
test8=:  0  Tacify
 2&c
  @:
  (c
   c
  c =. [ + ]  NB. fails as tacify removes assignment.  Though this works to assign c to subverb in tacit
  -
  ])
)

test8=:  0  Tacify
  (4 : 'c')
+
 [
 x * y c MACassignR   NB.('c =: x * y' (13 :)) 
 ]

)
test9 =: 0 Tacify , 0 Tacify
]
)
+:
)
mixes =: 0 Tacify  NB.langford strings type interleaving
NB. ] (+"1/ #~&(,/) 1 - +./ .*&:*"1/) [ {.~"1 0 (-@}. i.@>:)&{:&$
] 
 (+"1/ 		NB. dyadic/ y +"1/ righward justifies of x. result is 3d (2d for each rightward justify)
    ,/		NB. roll up 1 dimension of each side to make both 2d
      #~&		NB. equiv to  #~&(,/) selects from rolled up +"1/ table
  1 
    - 		NB. 1 - to produce 0 1 boolean 3d table
  +./ .*&:*  	NB. inner product over y items *"1/ rightward justifies of x
    "1/) 		NB. adverbs apply to whole previous phrase
[ 		NB. x
 {.~"1 0 		NB. rightward justifies of x upto size of y item shape
   -@}. i.@>:   NB. hook: negative of excess sizes y over x item shapes as list of i. of y item shape	
     &{:		NB. item shapes of each xy
       &$  	NB. x is 1d, y 2d
)