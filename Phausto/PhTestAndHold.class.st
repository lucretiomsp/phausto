"
Test And Hold: ""records"" the input when pred(input) is true, outputs a frozen value otherwise.

##Parameters:

**pred:** predicate to test the input
"
Class {
	#name : 'PhTestAndHold',
	#superclass : 'PhBasics',
	#instVars : [
		'pred'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhTestAndHold >> asBox [ 

^ self pred asBox , self input asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhTestAndHold >> initialize [

	super initialize.
	processExpression := 'process = ba.tAndH;'.
	input := 0.
	pred := 1
]

{ #category : 'accessing' }
PhTestAndHold >> input [ 
^ input 
]

{ #category : 'accessing' }
PhTestAndHold >> pred [ 

^ pred
]
