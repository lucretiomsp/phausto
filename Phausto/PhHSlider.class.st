"
I am a Faust horizontal slider
"
Class {
	#name : 'PhHSlider',
	#superclass : 'PhSlider',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhHSlider >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance
		             boxHslider: self label
		             init: self init asBox
		             min: self min asBox
		             max: self max asBox
		             step: self step asBox.

	^ sliderBox
]
