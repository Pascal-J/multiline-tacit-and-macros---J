# multiline-tacit-and-macros---J

Jwiki page on multiline tacit expressions:  
http://www.jsoftware.com/jwiki/PascalJasmin/Multiline%20tacit%20expressions%20with%20macros

allows writting tacit J expressions with fewer parentheses, MACROS that modify lines within the tacit expression, and comments for each part of a tacit expression

For example, this expression:

parenbutnot1 =: 0 : 0  Tacify   
addparen 		NB. paren full line. has its own code to not paren 1 token.	 		
 `		NB. else  
  > {: ;: MACcompose   		NB. dont paren 1 token  
 @. 		NB. if  
  1 = # @: ;: 	 	    NB. len is 1  
)

compiles to:

addparen`(>@:{:@:;:)@.(1 = #@:;:)

the code is used by the parsers to implicitly parenthesize any line with more than one token.  You will notice that no parentheses are in the original definition, and several are in the compiled one.  

MACcompose in the expression is a macro that inserts @: between tokens on its line

# MACROS

A macro is an adverb that should start with 'MAC' as its name.  The naming convention allows the procmac function to automatically invoke macros if they are found at the end of a line.

A macro adverb takes a string parameter as its left argument, and must return a string.  Many macros have parameters specific to their operation, and then dump the rest of the line as baggage.  Whenever a macro uses a bulk-remainder text as part of its return value it should call procmac on that remainder so that macros can be chained together.

procmac is a verb that takes a string, tokenizes it with ;:, and if there is a Macro as the rightmost token, calls that macro with the remainder of the string as its argument.  If no macros are present, it returns its input string.

# Macros for J console (j804)

It is recommended to use the following user defined key (add this line to userkeys.cfg accessible through edit|configure menu)

F12;0;Macro exec;execM_jpp_@findline_jpp_ 0

Afterwards hitting F12 will let you execute any line or selection in the console.

If that line has a macro on its right, then it will modify the line prior to execution, including recursively scanning for more macros.
F12 will show you the final code that is run, followed by a linear representation of its result.
If you want to see the regular representation, you can hit enter twice on the code representation, or the result.

# Some useful console macros

MACm:  the token to the left of MACm is a monadic verb that takes a string as right argument.

example (F12 on this line... notice no quotes)

    2+2 dissect MACm

runs  
dissect'2 + 2'  

MACd:  the token to the left of MACd is a dyadic verb that takes a string as right argument.  Tokens to the left of that dyadic verb up to 9: (will be excluded) are that verb's left parameter. example:

    i.1000 9: (2+8) timespacex MACd
    
runs  
( 2 + 8 ) timespacex'i. 1000'  
equivalent to: (dyadic parameter expression will also be evaluated, but passed as is)  
10 timespacex'i. 1000'

Another way to explain macros is that they are string transformation functions where the string contains the transformation function.  To work more directy with such strings:


   procmac_jpp_ 'i.1000 9: (2+8) timespacex MACd'  
( 2 + 8 ) timespacex'i. 1000'  
   ".@:procmac_jpp_ 'i.1000 9: (2+8) timespacex MACd'  
2.432e_6 9472  
   ".@:procmac_jpp_ '2+2'  
4
