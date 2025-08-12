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
