"
A virtual blower creating a _DC signal_ with some breath noise in it.

## Parameters

- **pressure**: pressure (0-1)
- **breathGain**: breath noise gain (0-1) (recommended: 0.005)
- **breathCutoff**: breath cuttoff frequency (Hz) (recommended: 2000)
"
Class {
	#name : 'Blower',
	#superclass : 'Exciter',
	#instVars : [
		'breathGain',
		'pressure',
		'breathCutoff'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
Blower >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self pressure asBox , self breathGain asBox
	            , self breathCutoff asBox connectTo: intermediateBox.

	^ intermediateBox
]

{ #category : 'accessing' }
Blower >> breathCutoff [

	^ breathCutoff
]

{ #category : 'accessing' }
Blower >> breathGain [

	^ breathGain
]

{ #category : 'initialization' }
Blower >> initialize [

	super initialize.
	processExpression := 'process = pm.blower;'.
	"initialize controlParameters"

	breathGain := PhHSlider new
		              label: self label , 'BreathGain'
		              init: 0.005
		              min: 0
		              max: 1
		              step: 0.001.
	pressure := PhButton new label: self label , 'Pressure'.
	breathCutoff := PhHSlider new
		                label: self label , 'BreathCutoff'
		                init: 2000
		                min: 0
		                max: 4000
		                step: 1
]

{ #category : 'accessing' }
Blower >> pressure [

	^ pressure
]
