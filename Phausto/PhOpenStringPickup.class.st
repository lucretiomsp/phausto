"
A bidirectional block implementing a ""generic"" string with selectable excitation position. It also has a built-in pickup whose position is the same as the excitation position. Thus, moving the excitation position will also move the pickup.

## Parameters

**length:** the length of the string in meters
**stiffness:** the stiffness of the string (0-1) (1 for max stiffness)
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal
"
Class {
	#name : 'PhOpenStringPickup',
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
PhOpenStringPickup >> asBox [

	^ self inputBlock asBox , self length asBox , self stiffness asBox
	  , self pluckPosition , self pickupPosition asBox
	  , self excitation asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhOpenStringPickup >> initialize [

	super initialize.

	processExpression := 'process = pm.openStringPickUp;'.
	pickupPosition := PhSlider new
		                  label: 'StringPickupPos'
		                  values: #( 0.6 0.01 2 0.01 ).
	stiffness := PhSlider new
		             label: 'StringStiffness'
		             values: #( 0.8 0.01 2 0.01 )
]

{ #category : 'accessing' }
PhOpenStringPickup >> pickupPosition [ 
^ pickupPosition
]

{ #category : 'accessing' }
PhOpenStringPickup >> stiffness [
	^ stiffness
]
