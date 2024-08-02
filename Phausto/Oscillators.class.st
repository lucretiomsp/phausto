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
Oscillators >> freq: aNumberOrABox [

	aNumberOrABox isNumber
		ifTrue: [ freq := PhHSlider new label: self label , 'Freq' init: aNumberOrABox min: 20 max: 4086 step: 1]
		ifFalse: [ freq := aNumberOrABox  ]
]

{ #category : #initialization }
Oscillators >> initialize [

	super initialize.
	"default frequency for all Oscilators is A4 at picth standard"

	
]

{ #category : #initialization }
Oscillators >> initializeUIParameters [

	super initializeUIParameters.
	"default frequency for all Oscilators is A4 at picth standard - maxValue corresponds to a C8 note"

	"the UI element to control the freq is created only if the parameter is nil at instance creation"
	freq ifNil: [freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 440
		        min: 1
		        max: 4186
		        step: 0.001]
]
