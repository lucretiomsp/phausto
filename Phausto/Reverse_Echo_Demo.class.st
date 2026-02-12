"
Multichannel echo effect with reverse delays.

##Parameters:
**n**: number of channnels (should be > 1)
"
Class {
	#name : 'Reverse_Echo_Demo',
	#superclass : 'PhDemosMono',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
Reverse_Echo_Demo >> initialize [ 

super initialize .
processExpression := 'process = dm.reverse_echo_demo(3);'
]
