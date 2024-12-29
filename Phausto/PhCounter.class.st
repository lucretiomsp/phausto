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

	^ CountUp new
		  max: self max;
		  trig: self trigger;
		  yourself
]

{ #category : 'initialization' }
PhCounter >> initialize [

	super initialize.
	maxValue := 8.
]

{ #category : 'accessing' }
PhCounter >> max [

	^ max ifNil: [
		  max := PhHSlider new
			         label: self label , 'Max'
			         init: 1
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

	^ trigger ifNil: [
		  trigger := PhButton new label: self label , 'Trigger' ]
]
