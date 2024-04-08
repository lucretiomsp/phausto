"
Phaust noise generators library, taken from Faust noises.lib
Creating an instance of this class generates a white noise.
"
Class {
	#name : #Noise,
	#superclass : #UnitGenerators,
	#category : #'Phaust-BoxAPI-Boxes'
}

{ #category : #initialization }
Noise >> initialize [

	super initialize.
	processExpression :=  'process = no.noise;'
]
