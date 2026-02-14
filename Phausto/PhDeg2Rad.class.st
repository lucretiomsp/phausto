"
Convert degrees to radians.
"
Class {
	#name : 'PhDeg2Rad',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhDeg2Rad >> initialize [

	super initialize.
	self processExpression: 'process = ma.deg2rad;'
]

{ #category : 'accessing' }
PhDeg2Rad >> input [ 
^input 
]
