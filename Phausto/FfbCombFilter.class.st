"
Other special cases of Feed-Back Comb Filter.

Parameters:
maxdel: maximum delay (a power of 2)
intdel: current (integer) comb-filter delay between 0 and maxdel
del: current (float) comb-filter delay between 0 and maxdel
g: feedback gain
"
Class {
	#name : 'FfbCombFilter',
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
FfbCombFilter >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self maxDel , self intDel , self del , self g , 
	             self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
FfbCombFilter >> del [

	^ del ifNil: [
		  del := PhHSlider new
			         label: self label , 'del'
			         init: 2
			         min: 2
			         max: 32
			         step: 0.01 ]
]

{ #category : 'as yet unclassified' }
FfbCombFilter >> g [

	^ g ifNil: [
		  g := PhHSlider new
			        label: self label , 'G'
			        init: 1
			        min: 0
			        max: 1
			        step: 0.001 ]
]
