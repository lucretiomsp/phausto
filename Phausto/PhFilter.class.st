"
In signal processing, a filter is a process or device that removes frequencies from a signal
"
Class {
	#name : 'PhFilter',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
PhFilter >> input [

	^ input ifNil:  [
		  input  := PhHSlider new
			          label: self label , 'Input'
			          init: 5000
			          min: 20
			          max: 18000
			          step: 1 ] 
]

{ #category : 'connecting' }
PhFilter >> patchedWith: aUnitGenerator [

self  input: aUnitGenerator asBox
]
