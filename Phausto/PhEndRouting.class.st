"
Helper class to contruct chains for physical models

"
Class {
	#name : 'PhEndRouting',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhEndRouting >> asBox [ 

^ PhCrossnn new asBox , Wire new asBox , Wire new asBox 
]

{ #category : 'initialization' }
PhEndRouting >> initialize [ 

^ super initialize
]
