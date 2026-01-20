"
Helper class to contruct chains for physical models

"
Class {
	#name : 'PhPostRouting',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhPostRouting >> asBox [ 

^ PhCrossnn new asBox , Wire new asBox , Wire new asBox 
]

{ #category : 'initialization' }
PhPostRouting >> initialize [ 

^ super initialize
]
