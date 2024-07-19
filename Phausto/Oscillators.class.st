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
		ifTrue: [ self freq init: aNumberOrABox ]
		ifFalse: [ freq := aNumberOrABox  ]
]

{ #category : #initialization }
Oscillators >> initialize [

	super initialize.
	"default frequency for all Oscilators is A4 at picth standard"

	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 440
		        min: 1
		        max: 2000
		        step: 0.001.
	uLevel := PhHSlider new
		        label: self label , 'ULevel'
		        init: 0.5
		        min: 0
		        max: 1
		        step: 0.001. 
]
