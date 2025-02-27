"
Creates a filtered noise excitation


## Parameters

- **hPcutoff**: highpass cutoff frequency
- **lPcutoff**: lowpass cutoff frequency
- **strikeSharpness**: sharpness of the attack and release (0-1)
- **gain**: gain of the excitation
- **gate**: a gate button/trigger signal (0/1)
"
Class {
	#name : 'PluckString',
	#superclass : 'Exciter',
	#instVars : [
		'cutoff',
		'stringLength',
		'maxFreq',
		'strikeSharpness',
		'gain'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
PluckString >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self stringLength asBox , self cutoff asBox , self maxFreq
	            , self strikeSharpness asBox , self gain asBox
	            , self gate asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'as yet unclassified' }
PluckString >> cutoff [

	^ cutoff
]

{ #category : 'accessing' }
PluckString >> gain [

	^ gain
]

{ #category : 'initialization' }
PluckString >> initialize [

	super initialize.
	processExpression := 'process = pm.pluckString;'.
	"initialize controlParameters"
	cutoff := PhHSlider new
		          label: self label , 'Cutoff'
		          init: 1
		          min: 0
		          max: 10
		          step: 0.1.
	maxFreq := PhHSlider new
		           label: self label , 'MaxFreq'
		           init: 1
		           min: 0
		           max: 10
		           step: 0.1.

	gain := PhHSlider new
		        label: self label , 'Gain'
		        init: 0.5
		        min: 0
		        max: 1
		        step: 0.001.

	strikeSharpness := PhHSlider new
		                   label: self label , 'StrikePos'
		                   init: 0
		                   min: 0
		                   max: 4
		                   step: 1.
		stringLength := PhHSlider new
		                   label: self label , 'StringLength'
		                   init: 0.5
		                   min: 0.01
		                   max: 5
		                   step: 0.01
]

{ #category : 'as yet unclassified' }
PluckString >> maxFreq [

	^ maxFreq 
]

{ #category : 'accessing' }
PluckString >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'as yet unclassified' }
PluckString >> stringLength [ 

	^ stringLength
]
