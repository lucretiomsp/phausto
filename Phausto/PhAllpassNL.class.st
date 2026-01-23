"
Bidirectional block adding nonlinearities in both directions in a chain. Nonlinearities are created by modulating the coefficients of a passive allpass filter by the signal it is processing.
## Parameters 
**nonlinearity:** amount of nonlinearity to be added (0-1)
"
Class {
	#name : 'PhAllpassNL',
	#superclass : 'PhPmElement',
	#instVars : [
		'nonLinearity'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
PhAllpassNL >> asBox [ 

^ self inputBlock asBox , self nonLinearity asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhAllpassNL >> initialize [

	super initialize.
	processExpression := 'process = pm.allpassNL;'.
	nonLinearity := PhHSlider new label: 'NonLinearity' values: #(0.5 0 1 0.01).
]

{ #category : 'converting' }
PhAllpassNL >> nonLinearity [

^ nonLinearity
]
