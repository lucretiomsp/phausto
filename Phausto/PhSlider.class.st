"
Super class for Horizontal, Vertical and NumEntry slider created by the Faust compiler.

"
Class {
	#name : 'PhSlider',
	#superclass : 'UIPrimitive',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhSlider >> asBox [

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

{ #category : 'accessing' }
PhSlider >> init: aNumber [

	init := aNumber 
]

{ #category : 'initialization' }
PhSlider >> initialize [
super initialize .
	init := 0.5.
	step := 0.01.
	"by default, sliders are knobs"
	widgetType := #knob
]

{ #category : 'initialization' }
PhSlider >> initializeValue: aFloat [

"used for double dispatch to set initial value of UnitGenerators"
self init: aFloat
]

{ #category : 'initialization' }
PhSlider >> label: aLabel init: initValue min: minValue max: maxValue step: stepValue [

	label := aLabel.
	init := initValue .
	min := minValue .
	max := maxValue .
	step := stepValue 
]

{ #category : 'initialization' }
PhSlider >> label: aLabel values: anArray [
	"initialzie the Slider with ana array of values"


	label := aLabel.
	init := anArray first.
	min := anArray second.
	max := anArray third.
	step := anArray fourth .
	
((init > min ) and: (init < max ) and: (max > min)) ifFalse: [ ^ Error new signal: 'Please check initialization values' ]
]

{ #category : 'accessing' }
PhSlider >> step: aNumber [

	step := aNumber 
]
