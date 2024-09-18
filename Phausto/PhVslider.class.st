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
		             init: self init
		             min: self min
		             max: self max
		             step: self step.

	^ sliderBox
]
