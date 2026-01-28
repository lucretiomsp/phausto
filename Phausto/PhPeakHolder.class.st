"
While peak-holder functions are scarcely discussed in the literature (please do send me an email if you know otherwise), common sense tells that the expected behaviour should be as follows: the absolute value of the input signal is compared with the output of the peak-holder; if the input is greater or equal to the output, a new peak is detected and sent to the output; otherwise, a timer starts and the current peak is held for N samples; once the timer is out and no new peaks have been detected, the absolute value of the current input becomes the new peak.

##Parameters:

**holdTime:** hold time in samples
"
Class {
	#name : 'PhPeakHolder',
	#superclass : 'PhBasics',
	#instVars : [
		'holdTime'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'initialization' }
PhPeakHolder >> asBox [ 
^ self holdTime asBox , self input asBox connectTo: super asBox
]

{ #category : 'accessing' }
PhPeakHolder >> holdTime [

^ holdTime
]

{ #category : 'initialization' }
PhPeakHolder >> initialize [ 

super initialize .
processExpression := 'process = ba.peakhold;'.
input := 0.
holdTime := 1
]
