"
A collection of Envelopes from the Faust envelopes.lib
"
Class {
	#name : 'Reverbs',
	#superclass : 'UnitGenerator',
	#instVars : [
		'inputL',
		'inputR',
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
Reverbs >> damp: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
Reverbs >> initialize [

	super initialize.

	numberOfOutputs := 2.
	input := Wire new .
	inputL := Wire new.
	inputR := Wire new
]

{ #category : 'accessing' }
Reverbs >> input [

	^ input 
]

{ #category : 'accessing' }
Reverbs >> inputL [

	^ inputL
]

{ #category : 'accessing' }
Reverbs >> inputR [

	^ inputR ifNil: [ inputR := Wire new ]
]

{ #category : 'accessing' }
Reverbs >> label [

	^ label
]
