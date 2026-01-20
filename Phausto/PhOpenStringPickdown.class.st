"
A bidirectional block implementing a ""generic"" string with selectable excitation position and stiffness. It also has a built-in pickup whose position can be independenly selected. The only constraint is that the pickup has to be placed before the excitation position.

## Parameters:
**length:** the length of the string in meters
**stiffness:** the stiffness of the string (0-1) (1 for max stiffness)
**pluckPosition:** pluck position on the string (0-1) (1 is bottom)
**pickupPosition: position of the pickup between the top of the string and the excitation position (0-1) (1 is excitation position)
**excitation:** the excitation signal
"
Class {
	#name : 'PhOpenStringPickdown',
	#superclass : 'PhStringAbstract',
	#instVars : [
		'pickupPosition',
		'stiffness'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhOpenStringPickdown >> asBox [

	^ self inputBlock asBox , self length asBox , self stiffness asBox
	  , self pluckPosition , self pickupPosition asBox
	  , self excitation asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhOpenStringPickdown >> initialize [

	super initialize.

	processExpression := 'process = pm.openStringPickDown;'.
	pickupPosition := PhSlider new
		                  label: 'StringPickupPos'
		                  values: #( 0.6 0.01 2 0.01 ).
	stiffness := PhSlider new
		             label: 'StringStiffness'
		             values: #( 0.8 0.01 2 0.01 )
]

{ #category : 'accessing' }
PhOpenStringPickdown >> pickupPosition [ 
^ pickupPosition
]

{ #category : 'accessing' }
PhOpenStringPickdown >> stiffness [
	^ stiffness
]
