"
Same as pole(1) [implemented separately for block-diagram clarity].

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

	finalBox := 1 asBox , self input asBox connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
Integrator >> initialize [

	super initialize.
	self processExpression: 'process = fi.zero;'
]
