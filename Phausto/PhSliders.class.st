Class {
	#name : #PhSliders,
	#superclass : #UIGenerators,
	#instVars : [
		'init',
		'step'
	],
	#category : #'Phausto-BoxAPI-UIPrimitives'
}

{ #category : #accessing }
PhSliders >> init [

	^ init
]

{ #category : #accessing }
PhSliders >> init: aNumber [

	init := aNumber
]

{ #category : #initialization }
PhSliders >> initialize [

	super initialize.

	init := 0.5.

	step := 0.01
]

{ #category : #'as yet unclassified' }
PhSliders >> label: aLabel init: initValue min: minValue max: maxValue step: stepValue [

	label := aLabel.
	init := initValue asBox.
	min := minValue asBox.
	max := maxValue asBox.
	step := stepValue asBox
]

{ #category : #accessing }
PhSliders >> step [

	^ step
]

{ #category : #accessing }
PhSliders >> step: aNumber [

	step := aNumber
]
