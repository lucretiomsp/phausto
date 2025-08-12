Class {
	#name : 'PhCopySign',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhCopySign >> initialize [

	super initialize.
	self processExpression: 'process = ma.copysign;'
]

{ #category : 'accessing' }
PhCopySign >> inputL [

	^ inputL
]

{ #category : 'accessing' }
PhCopySign >> inputR [

	^ inputR
]
