"
Convert radians to degrees.
"
Class {
	#name : 'PhRad2Deg',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhRad2Deg >> initialize [

	super initialize.
	self processExpression: 'process = ma.rad2deg;'
]

{ #category : 'converting' }
PhRad2Deg >> input [ 
^ input
]
