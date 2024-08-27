Class {
	#name : 'PhVslider',
	#superclass : 'PhSlider',
	#category : 'Phausto-BoxAPI-UIPrimitives',
	#package : 'Phausto',
	#tag : 'BoxAPI-UIPrimitives'
}

{ #category : 'converting' }
PhVslider >> asBox [

	| sliderBox |
	BoxAPI uniqueInstance createLibContext.
	sliderBox := BoxAPI uniqueInstance
		             boxVslider: self label
		             init: self init
		             min: self min
		             max: self max
		             step: self step.

	^ sliderBox
]
