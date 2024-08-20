"
Pink noise (1/f noise) generator (third-order approximation covering the audio band well). pink_noise is a standard Faust function.
"
Class {
	#name : 'PinkNoise',
	#superclass : 'Noise',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
PinkNoise >> initialize [

	super initialize.
	processExpression := 'process = no.pink_noise;'
]
