"
The hbargraph primitive implements a vertical bar-graph (typically a meter displaying the level of a signal).
"
Class {
	#name : 'PhHBarGraph',
	#superclass : 'PhBox',
	#instVars : [
		'input',
		'sinput',
		'min',
		'max',
		'label'
	],
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhHBarGraph >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance
		             boxHBarGraphAux: self label
		             min: self min asBox
		             max: self max asBox
		             input: self input asBox.

	^ sliderBox
]

{ #category : 'initialization' }
PhHBarGraph >> initialize [

	super initialize.
	label := 'HBarGraph'.
	input := 1 asBox.
	min := -1.
	max := 1
]

{ #category : 'accessing' }
PhHBarGraph >> input [

	^ input
]

{ #category : 'accessing' }
PhHBarGraph >> input: anInput [

	input := anInput 
]

{ #category : 'accessing' }
PhHBarGraph >> label [

	^ label
]

{ #category : 'accessing' }
PhHBarGraph >> max [

	^ max
]

{ #category : 'accessing' }
PhHBarGraph >> max: aMax [

	max := aMax
]

{ #category : 'accessing' }
PhHBarGraph >> min [ 
^ min
]

{ #category : 'accessing' }
PhHBarGraph >> min: aMin [

	min := aMin
]
