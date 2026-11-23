"
The One Euro Filter (fi.oneEuro), an adaptive lowpass filter, typically for object-tracking or control signals.

**derivativeCutoff:** cutoff (Hz) of the filter applied to the derivative
**beta:** speed coefficient: higher means less lag on fast moves
**minCutoff:** minimum cutoff (Hz): lower means less jitter at slow speed
"
Class {
	#name : 'PhOneEuro',
	#superclass : 'PhFilter',
	#instVars : [
		'derivativeCutoff',
		'beta',
		'minCutoff'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhOneEuro >> asBox [

	^ self derivativeCutoff asBox , self beta asBox , self minCutoff asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhOneEuro >> beta [

	^ beta
]

{ #category : 'accessing' }
PhOneEuro >> beta: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOneEuro >> derivativeCutoff [

	^ derivativeCutoff
]

{ #category : 'accessing' }
PhOneEuro >> derivativeCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhOneEuro >> initialize [

	super initialize.
	processExpression := 'process = fi.oneEuro;'.
	derivativeCutoff := PhHSlider new label: self label , 'DerivativeCutoff' values: #( 1 0.1 10 0.01 ).
	beta := PhHSlider new label: self label , 'Beta' values: #( 0.007 0 1 0.001 ).
	minCutoff := PhHSlider new label: self label , 'MinCutoff' values: #( 1 0.01 10 0.01 )
]

{ #category : 'accessing' }
PhOneEuro >> minCutoff [

	^ minCutoff
]

{ #category : 'accessing' }
PhOneEuro >> minCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
