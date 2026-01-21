"
Generic two zeros bridge FIR filter (as implemented in the [STK](https://ccrma.stanford.edu/software/stk/)) that can be used to implement the reflectance violin, guitar, etc. bridges.

##Parameters: 

**brightness:** controls the damping of high frequencies (0-1)
**absorption:** controls the absorption of the brige and thus the t60 of the string plugged to it (0-1) (1 = 20 seconds)

"
Class {
	#name : 'PhBridgeFilter',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input',
		'brightness',
		'absorption'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'accessing' }
PhBridgeFilter >> absorption [ 
^ absorption 
]

{ #category : 'converting' }
PhBridgeFilter >> asBox [ 

^ self input asBox , self brightness  asBox , self absorption asBox connectTo: super asBox
]

{ #category : 'accessing' }
PhBridgeFilter >> brightness [ 
^ brightness
]

{ #category : 'initialization' }
PhBridgeFilter >> initialize [

	super initialize.
	processExpression := 'process = pm.bridgeFilter;'.
	brightness := PhHSlider new
		              label: 'BFBrightness'
		              values: #( 0.6 0 1 0.01 ).
	absorption := PhHSlider new
		              label: 'BFAbsorption'
		              values: #( 0.6 0 1 0.01 ).
		input := 0
]

{ #category : 'accessing' }
PhBridgeFilter >> input [ 
^ input 
]
