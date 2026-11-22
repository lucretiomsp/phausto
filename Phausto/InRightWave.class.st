"
Adds a signal to right going waves anywhere in a chain of blocks.
"
Class {
	#name : 'InRightWave',
	#superclass : 'PhPmElement',
	#instVars : [
		'signal'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'faust' }
InRightWave class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#signal -> 'the signal added to the waves' }
]

{ #category : 'faust' }
InRightWave class >> argumentNames [

	^ #( #signal )
]

{ #category : 'faust' }
InRightWave class >> faustName [

	^ 'inRightWave'
]

{ #category : 'initialization' }
InRightWave >> initializeArguments [

	signal := 0.25
]

{ #category : 'accessing' }
InRightWave >> signal [

	^ signal
]

{ #category : 'accessing' }
InRightWave >> signal: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
