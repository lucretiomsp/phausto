"
Schroeder Allpass Comb Filter. 
Same as allpass_fcomb but use fdelay5 internally 
See: https://ccrma.stanford.edu/~jos/Delay/Schroeder_Allpass_Filters.html

Parameters:

maxdel: maximum delay (a power of 2)
intdel: current (integer) comb-filter delay between 0 and maxdel
del: current (float) comb-filter delay between 0 and maxdel
aN: minus the feedback gain
"
Class {
	#name : 'Allpass_FComb5',
	#superclass : 'CombFilters',
	#instVars : [
		'aN'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
Allpass_FComb5 >> aN [


	^ aN ifNil: [
		  aN := PhHSlider new
			        label: self label , 'AN'
			        init: 1
			        min: 0
			        max: 1
			        step: 0.001 ]
]

{ #category : 'converting' }
Allpass_FComb5 >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self maxDel asBox, self del asBox, self aN asBox, self input asBox connectTo:
		            intermdiateBox.

	^ finalBox
]
