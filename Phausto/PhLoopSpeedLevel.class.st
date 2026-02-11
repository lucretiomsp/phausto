"
Play a soundfile in a loop taking into account its sampling rate, with speed control. loop_speed is a standard Faust function.

##Parameters 
**part:** the part in the soundfile list of sounds.
**speed:** the speed between 0 and n.
**level:** the volume between 0 and n.
"
Class {
	#name : 'PhLoopSpeedLevel',
	#superclass : 'PhLoopSpeed',
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
PhLoopSpeedLevel >> asBox [ 

^ self part asBox , self speed asBox , self level asBox connectTo: self updatedCode 
]

{ #category : 'initialization' }
PhLoopSpeedLevel >> initialize [

	super initialize.
	processExpression := 'process = so.loop_speed_level'.
	level := PhHSlider new label: self label , 'Level' values: #(0.3 0 1 0.01)
]

{ #category : 'accessing' }
PhLoopSpeedLevel >> level [
	^ level
]
