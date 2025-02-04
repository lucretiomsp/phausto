"
Super class for Horizontal, Vertical and NumEntry slider created by the Faust compiler.

"
Class {
	#name : 'PhSlider',
	#superclass : 'UIPrimitive',
	#instVars : [
		'init',
		'step'
	],
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
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

{ #category : 'initialization' }
PhSlider >> initializeValue: aFloat [

"used for double dispatch to set initial value of UnitGenerators"
self init: aFloat
]

{ #category : 'as yet unclassified' }
PhSlider >> label: aLabel init: initValue min: minValue max: maxValue step: stepValue [

	label := aLabel.
	init := initValue asBox.
	min := minValue asBox.
	max := maxValue asBox.
	step := stepValue asBox
]

{ #category : 'as yet unclassified' }
PhSlider >> label: aLabel values: anArray [

"initialzie the SLider with ana array of values"
	label := aLabel.
	init := (anArray at: 1) asBox.
	min :=(anArray at: 2)  asBox.
	max := (anArray at: 3)  asBox.
	step :=(anArray at: 4)  asBox
]

{ #category : 'accessing' }
PhSlider >> step [

	^ step
]

{ #category : 'accessing' }
PhSlider >> step: aNumber [

	step := aNumber asBox
]
