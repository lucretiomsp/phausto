"
I am a PhReaderWithSpeed, I read audio buffers at a desired speed. I am designed to read sample files and wavetables. If speed has a negative value, I read buffers backward
"
Class {
	#name : 'PhReaderWithSpeed',
	#superclass : 'PhBox',
	#instVars : [
		'speed',
		'trigger'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhReaderWithSpeed >> asBox [

	| sum resetter |
	resetter := (PhResetter new trigger: self trigger) asBox.
	sum := Wire new asBox + self speed.
	^ resetter ~ sum
]

{ #category : 'initialization' }
PhReaderWithSpeed >> initialize [

	super initialize.
	self trigger: 0.
	self speed: 1
]

{ #category : 'accessing' }
PhReaderWithSpeed >> speed [

	^ speed
]

{ #category : 'accessing' }
PhReaderWithSpeed >> speed: aSpeed [

	speed := aSpeed asBox
]

{ #category : 'accessing' }
PhReaderWithSpeed >> trigger [

	^ trigger
]

{ #category : 'accessing' }
PhReaderWithSpeed >> trigger: aTrigger [	

	trigger := aTrigger asBox
]
