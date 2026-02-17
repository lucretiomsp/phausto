"
One zero filter. Difference equation: y(n)=x(n)−zx(n−1)
.
More info here: https://ccrma.stanford.edu/~jos/filters/One_Zero.html

Parameters

zero: location of zero along real axis in z-plane
"
Class {
	#name : 'PhOneZero',
	#superclass : 'PhFilter',
	#instVars : [
		'zero'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhOneZero >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self zero asBox, self input asBox connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
PhOneZero >> initialize [

	super initialize.
	self processExpression: 'process = fi.zero;'
]

{ #category : 'accessing' }
PhOneZero >> zero [

	^ zero ifNil: [
		  zero := PhHSlider new
			          label: self label , 'Zero'
			          init: 0
			          min: 0
			          max: 0.999
			          step: 0.001 ]
]
