"
I am a PhReaderWithSpeed, I read audio buffers at a desired speed. I am designed to read sample files and wavetables. If speed has a negative value, I read buffers backward
"
Class {
	#name : #PhReaderWithSpeed,
	#superclass : #PhBox,
	#instVars : [
		'speed',
		'trigger'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
PhReaderWithSpeed >> asBox [

	| sum |
	sum := Wire new asBox + speed.
	^ (Resetter new trigger: self trigger) ~ sum .
]

{ #category : #accessing }
PhReaderWithSpeed >> speed [

	^ speed
]

{ #category : #accessing }
PhReaderWithSpeed >> speed: aSpeed [

	speed := aSpeed asBox
]

{ #category : #accessing }
PhReaderWithSpeed >> trigger [

	^ trigger
]

{ #category : #accessing }
PhReaderWithSpeed >> trigger: aTrigger [	

	trigger := aTrigger asBox
]
