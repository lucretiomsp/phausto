"
One zero filter. Difference equation: y(n)=x(n)−zx(n−1).
##Parameters:

**z:** location of zero along real axis in z-plane.

[More info](https://ccrma.stanford.edu/~jos/filters/One_Zero.html)
"
Class {
	#name : 'PhZero',
	#superclass : 'PhFilter',
	#instVars : [
		'zero'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhZero >> asBox [ 
^ self zero asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhZero >> initialize [

	super initialize.
	processExpression := 'process = fi.zero;'.
	zero := PhHSlider new label: self label , 'Zero' values: #(0.5 -1 1 0.01)
]

{ #category : 'converting' }
PhZero >> zero [ 
^ zero
]
