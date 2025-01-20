"
A very simple vocoder where the spectrum of the modulation signal is analyzed using a filter bank. vocoder is a standard Faust function.

Parameters:

numberOfBands: Number of vocoder bands
attack: Attack time in seconds
release: Release time in seconds
BWRatio: Coefficient to adjust the bandwidth of each band (0.1 - 2)
source: Modulation signal
excitation: Excitation/Carrier signal
"
Class {
	#name : 'PhVocoder',
	#superclass : 'UnitGenerator',
	#instVars : [
		'level',
		'input',
		'fr',
		'wah',
		'bwRatio',
		'attack',
		'release',
		'source',
		'excitation',
		'numberOfBands'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhVocoder >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox , self excitation asBox, self source asBox, 
	             self numberOfBands asBox , self attack asBox
	            , self release asBox , self bwRatio asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'as yet unclassified' }
PhVocoder >> attack [

	^ attack ifNil: [
		  attack  := PhHSlider new
			         label: self class name , 'Attack'
			         init: 0.001
			         min: 0.001
			         max: 2
			         step: 0.001 ]
]

{ #category : 'as yet unclassified' }
PhVocoder >> bwRatio [

	^ bwRatio ifNil: [
		  bwRatio := PhHSlider new
			         label: self class name , 'BWRatio'
			         init: 0.1
			         min: 0.1
			         max: 2
			         step: 0.001 ]
]

{ #category : 'as yet unclassified' }
PhVocoder >> excitation [

	^ excitation ifNil: [ excitation := Noise new  ]
]

{ #category : 'initialization' }
PhVocoder >> initialize [

	super initialize.
	processExpression := 'process = ve.vocoder;'
]

{ #category : 'accessing' }
PhVocoder >> input [

	^ input ifNil: [ input := 0 asBox ]
]

{ #category : 'as yet unclassified' }
PhVocoder >> numberOfBands [

	^ numberOfBands ifNil: [
		  numberOfBands := 16 asBox ]
]

{ #category : 'as yet unclassified' }
PhVocoder >> patchedWith: aBox [
self input: aBox
]

{ #category : 'as yet unclassified' }
PhVocoder >> release [

	^ release ifNil: [
		  release := PhHSlider new
			         label: self class name , 'Release'
			         init: 0.1
			         min: 0.01
			         max: 2
			         step: 0.001 ]
]

{ #category : 'as yet unclassified' }
PhVocoder >> source [

	^ source ifNil: [
		  source := 1 asBox]
]
