Class {
	#name : #PhSliders,
	#superclass : #UIGenerators,
	#instVars : [
		'init',
		'min',
		'max',
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
super initialize .
label := 'label'.
init := 0.5.
min := 0.
max := 1.
step := 0.01.
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
PhSliders >> max [

	^ max
]

{ #category : #accessing }
PhSliders >> max: aNumber [
	max := aNumber
]

{ #category : #accessing }
PhSliders >> min [

	^ min
]

{ #category : #accessing }
PhSliders >> min: aNumber [

	min := aNumber
]

{ #category : #accessing }
PhSliders >> step [

	^ step
]

{ #category : #accessing }
PhSliders >> step: aNumber [

	step := aNumber
]
