"
Creates an impulse excitation of one sample.

## Parameters

- **gate**: Generates an impulse when the gate signal changes from 0 to a value greater than 1
"
Class {
	#name : 'PhImpulseExcitation',
	#superclass : 'Exciter',
	#instVars : [
		'gate'
	],
	#category : 'Phausto-PhysModels - Exciters',
	#package : 'Phausto',
	#tag : 'PhysModels - Exciters'
}

{ #category : 'faust' }
PhImpulseExcitation class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#gate -> 'a gate button' }
]

{ #category : 'faust' }
PhImpulseExcitation class >> argumentNames [

	^ #( #gate )
]

{ #category : 'faust' }
PhImpulseExcitation class >> faustName [

	^ 'impulseExcitation'
]

{ #category : 'accessing' }
PhImpulseExcitation >> gate [

	^ gate
]

{ #category : 'accessing' }
PhImpulseExcitation >> gate: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhImpulseExcitation >> initializeArguments [

	gate := PhButton new label: self label , 'Gate'
]
