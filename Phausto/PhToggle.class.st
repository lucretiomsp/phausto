"
Triggered by the change of 0 to 1, it toggles the output value between 0 and 1.
"
Class {
	#name : 'PhToggle',
	#superclass : 'PhBasics',
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhToggle >> asBox [ 

^ self input asBox connectTo: super asBox 
]

{ #category : 'accessing' }
PhToggle >> initialize [ 

super initialize .
processExpression := 'process = ba.toggle;'
]
