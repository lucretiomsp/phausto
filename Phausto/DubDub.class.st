"
A simple synth based on a sawtooth wave filtered by a resonant lowpass. dubDub is a standard Faust function.



freq: frequency of the sawtooth in Hz
ctFreq: cutoff frequency of the filter
q: Q of the filter
gate: the trigger signal (0 or 1)
"
Class {
	#name : 'DubDub',
	#superclass : 'Synths',
	#instVars : [
		'freq',
		'ctFreq',
		'q',
		'gate'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
DubDub >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self ctFreq , self q asBox , self gate asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'as yet unclassified' }
DubDub >> ctFreq [

	^ freq ifNil: [
		  freq := PhHSlider new
			          label: self label , 'CtFreq'
			          init: 50
			          min: 20
			          max: 1400
			          step: 0.1 ]
]

{ #category : 'accessing' }
DubDub >> freq [

	^ freq ifNil: [
		  freq := PhHSlider new
			          label: self label , 'Note'
			          init: 50
			          min: 20
			          max: 1400
			          step: 0.1 ]
]

{ #category : 'accessing' }
DubDub >> freq: aNumberOrABoxOraASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self

	
]

{ #category : 'accessing' }
DubDub >> gate [

	^ gate ifNil: [ gate := PhButton new label: self label ,  'Gate' ]
]

{ #category : 'accessing' }
DubDub >> gate:aNumberOrABoxOraASymbol [

| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
DubDub >> initialize [

	super initialize.
	processExpression := 'process = sy.dubDub;'
]
