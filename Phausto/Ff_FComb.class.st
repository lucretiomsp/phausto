"
Feed-Forward Comb Filter. Note that ff_fcomb takes floating-point delays (uses fdelay internally).
Parameteres: 
maxdel: maximum delay (a power of 2)
intdel: current (integer) comb-filter delay between 0 and maxdel
del: current (float) comb-filter delay between 0 and maxdel
b0: gain applied to delay-line input
bM: gain applied to delay-line output and then summed with input

"
Class {
	#name : 'Ff_FComb',
	#superclass : 'CombFilters',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
Ff_FComb >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self maxDel asBox, self del asBox, self b0 asBox, self bM asBox, self input asBox
		            connectTo: intermdiateBox.

	^ finalBox
]
