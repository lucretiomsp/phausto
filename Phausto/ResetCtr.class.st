"
Function that lets through the mth impulse out of each consecutive group of n impulses.


totalImpulses = the total number of impulses being split.
impulseIndex =  index of impulse to allow to be output
"
Class {
	#name : 'ResetCtr',
	#superclass : 'UnitGenerator',
	#instVars : [
		'totalImpulses',
		'impulseIndex',
		'input'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
ResetCtr >> asBox [

	| intermediateBox  finalBox |
	intermediateBox := super asBox.
	
	finalBox := self totalImpulses , self impulseIndex, self input connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
ResetCtr >> impulseIndex [

	^ impulseIndex ifNil: [
		  impulseIndex := PhHSlider new
			            label: self label , 'ImpulseIndex'
			            init: 4
			            min: 1
			            max: 64
			            step: 1 ]
]

{ #category : 'initialization' }
ResetCtr >> initialize [

	super initialize.
	processExpression := 'process = ba.resetCtr;'.


]

{ #category : 'initialization' }
ResetCtr >> input [

	^ input ifNil: [
		  input := 0 asBox ]
]

{ #category : 'initialization' }
ResetCtr >> totalImpulses [

	^ totalImpulses ifNil: [
		  totalImpulses := PhHSlider new
			            label: self label , 'TotalImpulses'
			            init: 4
			            min: 1
			            max: 64
			            step: 1 ]
]
