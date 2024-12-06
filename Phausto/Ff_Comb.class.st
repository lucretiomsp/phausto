"
Feed-Forward Comb Filter. Note that ff_comb requires integer delays (uses delay internally). 

Parameteres: 
maxdel: maximum delay (a power of 2)
intdel: current (integer) comb-filter delay between 0 and maxdel
del: current (float) comb-filter delay between 0 and maxdel
b0: gain applied to delay-line input
bM: gain applied to delay-line output and then summed with input

"
Class {
	#name : 'Ff_Comb',
	#superclass : 'CombFilters',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
Ff_Comb >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self maxDel , self intDel , self b0 , self bM
	            , self input connectTo: intermdiateBox.

	^ finalBox
]
