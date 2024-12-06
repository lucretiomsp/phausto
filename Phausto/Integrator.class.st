"
One zero filter. Difference equation: y(n)=x(n)−zx(n−1)
.


"
Class {
	#name : 'Integrator',
	#superclass : 'PhFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
Integrator >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox :=  self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
Integrator >> initialize [

	super initialize.
	self processExpression: 'process = fi.zero;'
]
