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
	#category : #'Phausto-Toolkit'
}

{ #category : #accessing }
DelayMonoFB >> delayTime [

	^ delayTime
]

{ #category : #accessing }
DelayMonoFB >> delayTime: aDelayTimeInSeconds [

"delay time must never be greater than max delayTime"
   
	delayTime := aDelayTimeInSeconds asBox
]

{ #category : #accessing }
DelayMonoFB >> dryWet [

	^ dryWet
]

{ #category : #accessing }
DelayMonoFB >> dryWet: anObject [

	dryWet := anObject
]

{ #category : #accessing }
DelayMonoFB >> feedBack [

	^ feedBack
]

{ #category : #accessing }
DelayMonoFB >> feedBack: anObject [

	feedBack := anObject
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
DelayMonoFB >> input: anObject [

	input := anObject
]

{ #category : #accessing }
DelayMonoFB >> maxDelayTime [

	^ maxDelayTime
]

{ #category : #accessing }
DelayMonoFB >> maxDelayTime: anObject [

	maxDelayTime := anObject
]
