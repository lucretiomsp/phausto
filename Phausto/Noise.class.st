"
Phaust noise generators superclass, taken from Faust [noises.lib](https://faustlibraries.grame.fr/libs/noises/)
Creating an instance of this class generates a white noise. Subclasses implement noise with differnt colors
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
	
]
