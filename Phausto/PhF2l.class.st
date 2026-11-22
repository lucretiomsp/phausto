"
Converts a frequency in hertz to length in meters.


"
Class {
	#name : 'PhF2l',
	#superclass : 'PhPmFunction',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhF2l class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'the frequency' }
]

{ #category : 'faust' }
PhF2l class >> argumentNames [

	^ #( #freq )
]

{ #category : 'faust' }
PhF2l class >> faustName [

	^ 'f2l'
]

{ #category : 'accessing' }
PhF2l >> freq [

	^ freq
]

{ #category : 'accessing' }
PhF2l >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhF2l >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 20 1200 1 )
]

{ #category : 'connecting' }
PhF2l >> patchedWith: aUnitGenerator [

	self freq: aUnitGenerator
]
