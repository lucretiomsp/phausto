"
Turns a signal into an impulse with the value of the current sample (0.3,0.2,0.1 becomes 0.3,0.0,0.0). This function is typically used with a button to turn its output into an impulse. **impulsify** is a standard Faust function.

When a UnitGenerator is chucked (=>) into an **Impulsify**, it becomes its gate signal.

## Parameters
- **gate** the signal turned into impulse
"
Class {
	#name : 'Impulsify',
	#superclass : 'UnitGenerator',
	#instVars : [
		'gate'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
Impulsify >> asBox [

	| intermediateBox finalBox gateBox |
	intermediateBox := super asBox.
	gateBox := self gate asBox.
	finalBox := gateBox connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'accessing' }
Impulsify >> gate [

	^ gate ifNil: [ gate := PhButton new label: self label ]
]

{ #category : 'initialization' }
Impulsify >> initialize [

	super initialize.
	processExpression := 'process = ba.impulsify;'
]

{ #category : 'accessing' }
Impulsify >> patchedWith: aUnitGenerator [

self gate: aUnitGenerator 
]
