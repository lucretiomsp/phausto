"
One zero filter. Difference equation: y(n)=x(n)−zx(n−1)
More info here: https://ccrma.stanford.edu/~jos/filters/One_Pole.html

Parameters:
pole: pole location = feedback coefficient


"
Class {
	#name : 'Pole',
	#superclass : 'PhFilter',
	#instVars : [
		'pole'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
Pole >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self pole ,self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
Pole >> initialize [

	super initialize.
	self processExpression: 'process = fi.zero;'
]

{ #category : 'accessing' }
Pole >> pole [

	^ pole ifNil: [
		  pole := PhHSlider new
			       label: self label , 'Pole'
			       init: 0
			       min: 0
			       max: 0.999
			       step: 0.001 ]
]
