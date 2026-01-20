"
Helper class to contruct chains for physical models

"
Class {
	#name : 'Ph2BlocksChain',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
Ph2BlocksChain >> asBox [

	^ PhCrossnn new asBox , PhMem new asBox , Wire new asBox
]

{ #category : 'initialization' }
Ph2BlocksChain >> initialize [ 

^ super initialize
]
