Class {
	#name : 'PhSlider',
	#superclass : 'UIPrimitive',
	#instVars : [
		'init',
		'step'
	],
	#category : 'Phausto-BoxAPI-UIPrimitives',
	#package : 'Phausto',
	#tag : 'BoxAPI-UIPrimitives'
}

{ #category : 'accessing' }
PhSlider >> init [

	^ init
]

{ #category : 'accessing' }
PhSlider >> init: aNumber [

	init := aNumber asBox
]

{ #category : 'initialization' }
PhSlider >> initialize [

	super initialize.

	init := 0.5.

	step := 0.01
]

{ #category : 'as yet unclassified' }
PhSlider >> label: aLabel init: initValue min: minValue max: maxValue step: stepValue [

	label := aLabel.
	init := initValue asBox.
	min := minValue asBox.
	max := maxValue asBox.
	step := stepValue asBox
]

{ #category : 'accessing' }
PhSlider >> step [

	^ step
]

{ #category : 'accessing' }
PhSlider >> step: aNumber [

	step := aNumber asBox
]
