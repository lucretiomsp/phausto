"
Current block-size. Can change during the execution at each block.
"
Class {
	#name : 'PhBlockSize',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhBlockSize >> initialize [

	super initialize.
	self processExpression: 'process = ma.BS;'
]
