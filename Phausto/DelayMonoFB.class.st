"
A mono delay with feedback and smoothed delay time based on de.sdelay from the Faust standard library.
It has a maximum delay time of 4 seconds, and a smoothed delay time in seconds control that can be changed in real time.
Also, smoothing time expressed in seconds - can be changed in real time
"
Class {
	#name : #DelayMonoFB,
	#superclass : #UnitGenerators,
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

	|  mixer delayWithFB finalBox  delayBox |
	

	delayBox := (SmoothDelay new
		             delayLength: self delayTime;
		             input: Wire new asBox) asBox. "self delayTime * PhSampleRate new asBox"

	mixer := self input + (delayBox * self feedBack).




	delayWithFB := mixer asBox ~ delayBox.

	finalBox := delayWithFB + self input.
	^ finalBox
]

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

	feedBack := aFloatOrAbox asBox
]

{ #category : #initialization }
DelayMonoFB >> initialize [

	super initialize.
	self maxDelayTime: PhSampleRate new asBox * 4.
	self input: Wire new.
	self delayTime: 331.
	self feedBack: (PhHSlider new
			 label: self label , 'Feedback'
			 init: 0.4
			 min: 0.001
			 max: 1.1
			 step: 0.001).
	self dryWet: (PhHSlider new
			 label: self label , 'DryWet'
			 init: 0.5
			 min: 0
			 max: 1
			 step: 0.001)
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

{ #category : #accessing }
DelayMonoFB >> patchedWith: aUnitGenerator [

self input: aUnitGenerator 
]
