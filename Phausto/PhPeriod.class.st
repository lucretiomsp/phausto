"
Basic sawtooth wave of period p.

Parameter:

p: period as a number of samples
"
Class {
	#name : 'PhPeriod',
	#superclass : 'UnitGenerator',
	#instVars : [
		'period'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhPeriod >> asBox [

	| intermediateBox  finalBox |
	intermediateBox := super asBox.


	finalBox := self period connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhPeriod >> initialize [

	super initialize.
	processExpression := 'process = ba.period;'
]

{ #category : 'accessing' }
PhPeriod >> period [

	^ period ifNil: [
		  period := PhHSlider new
			            label: self label , 'Period'
			            init: 1
			            min: 0.1
			            max: 10
			            step: 0.01 ]
]