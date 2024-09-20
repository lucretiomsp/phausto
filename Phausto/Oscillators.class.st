"
This class contains a collection of reverb taken from the Faust reverbs.lib
"
Class {
	#name : 'Oscillators',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'accessing' }
Oscillators >> freq [

	^ freq ifNil: [   PhHSlider new
		        label: self label , 'Freq'
		        init: 440
		        min: 20
		        max: 4086
		        step: 1 ]
]

{ #category : 'accessing' }
Oscillators >> freq: aNumberOrABoxOraAymbol [


	aNumberOrABoxOraAymbol asParam: 'freq' forUGen: self



	"freq := aNumberOrABox isNumber
		        ifTrue: [ self freq init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ]"
]

{ #category : 'initialization' }
Oscillators >> initialize [

	super initialize.
	"default frequency for all Oscilators is A4 at picth standard"
]
