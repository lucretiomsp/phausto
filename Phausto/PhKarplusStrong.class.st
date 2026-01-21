"
A Karplus-Strong string (in that case, the string is implemented as a one dimension waveguide).

## Parameters: 
**length:** the length of the string in meters
**damping:** string damping (0-1)
**excitation:** excitation signal
"
Class {
	#name : 'PhKarplusStrong',
	#superclass : 'UnitGenerator',
	#instVars : [
		'length',
		'damping',
		'excitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhKarplusStrong >> asBox [

	^ self length asBox , self damping asBox , self excitation asBox
		  connectTo: super asBox
]

{ #category : 'accessing' }
PhKarplusStrong >> damping [
^ damping
]

{ #category : 'accessing' }
PhKarplusStrong >> excitation [ 
^ excitation
]

{ #category : 'initialization' }
PhKarplusStrong >> initialize [

	super initialize.
   processExpression := 'process =pm.ks;'.
	length := PhSlider new label: 'KSLength' values: #( 0.8 0.01 2 0.01 ).
	damping := PhHSlider new label: 'KSDamping' values: #( 0.3 0 1 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhKarplusStrong >> length [ 

^ length
]
