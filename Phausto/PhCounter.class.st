"
I am a Phausto counter, I count from 1 to maxValue when triggered.
By default, I count to 8 and I am triggered by a Button
"
Class {
	#name : 'PhCounter',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trigger',
		'max',
		'maxValue'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhCounter >> asBox [

	| count finalBox |
	count := Counter new trig: self trigger.

	finalBox := (count asBox  - 1 asBox) % (self max - 1 asBox) + 1.
	^ finalBox
]

{ #category : 'initialization' }
PhCounter >> initialize [

	super initialize.
	maxValue := 8.
	max := PhHSlider new
			         label: self label , 'Max'
			         init: self maxValue
			         min: 1
			         max: self maxValue
			         step: 1 .
			 trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
PhCounter >> max [

	^ max ifNil: [
		  max := PhHSlider new
			         label: self label , 'Max'
			         init: self maxValue
			         min: 1
			         max: self maxValue
			         step: 1 ]
]

{ #category : 'accessing' }
PhCounter >> maxValue [
^ maxValue
]

{ #category : 'accessing' }
PhCounter >> trigger [

	^ trigger 
]
