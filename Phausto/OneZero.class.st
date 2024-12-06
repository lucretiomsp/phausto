"
One zero filter. Difference equation: y(n)=x(n)−zx(n−1)
.


"
Class {
	#name : 'OneZero',
	#superclass : 'PhFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
OneZero >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox :=  self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
OneZero >> initialize [

	super initialize.
	self processExpression: 'process = fi.zero;'
]
