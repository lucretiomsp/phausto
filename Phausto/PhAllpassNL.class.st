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

{ #category : 'faust' }
PhAllpassNL class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#nonLinearity -> 'amount of nonlinearity to be added (0-1)' }
]

{ #category : 'faust' }
PhAllpassNL class >> argumentNames [

	^ #( #nonLinearity )
]

{ #category : 'faust' }
PhAllpassNL class >> faustName [

	^ 'allpassNL'
]

{ #category : 'initialization' }
PhAllpassNL >> initializeArguments [

	nonLinearity := PhHSlider new
			label: self label , 'NonLinearity'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhAllpassNL >> nonLinearity [

	^ nonLinearity
]

{ #category : 'accessing' }
PhAllpassNL >> nonLinearity: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
