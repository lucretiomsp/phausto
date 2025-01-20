"
Linear interpolation between two signals.

Parameters:
interpControl: interpolation control between 0 and 1 (0: first input; 1: second input)
"
Class {
	#name : 'PhInterpolate',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input1',
		'input2',
		'interpControl'
	],
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'converting' }
PhInterpolate >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self interpControl asBox , self input1 asBox
	            , self input2 asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhInterpolate >> initialize [ 



	super initialize.
	processExpression := 'process = si.interpolate;'
]

{ #category : 'accessing' }
PhInterpolate >> input1 [ 

^ input1 ifNil: [ input1 := 1 asBox ]
]

{ #category : 'accessing' }
PhInterpolate >> input2 [

	^ input2 ifNil: [ input2 := 1 asBox ]
]

{ #category : 'accessing' }
PhInterpolate >> interpControl [

	^ interpControl ifNil: [ interpControl := PhHSlider new label: self class name , 'Interp' init: 0 min: 0 max: 0 step: 0.001]
]
