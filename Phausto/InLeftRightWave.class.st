"
Adds a signal to left and right going waves anywhere in a chain of blocks.
"
Class {
	#name : 'InLeftRightWave',
	#superclass : 'PhPmElement',
	#instVars : [
		'signal'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'faust' }
InLeftRightWave class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#signal -> 'the signal added to the waves' }
]

{ #category : 'faust' }
InLeftRightWave class >> argumentNames [

	^ #( #signal )
]

{ #category : 'faust' }
InLeftRightWave class >> faustName [

	^ 'in'
]

{ #category : 'initialization' }
InLeftRightWave >> initializeArguments [

	signal := 0.25
]

{ #category : 'accessing' }
InLeftRightWave >> signal [

	^ signal
]

{ #category : 'accessing' }
InLeftRightWave >> signal: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
