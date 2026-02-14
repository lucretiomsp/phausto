"
Flush to zero: force samples under the ""maximum subnormal number"" to be zero. Usually not needed in C++ because the architecture file take care of this, but can be useful in JavaScript for instance.
"
Class {
	#name : 'PhFTZ',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhFTZ >> initialize [

	super initialize.
	self processExpression: 'process = ma.FTZ;'
]

{ #category : 'accessing' }
PhFTZ >> input [ 
^ input
]
