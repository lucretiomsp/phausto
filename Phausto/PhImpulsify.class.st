"
Turns a signal into an impulse with the value of the current sample (0.3,0.2,0.1 becomes 0.3,0.0,0.0). This function is typically used with a button to turn its output into an impulse. **impulsify** is a standard Faust function.

When a UnitGenerator is chucked (=>) into an **Impulsify**, it becomes its gate signal.

## Parameters
- **gate** the signal turned into impulse
"
Class {
	#name : 'PhImpulsify',
	#superclass : 'UnitGenerator',
	#instVars : [
		'gate'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhImpulsify >> asBox [

	| intermediateBox finalBox gateBox |
	intermediateBox := super asBox.
	gateBox := self gate asBox.
	finalBox := gateBox connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'accessing' }
PhImpulsify >> gate [

	^ gate ifNil: [ gate := PhButton new label: self label ]
]

{ #category : 'initialization' }
PhImpulsify >> initialize [

	super initialize.
	processExpression := 'process = ba.impulsify;'
]

{ #category : 'accessing' }
PhImpulsify >> patchedWith: aUnitGenerator [

self gate: aUnitGenerator 
]
