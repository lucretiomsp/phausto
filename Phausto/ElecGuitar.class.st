"
A simple acoustic guitar model with steel strings (based on guitarModel) implementing an excitation model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function.
"
Class {
	#name : 'ElecGuitar',
	#superclass : 'StringInstruments',
	#instVars : [
		'pluckPosition',
		'gain',
		'trigger',
		'mute'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
ElecGuitar >> asBox [

	| intermediateBox finalBox length |
	intermediateBox := super asBox.
	length := self freq f2l.
	finalBox := length , self pluckPosition , self mute asBox , self gain , self trigger
		            connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
ElecGuitar >> gain [

	^ gain ifNil: [
		  gain := PhHSlider new
			            label: self label , 'Gain'
			            init: 0.5
			            min: 0
			            max: 1
			            step: 0.01 ]
]

{ #category : 'initialization' }
ElecGuitar >> initialize [

	super initialize.
	processExpression := 'process = pm.elecGuitar;'.
	mute := 1 asBox.
]

{ #category : 'accessing' }
ElecGuitar >> mute [ 
^ mute
]

{ #category : 'accessing' }
ElecGuitar >> pluckPosition [

	^ pluckPosition ifNil: [
		  self pluckPosition: (PhHSlider new
				   label: self label , 'PluckPos'
				   init: 0.8
				   min: 0
				   max: 1
				   step: 0.01) ]
]

{ #category : 'accessing' }
ElecGuitar >> pluckPosition: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
ElecGuitar >> trigger [

	^ trigger ifNil: [
		  trigger := PhButton new label: self label , 'Trigger' ]
]
