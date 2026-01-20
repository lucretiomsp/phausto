"
Helper class to contruct chains for physical models

"
Class {
	#name : 'PhPreRouting',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhPreRouting >> asBox [

	^ PhCrossnn new asBox , PhMem new asBox , Wire new asBox
]

{ #category : 'initialization' }
PhPreRouting >> initialize [ 

^ super initialize
]
