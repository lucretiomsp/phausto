"
Function that lets through the mth impulse out of each consecutive group of n impulses.


totalImpulses = the total number of impulses being split.
impulseIndex =  index of impulse to allow to be output
"
Class {
	#name : 'PhResetCtr',
	#superclass : 'UnitGenerator',
	#instVars : [
		'totalImpulses',
		'impulseIndex',
		'input'
	],
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
PhResetCtr >> asBox [

	| intermediateBox  finalBox |
	intermediateBox := super asBox.
	
	finalBox := self totalImpulses asBox , self impulseIndex asBox , self input asBox  connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhResetCtr >> impulseIndex [

	^ impulseIndex ifNil: [
		  impulseIndex := PhHSlider new
			            label: self label , 'ImpulseIndex'
			            init: 4
			            min: 1
			            max: 64
			            step: 1 ]
]

{ #category : 'initialization' }
PhResetCtr >> initialize [

	super initialize.
	processExpression := 'process = ba.resetCtr;'.


]

{ #category : 'initialization' }
PhResetCtr >> input [

	^ input ifNil: [
		  input := 0 asBox ]
]

{ #category : 'initialization' }
PhResetCtr >> totalImpulses [

	^ totalImpulses ifNil: [
		  totalImpulses := PhHSlider new
			            label: self label , 'TotalImpulses'
			            init: 4
			            min: 1
			            max: 64
			            step: 1 ]
]
