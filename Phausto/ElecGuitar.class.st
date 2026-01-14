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
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
ElecGuitar >> asBox [

	| intermediateBox finalBox length |
	intermediateBox := super asBox.
	length := self freq asBox  f2l.
	finalBox := (length , self pluckPosition asBox , self mute asBox , self gain asBox
	            , self trigger asBox) asBox connectTo:  intermediateBox.

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
	pluckPosition := (PhHSlider new
					   label: self label , 'PluckPos'
					   init: 0.8
					   min: 0
					   max: 1
					   step: 0.01).
	mute := 1 asBox.
	trigger := PhButton new label: self label , 'Trigger'.
	self controlParameters add: #trigger -> (self trigger
			 asControlParameterOfWidgetType: #button
			 description: 'Trig Guitar')
]

{ #category : 'as yet unclassified' }
ElecGuitar >> mute [ 
^ mute
]

{ #category : 'accessing' }
ElecGuitar >> pluckPosition [

	^ pluckPosition 
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

	^ trigger 
]
