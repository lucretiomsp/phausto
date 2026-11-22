"
Generic two zeros bridge FIR filter (as implemented in the [STK](https://ccrma.stanford.edu/software/stk/)) that can be used to implement the reflectance violin, guitar, etc. bridges.

##Parameters: 

**brightness:** controls the damping of high frequencies (0-1)
**absorption:** controls the absorption of the brige and thus the t60 of the string plugged to it (0-1) (1 = 20 seconds)

"
Class {
	#name : 'PhBridgeFilter',
	#superclass : 'PhPmFunction',
	#instVars : [
		'brightness',
		'absorption'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhBridgeFilter class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#brightness -> 'controls the damping of high frequencies (0-1)'.
			#absorption -> 'controls the absorption of the brige and thus the t60 of the string plugged to it (0-1) (1 = 20 seconds)' }
]

{ #category : 'faust' }
PhBridgeFilter class >> argumentNames [

	^ #( #brightness #absorption )
]

{ #category : 'faust' }
PhBridgeFilter class >> faustName [

	^ 'bridgeFilter'
]

{ #category : 'accessing' }
PhBridgeFilter >> absorption [

	^ absorption
]

{ #category : 'accessing' }
PhBridgeFilter >> absorption: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBridgeFilter >> brightness [

	^ brightness
]

{ #category : 'accessing' }
PhBridgeFilter >> brightness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhBridgeFilter >> initializeArguments [

	brightness := PhHSlider new
			label: self label , 'Brightness'
			values: #( 0.5 0 1 0.01 ).
	absorption := PhHSlider new
			label: self label , 'Absorption'
			values: #( 0.5 0 1 0.01 )
]
