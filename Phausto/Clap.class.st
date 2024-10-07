"
Clap synthesis with filtered noise
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
	#category : 'Phausto-BoxAPI-Synths',
	#package : 'Phausto',
	#tag : 'BoxAPI-Synths'
}

{ #category : 'converting' }
Clap >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := tone asBox , attack asBox , decay asBox , self gate asBox
		            connectTo: intermediateBox.
	^ finalBox 
]

{ #category : 'accessing' }
Clap >> attack [

	^ attack
]

{ #category : 'accessing' }
Clap >> attack:aNumberOrABoxOraAymbol [

| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraAymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
Clap >> decay [

	^ decay
]

{ #category : 'accessing' }
Clap >> decay: aBoxorAFloat [

	decay := aBoxorAFloat asBox
]

{ #category : 'accessing' }
Clap >> gate [

	^ gate ifNil: [ gate := PhButton new label: self label ,  'Gate' ]
]

{ #category : 'accessing' }
Clap >> gate:aNumberOrABoxOraASymbol [

| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
Clap >> initialize [

	super initialize.
	processExpression := 'process = sy.clap;'.
	tone := 1200.
	attack := 0.
	decay := 0.3.
	
]

{ #category : 'accessing' }
Clap >> tone [

	^ tone
]

{ #category : 'accessing' }
Clap >> tone: aBoxorAFloat [

	tone := aBoxorAFloat asBox
]
