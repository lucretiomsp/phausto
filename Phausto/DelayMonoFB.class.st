"
A mono delay with feedback and smoothed delay time based on de.fdelay from the Faust standard library.
It has a maximum delay time of 4 seconds, and a smoothed delay time in seconds control that can be changed in real time.
"
Class {
	#name : #DelayMonoFB,
	#superclass : #Object,
	#instVars : [
		'maxDelayTime',
		'dryWet',
		'delayTime',
		'input',
		'feedBack'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #accessing }
DelayMonoFB >> delayTime [

	^ delayTime
]

{ #category : #accessing }
DelayMonoFB >> delayTime: aDelayTimeInSeconds [
	"delay time must never be greater than max delayTime"

	aDelayTimeInSeconds > self maxDelayTime ifTrue: [
		Error new signal:
			'elay time cannot be be greater than max delayTime' ] ifFalse: 
	[delayTime := aDelayTimeInSeconds asBox]
]

{ #category : #accessing }
DelayMonoFB >> dryWet [

	^ dryWet
]

{ #category : #accessing }
DelayMonoFB >> dryWet: aFloatOrABox [

   "a value of 0 for a dry signal , a value of 1 for a wet signal , in between for a mix"
	dryWet := aFloatOrABox asBox
]

{ #category : #accessing }
DelayMonoFB >> feedBack [

	^ feedBack
]

{ #category : #accessing }
DelayMonoFB >> feedBack: aFloatOrAbox [
"be careful, values greater of equals to 1 yield infinite resonant feedbCK"
	feedBack := aFloatOrAbox
]

{ #category : #initialization }
DelayMonoFB >> initialize [ 
super initialize .


]

{ #category : #accessing }
DelayMonoFB >> input [

	^ input
]

{ #category : #accessing }
DelayMonoFB >> input: anInput [

	input := anInput asBox
]

{ #category : #accessing }
DelayMonoFB >> maxDelayTime [

	^ maxDelayTime
]

{ #category : #accessing }
DelayMonoFB >> maxDelayTime: aMaxDelayTimeInSeconds [


	maxDelayTime := aMaxDelayTimeInSeconds asBox
]
