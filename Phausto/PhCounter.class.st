"
I am a Phausto counter, I count from 1 to max when triggered
"
Class {
	#name : 'PhCounter',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trigger',
		'max'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhCounter >> asBox [

	^ CountUp new max: self max; trigger: self trigger; yourself
]

{ #category : 'initialization' }
PhCounter >> initialize [ 
super initialize
]

{ #category : 'accessing' }
PhCounter >> max [

	^ max ifNil: [
		  max := PhHSlider new
			         label: self label , 'Max'
			         init: 1
			         min: 1
			         max: 64
			         step: 11 ]
]

{ #category : 'accessing' }
PhCounter >> trigger [

	^ trigger ifNil: [
		  trigger := PhButton new label: self label , 'Trigger' ]
]
