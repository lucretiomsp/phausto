"
A simple echo effect. echo is a standard Faust function.

##Parameters:
**maxDuration:** the max echo duration in seconds
**duration:** the echo duration in seconds
**feedback:** the feedback coefficient

"
Class {
	#name : 'PhEcho',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'maxDuration',
		'duration',
		'feedback'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhEcho >> asBox [

	^ self maxDuration asBox , self duration asBox , self feedBack asBox , self input asBox 
		  connectTo: self code asBox
]

{ #category : 'accessing' }
PhEcho >> duration [ 
^ duration 
]

{ #category : 'accessing' }
PhEcho >> feedBack [
	^ feedback
]

{ #category : 'accessing' }
PhEcho >> feedback [

	^ feedback 
]

{ #category : 'initialization' }
PhEcho >> initialize [

	super initialize.
	processExpression := 'process = ef.echo;'.
	maxDuration := 4 .
	duration := PhHSlider new label: self label , 'Duration' values: #(0.5 0.01 4 0.01).
	feedback := PhHSlider new label: self label , 'Feedback' values: #(0.5 0.01 1 0.01).
]

{ #category : 'accessing' }
PhEcho >> maxDuration [

	^ maxDuration 
]
