"
A simple trombone based on a lowpassed sawtooth wave. sawTrombone is a standard Faust function.


freq: the frequency in Hz
gain: the gain (0-1)
gate: the gate (0 or 1)
"
Class {
	#name : 'SawTrombone',
	#superclass : 'Synths',
	#instVars : [
		'freq',
		'gain',
		'gate'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
SawTrombone >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self gain asBox , self gate asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
SawTrombone >> freq [

	^ freq ifNil: [
		  freq := PhHSlider new
			          label: self label , 'Note'
			          init: 440
			          min: 20
			          max: 1400
			          step: 0.1 ]
]

{ #category : 'accessing' }
SawTrombone >> freq: aNumberOrABoxOraASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self

	
]

{ #category : 'as yet unclassified' }
SawTrombone >> gain [

	^ gain ifNil: [
		  freq := PhHSlider new
			          label: self label , 'Gain'
			          init: 0.5
			          min: 0
			          max: 1
			          step: 0.01 ]
]

{ #category : 'as yet unclassified' }
SawTrombone >> gain: aNumberOrABoxOraASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
SawTrombone >> gate [

	^ gate ifNil: [ gate := PhButton new label: self label ,  'Gate' ]
]

{ #category : 'accessing' }
SawTrombone >> gate:aNumberOrABoxOraASymbol [

| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
SawTrombone >> initialize [

	super initialize.
	processExpression := 'process = sy.sawTrombone;'
]
