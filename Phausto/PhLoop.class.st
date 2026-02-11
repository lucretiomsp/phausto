Class {
	#name : 'PhLoop',
	#superclass : 'PhLoops',
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
PhLoop >> asBox [

	| peStream newProcessExpression |
	peStream := ReadWriteStream on: ''.
	peStream << 'import("stdfaust.lib");'.
	peStream << 'process = so.loop('.
	peStream << self soundFileArgument.
	peStream << ');'.
	newProcessExpression := peStream contents.
	^ 0 asBox connectTo: newProcessExpression asBox.
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

	index := PhHSlider new
		         label: self label , 'Part'
		         init: 0
		         min: 0
		         max: 4
		         step: 1.
	processExpression := 'process = so.loop;'.
	self pathToFolder:
		FileLocator documents asAbsolute pathString , '/TurboSamples/bongo'
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
