"
A mono delay with feedback and smoothed delay time based on de.fdelay from the Faust standard library.
It has a maximum delay time of 4 seconds, and a smoothed delay time in seconds control that can be changed in real time.
"
Class {
	#name : #DelayMonoFB,
	#superclass : #Box,
	#instVars : [
		'maxDelayTime',
		'dryWet',
		'delayTime',
		'input',
		'feedBack'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
DelayMonoFB >> asBox [

	| delayPath drySignal finalBox smoothedDelayTime delayBox delaySum |
	smoothedDelayTime := self delayTime smoo.
	drySignal := self input * (1 - self dryWet).
	delayBox := (FractionalDelay new
		             maxDelayLength: self maxDelayTime;
		             delayTime: self delayTime;
		             input: self input) asBox.
	delaySum := (self feedBack * delayBox ) + self input.
	delayPath := (self feedBack * delayBox ) ~ delaySum .
	finalBox := (delayPath * self dryWet ) + self input.
	^ finalBox
]

{ #category : #accessing }
DelayMonoFB >> delayTime [

	^ delayTime
]

{ #category : #accessing }
DelayMonoFB >> delayTime: aDelayTimeInSeconds [
	"delay time must never be greater than max delayTime"

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

	super initialize.
	self maxDelayTime: PhSampleRate new asBox * 4.
	self input: Wire new.
	self delayTime: 1.
	self feedBack: 0.4.
	self dryWet: 0.5.
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