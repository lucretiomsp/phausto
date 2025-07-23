"
Feed-Back Comb Filter (float delay).


maxdel: maximum delay (a power of 2)
intdel: current (integer) comb-filter delay between 0 and maxdel
del: current (float) comb-filter delay between 0 and maxdel
b0: gain applied to delay-line input and forwarded to output
aN: minus the gain applied to delay-line output before summing with the input and feeding to the delay line
"
Class {
	#name : 'Fb_FComb',
	#superclass : 'CombFilters',
	#instVars : [
		'aN'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'as yet unclassified' }
Fb_FComb >> aN [


	^ aN ifNil: [
		  aN := PhHSlider new
			        label: self label , 'AN'
			        init: 1
			        min: 0
			        max: 1
			        step: 0.001 ]
]

{ #category : 'converting' }
Fb_FComb >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self maxDel asBox, self del asBox, self b0 asBox, self aN asBox, self input asBox
		            connectTo: intermdiateBox.

	^ finalBox
]
