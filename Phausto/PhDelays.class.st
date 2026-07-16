"
A collection of delays from Faust delays.lib.
[More](https://ccrma.stanford.edu/realsimple/Delay/Delay_lines.html) about delays and their use for audio effets ans synthesis algorithms

"
Class {
	#name : 'PhDelays',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'maxDelayLength',
		'delayLength'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
PhDelays >> delayLength [

	^ delayLength 
]

{ #category : 'accessing' }
PhDelays >> delayLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhDelays >> initialize [

	super initialize.
	maxDelayLength := 2 asBox * PhSampleRate new. "by default, maximum delay length is 2 second "


	delayLength := PhHSlider new
		               label: self label , 'Length'
		               init: 1
		               min: 0.001
		               max: 2
		               step: 0.001
]

{ #category : 'accessing' }
PhDelays >> maxDelayLength [

	^ maxDelayLength
]

{ #category : 'accessing' }
PhDelays >> maxDelayLength: aTimeInSeconds [

"must be a constant"
	maxDelayLength := aTimeInSeconds asBox * PhSampleRate new.
]
