"
The vbargraph primitive implements a vertical bar-graph (typically a meter displaying the level of a signal).
"
Class {
	#name : #PhVBarGraph,
	#superclass : #UIGenerators,
	#category : #'Phausto-BoxAPI-UIPrimitives'
}

{ #category : #converting }
PhVBarGraph >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance
		             boxVBarGraph: self label  min: self min  max: self max. 
	^ sliderBox
]
