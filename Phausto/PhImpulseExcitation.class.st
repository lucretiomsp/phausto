"
Creates an impulse excitation of one sample.

## Parameters

- **gate**: Generates an impulse when the gate signal changes from 0 to a value greater than 1
"
Class {
	#name : 'PhImpulseExcitation',
	#superclass : 'Exciter',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
PhImpulseExcitation >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self gate asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
PhImpulseExcitation >> initialize [
	super initialize.
	processExpression := 'process = pm.impulseExcitation;'.
]
