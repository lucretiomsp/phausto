"
Adds a signal to left going waves anywhere in a chain of blocks.
"
Class {
	#name : 'InLeftWave',
	#superclass : 'PhPmElement',
	#instVars : [
		'signal'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'faust' }
InLeftWave class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#signal -> 'the signal added to the waves' }
]

{ #category : 'faust' }
InLeftWave class >> argumentNames [

	^ #( #signal )
]

{ #category : 'faust' }
InLeftWave class >> faustName [

	^ 'inLeftWave'
]

{ #category : 'initialization' }
InLeftWave >> initializeArguments [

	signal := 0.25
]

{ #category : 'accessing' }
InLeftWave >> signal [

	^ signal
]

{ #category : 'accessing' }
InLeftWave >> signal: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
