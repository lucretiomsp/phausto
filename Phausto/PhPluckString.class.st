"
Creates a plucking excitation signal.

## Parameter

- **stringLength: length of the string to pluck
- **cutoff: cutoff ratio (1 for default)
- **maxFreq: max frequency ratio (1 for default)
- **strikeSharpness: sharpness of the attack and release (1 for default)
- **gain: gain of the excitation (0-1)
- **gate: trigger signal (1 for on, 0 for off)
"
Class {
	#name : 'PhPluckString',
	#superclass : 'Exciter',
	#instVars : [
		'cutoff',
		'stringLength',
		'maxFreq',
		'strikeSharpness',
		'gain'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
PhPluckString >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self stringLength asBox , self cutoff asBox , self maxFreq
	            , self strikeSharpness asBox , self gain asBox
	            , self gate asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'as yet unclassified' }
PhPluckString >> cutoff [

	^ cutoff
]

{ #category : 'accessing' }
PhPluckString >> gain [

	^ gain
]

{ #category : 'initialization' }
PhPluckString >> initialize [

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
PhPluckString >> maxFreq [

	^ maxFreq 
]

{ #category : 'accessing' }
PhPluckString >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'as yet unclassified' }
PhPluckString >> stringLength [ 

	^ stringLength
]
