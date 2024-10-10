"
A simple acoustic guitar model with steel strings (based on guitarModel) implementing an excitation model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function.
"
Class {
	#name : 'Guitar',
	#superclass : 'StringInstruments',
	#instVars : [
		'pluckPosition',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
Guitar >> asBox [

	| intermediateBox finalBox freq |
	intermediateBox := super asBox.
	freq := self length f2l.
	finalBox := freq , self pluckPosition , self gain
	            , self trigger connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
Guitar >> gain [

	^ gain ifNil: [
		  gain := PhHSlider new
			            label: self label , 'Gain'
			            init: 0.5
			            min: 0
			            max: 1
			            step: 0.01 ]
]

{ #category : 'accessing' }
Guitar >> gain: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
Guitar >> initialize [

	super initialize.
	processExpression := 'process = pm.guitar;'
]

{ #category : 'accessing' }
Guitar >> pluckPosition [

	^ pluckPosition ifNil: [
		  self pluckPosition: (PhHSlider new
				   label: self label , 'PluckPos'
				   init: 0.8
				   min: 0
				   max: 1
				   step: 0.01) ]
]

{ #category : 'accessing' }
Guitar >> pluckPosition: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
Guitar >> trigger [

	^ trigger ifNil: [
		  trigger := PhButton new label: self label , 'Trigger' ]
]

{ #category : 'accessing' }
Guitar >> trigger: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]
