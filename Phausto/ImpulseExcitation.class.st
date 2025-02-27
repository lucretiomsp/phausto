"
Creates an impulse excitation of one sample.

## Parameters

- **gate**: Generates an impulse when the gate signal changes from 0 to a value greater than 1
"
Class {
	#name : 'ImpulseExcitation',
	#superclass : 'Exciter',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
ImpulseExcitation >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self gate asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
ImpulseExcitation >> initialize [
	super initialize.
	processExpression := 'process = pm.impulseExcitation;'.
]
