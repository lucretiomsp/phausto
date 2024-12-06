"
Typical special case of ff_comb() where: b0 = 1.


Parameteres: 
maxdel: maximum delay (a power of 2)
intdel: current (integer) comb-filter delay between 0 and maxdel
del: current (float) comb-filter delay between 0 and maxdel

bM: gain applied to delay-line output and then summed with input

"
Class {
	#name : 'FfCombFilter',
	#superclass : 'CombFilters',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
FfCombFilter >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self maxDel , self intDel , self del , self bM
	            , self input connectTo: intermdiateBox.

	^ finalBox
]
