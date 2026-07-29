"
Clip the value of the input signal between min and max
"
Class {
	#name : 'PhClip',
	#superclass : 'Saturators',
	#traits : 'PhMaxMinSetter',
	#classTraits : 'PhMaxMinSetter classTrait',
	#instVars : [
		'min',
		'max'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhClip >> asBox [

	^  self min asBox , self max asBox , self input asBox
		            connectTo: self code asBox
]

{ #category : 'initialization' }
PhClip >> initialize [

	super initialize.
	processExpression := 'process = aa.clip;'.
	max := PhHSlider new
		       label: self label , 'Max'
		       init: 1
		       min: -1
		       max: 1
		       step: 0.001.
	min := PhHSlider new
				  label: self label , 'Min'
				  init: -1
				  min: -1
				  max: 1
				  step: 0.001 
]

{ #category : 'accessing' }
PhClip >> max [

	^ max 
]

{ #category : 'accessing' }
PhClip >> min [

	^ min 
]
