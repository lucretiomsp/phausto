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
	
	code := 'import("stdfaust.lib"); process = ' , self asString  , ');'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]

{ #category : #converting }
PhVslider >> asString [
	" convert the PhVSlider object in the strng that would create it in Faust"

	| strng |
	strng := 'vslider("' , label asString , '"' , ' , ' , init asString
	         , ' , ' , min asString , ' , ' , max asString , ' , '
	         , step asString , ')'.

	^ strng
]

{ #category : #'as yet unclassified' }
PhVslider >> label: aLabel init: initValue min: minValue max: maxValue step: stepValue [

   label := aLabel.
	init := initValue.
	min := minValue.
	max := maxValue.
	step := stepValue
]
