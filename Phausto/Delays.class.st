"
A collection of delays from Faust delays.lib.
[More](https://ccrma.stanford.edu/realsimple/Delay/Delay_lines.html) about delays and their use for audio effets ans synthesis algorithms

"
Class {
	#name : #Delays,
	#superclass : #UnitGenerators,
	#instVars : [
		'maxDelayLength',
		'delayLength',
		'input'
	],
	#category : #'Phausto-BoxAPI-Effects'
}

{ #category : #accessing }
Delays >> delayLength [

	^ delayLength
]

{ #category : #accessing }
Delays >> delayLength: aFloatOrABox [
	" the max delay length in samples"

	delayLength := aFloatOrABox asBox
]

{ #category : #initialization }
Delays >> initialize [

	super initialize.
	self maxDelayLength: 44100. "by default, maximum delay length is 1 second at 44100 Hz sample rate"
	self delayLength: 4410.
	input := Wire new
]

{ #category : #accessing }
Delays >> input [

	^ input
]

{ #category : #accessing }
Delays >> input: aFloatOrABox [

	input := aFloatOrABox
]

{ #category : #accessing }
Delays >> maxDelayLength [

	^ maxDelayLength
]

{ #category : #accessing }
Delays >> maxDelayLength: aFloatOrABox [

	maxDelayLength := aFloatOrABox asBox
]
