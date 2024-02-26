"
This class contains a collection of reverb taken from the Faust reverbs.lib
"
Class {
	#name : #Oscillators,
	#superclass : #UnitGenerators,
	#instVars : [
		'freq'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #accessing }
Oscillators >> freq [

	^ freq 
]

{ #category : #accessing }
Oscillators >> freq: aFloat [

	freq := aFloat
]

{ #category : #initialization }
Oscillators >> initialize [

	super initialize.
	"default frequency for all Oscilators is A4 at picth standard"
	self freq: 440 asBox
]
