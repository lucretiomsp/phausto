"
Colllection of Comb Filters from the Faust Library
In signal processing, a comb filter is a filter implemented by adding a delayed version of a signal to itself, causing constructive and destructive interference. The frequency response of a comb filter consists of a series of regularly spaced notches in between regularly spaced peaks (sometimes called teeth) giving the appearance of a comb.

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'CombFilters',
	#superclass : 'PhFilter',
	#instVars : [
		'maxDel',
		'intDel',
		'del',
		'b0',
		'bM'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
CombFilters >> b0 [

	^ b0 ifNil: [
		  b0 := PhHSlider new
			       label: self label , 'B0'
			       init: 1
			       min: 0
			       max: 1
			       step: 0.001 ]
]

{ #category : 'accessing' }
CombFilters >> bM [

	^ bM ifNil: [
		  bM := PhHSlider new
			       label: self label , 'BM'
			       init: 1
			       min: 0
			       max: 1
			       step: 0.001 ]
]

{ #category : 'accessing' }
CombFilters >> del [

	^ del ifNil: [
		  del := PhHSlider new
			         label: self label , 'del'
			         init: 2
			         min: 0
			         max: 32
			         step: 0.01 ]
]

{ #category : 'initialization' }
CombFilters >> initialize [

	| faustFunctionName |
	faustFunctionName := (self class name findBetweenSubstrings: ' ')
		                     first asLowercase.
	super initialize.
	processExpression := 'process = fi.' , faustFunctionName , ';'
]

{ #category : 'accessing' }
CombFilters >> input [

	^ input ifNil: [ input := 1 asBox ]
]

{ #category : 'accessing' }
CombFilters >> input: aPhBox [

	input := aPhBox
]

{ #category : 'accessing' }
CombFilters >> intDel [

	^ intDel ifNil: [
		  intDel := PhHSlider new
			            label: self label , 'IntDel'
			            init: 2
			            min: 0
			            max: 32
			            step: 1 ]
]

{ #category : 'accessing' }
CombFilters >> maxDel [

	^ 32 asBox
]
