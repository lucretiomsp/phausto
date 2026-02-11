"
Play a soundfile in a loop taking into account its sampling rate

##Parameters:
**part:** the part in the soundfile list of sounds
"
Class {
	#name : 'PhLoop',
	#superclass : 'TpSampler',
	#instVars : [
		'part'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
PhLoop >> asBox [

	self updateCode.
	^ self part asBox connectTo: self updatedCode asBox
]

{ #category : 'accessing' }
PhLoop >> filesURL [ 

^ filesURL 
]

{ #category : 'initialization' }
PhLoop >> initialize [

	super initialize.
	"by default stereo"
	numChannels := 2.

	part := PhHSlider new
		         label: self label , 'Part'
		         init: 0
		         min: 0
		         max: 4
		         step: 1.
	processExpression := 'process = so.loop'.
	self pathToFolder:
		FileLocator documents asAbsolute pathString , '/TurboSamples/bongo'
]

{ #category : 'accessing' }
PhLoop >> part [ 

^ part
]

{ #category : 'accessing' }
PhLoop >> soundFileArgument [ 

|sfaStream |
sfaStream := ReadWriteStream on: ''.
sfaStream << 'soundfile('.
sfaStream << '"'.

sfaStream << self filesURL .
sfaStream << '" , '.
self numChannels printOn: sfaStream .
sfaStream  << ')'.
^ sfaStream contents
]

{ #category : 'update' }
PhLoop >> updateCode [

	| peStream |
	peStream := ReadWriteStream on: ''.
	peStream << self code.
	peStream << self soundFileArgument.
	peStream << ');'.
	code := peStream contents
]

{ #category : 'update' }
PhLoop >> updatedCode [

	| peStream |
	peStream := ReadWriteStream on: ''.
	peStream << self code.
	peStream <<'('.
	peStream << self soundFileArgument.
	peStream << ');'.
	^ peStream contents
]
