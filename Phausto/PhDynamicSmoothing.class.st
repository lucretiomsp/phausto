"
Adaptive smoother based on Andy Simper's paper (fi.dynamicSmoothing): follows fast, large changes of the input and filters out small perturbations. Useful for control signals.

**sensitivity:** how much the cutoff opens on fast changes (0 to 1)
**baseCF:** base cutoff frequency (Hz)
"
Class {
	#name : 'PhDynamicSmoothing',
	#superclass : 'PhFilter',
	#instVars : [
		'sensitivity',
		'baseCF'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhDynamicSmoothing >> asBox [

	^ self sensitivity asBox , self baseCF asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhDynamicSmoothing >> baseCF [

	^ baseCF
]

{ #category : 'accessing' }
PhDynamicSmoothing >> baseCF: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhDynamicSmoothing >> initialize [

	super initialize.
	processExpression := 'process = fi.dynamicSmoothing;'.
	sensitivity := PhHSlider new label: self label , 'Sensitivity' values: #( 0.5 0 1 0.01 ).
	baseCF := PhHSlider new label: self label , 'BaseCF' values: #( 2 0.1 50 0.1 )
]

{ #category : 'accessing' }
PhDynamicSmoothing >> sensitivity [

	^ sensitivity
]

{ #category : 'accessing' }
PhDynamicSmoothing >> sensitivity: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
