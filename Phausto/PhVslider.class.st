"
I am a Phausto vertical slider
"
Class {
	#name : 'PhVSlider',
	#superclass : 'PhSlider',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhVSlider >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance
		             boxVslider: self label
		             init: self init asBox
		             min: self min asBox
		             max: self max asBox
		             step: self step asBox.

	^ sliderBox
]
