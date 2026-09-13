"
I am a vertical bar graph with no input
"
Class {
	#name : 'PhVBarGraphNoInput',
	#superclass : 'PhBarGraph',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhVBarGraphNoInput >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance
		             boxVBarGraph: self label
		             min: self min asBox
		             max: self max asBox.

	^ sliderBox
]
