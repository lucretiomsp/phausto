"
Clap synthesis via filtered white noise.


Where:

tone: bandpass filter cutoff frequency, tuned for [400Hz, 3500Hz]
attack: attack time in seconds, tuned for [0s, 0.2s]
decay: decay time in seconds, tuned for [0s, 4.0s]
gate: the gate which triggers the amp envelope
"
Class {
	#name : 'Clap',
	#superclass : 'Synths',
	#instVars : [
		'tone',
		'attack',
		'decay',
		'gate'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
Clap >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self tone asBox , self attack asBox , self decay asBox
	            , self gate asBox connectTo: intermediateBox.
	^ finalBox * 0.2 asBox
]

{ #category : 'accessing' }
Clap >> attack [

^ attack
]

{ #category : 'accessing' }
Clap >> attack: aNumberOrABoxOraASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
Clap >> decay [

	^ decay ifNil: [
		  decay := PhHSlider new
			          label: self label , 'Decay'
			          init: 0.2
			          min: 0
			          max: 4.0
			          step: 0.01 ]
]

{ #category : 'accessing' }
Clap >> decay:  aNumberOrABoxOraASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
Clap >> gate [

	^ gate ifNil: [ gate := PhButton new label: self label , 'Gate' ]
]

{ #category : 'accessing' }
Clap >> gate: aNumberOrABoxOraASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
Clap >> initialize [

	super initialize.
	self processExpression: 'process = sy.clap;'.

	attack := 0
]

{ #category : 'accessing' }
Clap >> tone [

	^ tone ifNil: [
		  tone := PhHSlider new
			          label: self label , 'Note'
			          init: 2200
			          min: 400
			          max: 3500
			          step: 1 ]
]

{ #category : 'accessing' }
Clap >> tone:  aNumberOrABoxOraASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]
