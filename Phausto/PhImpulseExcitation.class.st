"
Creates an impulse excitation of one sample.

## Parameters

- **trigger**: Generates an impulse when the trigger signal changes from 0 to a value greater than 1
"
Class {
	#name : 'PhImpulseExcitation',
	#superclass : 'Exciter',
	#instVars : [
		'trigger'
	],
	#category : 'Phausto-PhysModels - Exciters',
	#package : 'Phausto',
	#tag : 'PhysModels - Exciters'
}

{ #category : 'faust' }
PhImpulseExcitation class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#trigger -> 'trigger' }
]

{ #category : 'faust' }
PhImpulseExcitation class >> argumentNames [

	^ #( #trigger )
]

{ #category : 'faust' }
PhImpulseExcitation class >> faustName [

	^ 'impulseExcitation'
]

{ #category : 'accessing' }
PhImpulseExcitation >> gate [

	"alias of trigger (older Phausto name)"

	^ trigger
]

{ #category : 'accessing' }
PhImpulseExcitation >> gate: aNumberOrABoxOrASymbol [

	"alias of trigger: (older Phausto name)"

	self trigger: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhImpulseExcitation >> initializeArguments [

	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
PhImpulseExcitation >> trigger [

	^ trigger
]

{ #category : 'accessing' }
PhImpulseExcitation >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
