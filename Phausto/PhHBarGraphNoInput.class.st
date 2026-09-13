"
I am an horizontal bar graph with no input
"
Class {
	#name : 'PhHBarGraphNoInput',
	#superclass : 'PhBarGraph',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhHBarGraphNoInput >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance 
		             boxHBarGraph: self label
		             min: self min asBox
		             max: self max asBox.

	^ sliderBox
]
