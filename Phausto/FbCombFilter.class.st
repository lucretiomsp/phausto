"
Other special cases of Feed-Back Comb Filter.

Parameters:
maxdel: maximum delay (a power of 2)
intdel: current (integer) comb-filter delay between 0 and maxdel
del: current (float) comb-filter delay between 0 and maxdel
g: feedback gain
"
Class {
	#name : 'FbCombFilter',
	#superclass : 'CombFilters',
	#instVars : [
		'aN',
		'g'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
FbCombFilter >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self maxDel asBox, self intDel asBox, self g asBox, self input asBox
		            connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'as yet unclassified' }
FbCombFilter >> g [

	^ g ifNil: [
		  g := PhHSlider new
			        label: self label , 'G'
			        init: 1
			        min: 0
			        max: 1
			        step: 0.001 ]
]
