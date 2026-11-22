"
**Resonant bandpass filter** that can be used to implement a single resonance (_mode_).


"
Class {
	#name : 'PhModeFilter',
	#superclass : 'PhPmFunction',
	#instVars : [
		'freq',
		't60',
		'gain'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhModeFilter class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'mode frequency'.
			#t60 -> 'mode resonance duration (in seconds)'.
			#gain -> 'mode gain (0-1)' }
]

{ #category : 'faust' }
PhModeFilter class >> argumentNames [

	^ #( #freq #t60 #gain )
]

{ #category : 'faust' }
PhModeFilter class >> faustName [

	^ 'modeFilter'
]

{ #category : 'accessing' }
PhModeFilter >> freq [

	^ freq
]

{ #category : 'accessing' }
PhModeFilter >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModeFilter >> gain [

	^ gain
]

{ #category : 'accessing' }
PhModeFilter >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhModeFilter >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 20 5000 0.001 ).
	t60 := PhHSlider new
			label: self label , 'T60'
			values: #( 0.5 0 3 0.001 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	input := Pulse new period: 0.1
]

{ #category : 'accessing' }
PhModeFilter >> t60 [

	^ t60
]

{ #category : 'accessing' }
PhModeFilter >> t60: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
