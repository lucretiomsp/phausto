"
Helper class to construct chains for physical models

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

	^ Cut new asBox , Wire new asBox , Wire new asBox 
]

{ #category : 'initialization' }
PhPostRouting >> initialize [ 

^ super initialize
]
