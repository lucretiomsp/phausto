"
This class contains a collection of reverb taken from the Faust reverbs.lib
"
Class {
	#name : #Oscillators,
	#superclass : #UnitGenerator,
	#instVars : [
		'freq'
	],
	#category : #'Phausto-UnitGenerators'
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
	
	self freq: (PhHSlider new label: self label , 'Freq' init: 440  min: 1  max: 2000  step: 1). 
	self uLevel: 0.5
]

{ #category : #connecting }
Oscillators >> patchedWith: aUnitGenerator [
"by default, a Unit Generator connected to an Oscillator nodulates its frequency"
self freq: aUnitGenerator 
]
