"
Play a soundfile in a loop taking into account its sampling rate, with speed control. loop_speed is a standard Faust function.

##Parameters 
**part:** the part in the soundfile list of sounds
**speed:** the speed between 0 and n
"
Class {
	#name : 'PhLoopSpeed',
	#superclass : 'PhLoop',
	#instVars : [
		'speed'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
PhLoopSpeed >> asBox [ 

^ self speed asBox , self part asBox connectTo: self updatedCode asBox
]

{ #category : 'initialization' }
PhLoopSpeed >> initialize [

	super initialize.
	processExpression := 'process = so.loop_speed'.
	speed := PhHSlider new label: self label , 'Speed' values: #(1 0.01 12 0.01).
]

{ #category : 'accessing' }
PhLoopSpeed >> speed [ 
^ speed 
]
