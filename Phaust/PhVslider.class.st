Class {
	#name : #PhVslider,
	#superclass : #UIGenerators,
	#instVars : [
		'init',
		'min',
		'max',
		'step'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
PhVslider >> asBox [

	| box code |
	code := 'import("stdfaust.lib"); process = hslider("' , label , '"' , init asString , min asString, max asString, step asString ,');'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]

{ #category : #'as yet unclassified' }
PhVslider >> init: initValue min: minValue max: maxValue step: stepValue [

	init := initValue.
	min := minValue.
	max := maxValue.
	step := stepValue
]
