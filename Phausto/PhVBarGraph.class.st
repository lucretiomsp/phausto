"
The hbargraph primitive implements a vertical bar-graph (typically a meter displaying the level of a signal).
"
Class {
	#name : 'PhVBarGraph',
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
PhVBarGraph >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance
		             boxVBarGraphAux: self label
		             min: self min asBox
		             max: self max asBox
		             input: self input asBox.

	^ sliderBox
]

{ #category : 'initialization' }
PhVBarGraph >> initialize [

	super initialize.
	label := 'HBarGraph'.
	input := 1 asBox.
	min := -1.
	max := 1
]

{ #category : 'accessing' }
PhVBarGraph >> input [

	^ input
]

{ #category : 'accessing' }
PhVBarGraph >> input: anInput [

	input := anInput 
]

{ #category : 'accessing' }
PhVBarGraph >> label [

	^ label
]

{ #category : 'accessing' }
PhVBarGraph >> label: aString [

	label := aString 
]

{ #category : 'accessing' }
PhVBarGraph >> max [

	^ max
]

{ #category : 'accessing' }
PhVBarGraph >> max: aMax [

	max := aMax
]

{ #category : 'accessing' }
PhVBarGraph >> min [ 
^ min
]

{ #category : 'accessing' }
PhVBarGraph >> min: aMin [

	min := aMin
]

{ #category : 'connecting' }
PhVBarGraph >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator
]
