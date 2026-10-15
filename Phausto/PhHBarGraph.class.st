"
The hbargraph primitive implements a vertical bar-graph (typically a meter displaying the level of a signal).
"
Class {
	#name : 'PhHBarGraph',
	#superclass : 'PhBarGraph',
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
