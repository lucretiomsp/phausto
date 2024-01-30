"
The soundfile primitive allows the access of a list of externally defined sound resources, described as the list of their filename, or complete paths. It takes:

the sound number (as a integer between 0 and 255 as a constant numerical expression)
the read index in the sound (which will access the last sample of the sound if the read index is greater than the sound length)
The generated block has:

two fixed outputs: the first one is the currently accessed sound length in frames, the second one is the currently accessed sound nominal sample rate
several more outputs for the sound channels themselves, as a constant numerical expression
"
Class {
	#name : #SoundFile,
	#superclass : #CTree,
	#instVars : [
		'label',
		'labelPrefix',
		'labelSuffix',
		'path',
		'channels'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
SoundFile >> asBox [

	^ BoxAPI uniqueInstance
		  boxSoundFile: self label
		  numChannels: self channels asBox
		  part: 0 asBox
		  readIndex: 0 asBox
]

{ #category : #accessing }
SoundFile >> channels [

	^ channels
]

{ #category : #accessing }
SoundFile >> channels: anInteger [
"set the number of output channels"
	channels := anInteger 
]

{ #category : #initialization }
SoundFile >> initialize [

	super initialize.
	"just an epty path at the moment, replace it with something real"
	label := ' "sound[url:{''/mimmo.wav''}]"'.
	channels := 1. "Suoundfile is mono by default"
]

{ #category : #accessing }
SoundFile >> label [

	^ label
]

{ #category : #accessing }
SoundFile >> path [

	^ path
]

{ #category : #accessing }
SoundFile >> path: aPathToAnAudioFile [

	label := ' "sound[url:{' , aPathToAnAudioFile surroundedBySingleQuotes  , '}]"'.
	path := aPathToAnAudioFile
]
