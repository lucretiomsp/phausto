"
Feed-Back Comb Filter (integer delay).


maxdel: maximum delay (a power of 2)
intdel: current (integer) comb-filter delay between 0 and maxdel
del: current (float) comb-filter delay between 0 and maxdel
b0: gain applied to delay-line input and forwarded to output
aN: minus the gain applied to delay-line output before summing with the input and feeding to the delay line
"
Class {
	#name : 'Fb_Comb',
	#superclass : 'CombFilters',
	#instVars : [
		'aN'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
Fb_Comb >> aN [

	^ aN 
]

{ #category : 'converting' }
Fb_Comb >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self maxDel asBox, self intDel asBox, self b0 asBox, self aN asBox
	            , self input asBox connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
Fb_Comb >> initialize [

	super initialize.
	aN := PhHSlider new
		      label: self label , 'AN'
		      init: 0.76
		      min: 0
		      max: 1
		      step: 0.001
]
