"
A bidirectional block implementing a basic ""generic"" string with a selectable excitation position. Lowpass filters are built-in and allow to simulate the effect of dispersion on the sound and thus to change the ""stiffness"" of the string.

## Parameters: 

**length:** the length of the string in meters
**stiffness:** the stiffness of the string (0-1) (1 for max stiffness)
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal
"
Class {
	#name : 'PhOpenString',
	#superclass : 'PhStringAbstract',
	#instVars : [
		'stiffness'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhOpenString >> asBox [

	^ self inputBlock asBox , self length asBox , self stiffness asBox ,  self pluckPosition
	  , self excitation asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhOpenString >> initialize [

	super initialize.
	processExpression := 'process = pm.openString;'.
	stiffness := PhSlider new
		          label: 'StringStiffness'
		          values: #( 0.8 0.01 2 0.01 ).
]

{ #category : 'converting' }
PhOpenString >> stiffness [ 
^ stiffness
]
