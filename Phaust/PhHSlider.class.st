Class {
	#name : #PhHSlider,
	#superclass : #PhSliders,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
PhHSlider >> asBox [

	| sliderBox |
	sliderBox := BoxAPI uniqueInstance
		             boxHslider: self label
		             init: self init
		             min: self min
		             max: self max 
		             step: self step .

	^ sliderBox
]
