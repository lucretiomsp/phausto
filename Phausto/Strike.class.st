"
Strikes generator with controllable excitation position

## Parameters

- **strikePosition**: excitation position wiht 0: for max low freqs and 1: for max high freqs. So, on membrane for example, 0 would be the middle and 1 the edge
- **strikeSharpness**: sharpness of the attack and release (0-1)
- **gain**: gain of the excitation
- **gate**: a gate button/trigger signal (0-1)
"
Class {
	#name : 'Strike',
	#superclass : 'Exciter',
	#instVars : [
		'strikePosition',
		'strikeSharpness',
		'gain'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
Strike >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self strikePosition asBox ,
	             self strikeSharpness asBox , self gain asBox
	            , self gate asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
Strike >> gain [

	^ gain
]

{ #category : 'initialization' }
Strike >> initialize [

	super initialize.
	processExpression := 'process = pm.strike;'.
	"initialize controlParameters"

	gain := PhHSlider new
		        label: self label , 'Gain'
		        init: 0.5
		        min: 0
		        max: 1
		        step: 0.001.
	self strikePosition: (PhHSlider new
			 label: self label , 'StrikePos'
			 init: 0
			 min: 0
			 max: 4
			 step: 1).
	strikeSharpness := PhHSlider new
		                   label: self label , 'StrikePos'
		                   init: 0
		                   min: 0
		                   max: 4
		                   step: 1
]

{ #category : 'accessing' }
Strike >> strikePosition [
	^ strikePosition
]

{ #category : 'accessing' }
Strike >> strikeSharpness [

	^ strikeSharpness
]
