"
Phaust noise generators library, taken from Faust noises.lib
Creating an instance of this class generates a white noise.
"
Class {
	#name : 'Noise',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
Noise >> initialize [

	super initialize.
	processExpression := 'process = no.noise;'.
	self uLevel: 0.4
]
