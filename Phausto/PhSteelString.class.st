"
A bidirectional block implementing a basic steel string with selectable excitation position. This element is based on openString and has a fix stiffness corresponding to that of a steel string.

## Parameters:

**length:** the length of the string in meters
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal

"
Class {
	#name : 'PhSteelString',
	#superclass : 'PhStringAbstract',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhSteelString >> asBox [

	^ self inputBlock asBox , self length asBox , self pluckPosition , self excitation asBox
		  connectTo: super asBox
]

{ #category : 'initialization' }
PhSteelString >> initialize [

	super initialize.
	processExpression := 'process = pm.steelString;'
]
