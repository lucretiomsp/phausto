Class {
	#name : 'PhLoop',
	#superclass : 'PhLoops',
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
PhLoop >> asBox [

	| partNumber sf output sampler |
	partNumber := self index asBox min: self numberOfSamples asBox.
	sf := BoxAPI uniqueInstance
		      boxSoundFile: filesURL
		      numChannels: self numChannels asBox.
	output := Cut new asBox , Cut new asBox , Cut new asBox
	          , Wire new asBox.
	sampler := sf connectTo: output asBox.

	^ sampler asBox , partNumber asBox connectTo: super asBox
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
		         max: 16
		         step: 1.
	processExpression := 'process = so.loop;'.
	self pathToFolder:
		FileLocator documents asAbsolute pathString , '/TurboSamples/bleep'.
]
