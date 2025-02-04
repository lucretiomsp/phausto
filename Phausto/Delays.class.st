"
A collection of delays from Faust delays.lib.
[More](https://ccrma.stanford.edu/realsimple/Delay/Delay_lines.html) about delays and their use for audio effets ans synthesis algorithms

"
Class {
	#name : 'Delays',
	#superclass : 'UnitGenerator',
	#instVars : [
		'maxDelayLength',
		'delayLength',
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
Delays >> delayLength [

	^ delayLength ifNil: [ delayLength := (PhHSlider new
			 label: self label , 'Length'
			 init: 20050
			 min: 1
			 max: 44100
			 step: 1). ]
]

{ #category : 'initialization' }
Delays >> initialize [

	super initialize.
	maxDelayLength := 2 asBox * PhSampleRate new. "by default, maximum delay length is 2 second "

	input := Wire new.
	delayLength := (PhHSlider new
			 label: self label , 'Length'
			 init: 1
			 min: 0.001
			 max: 2
			 step: 0.001).
]

{ #category : 'accessing' }
Delays >> input [

	^ input
]

{ #category : 'accessing' }
Delays >> maxDelayLength [

	^ maxDelayLength
]

{ #category : 'accessing' }
Delays >> maxDelayLength: aTimeInSeconds [

"must be a constant"
	maxDelayLength := aTimeInSeconds asBox * PhSampleRate new.
]

{ #category : 'connecting' }
Delays >> patchedWith: aUnitGenerator [

self input: aUnitGenerator 
]
