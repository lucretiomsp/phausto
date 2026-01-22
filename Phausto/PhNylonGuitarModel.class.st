"
A simple acoustic guitar model with nylon strings and selectable excitation position. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function. Pitch is changed by changing the length of the string and not through a finger model. WARNING: this function doesn't currently implement a body (just strings and bridge).
## Parameters:

**length:** the length of the string in meters
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal

"
Class {
	#name : 'PhNylonGuitarModel',
	#superclass : 'PhStringAbstract',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhNylonGuitarModel >> asBox [

	^  self length asBox , self pluckPosition
	  , self excitation asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhNylonGuitarModel >> initialize [

	super initialize.
	processExpression := 'process = pm.nylonGuitarModel;'
]
