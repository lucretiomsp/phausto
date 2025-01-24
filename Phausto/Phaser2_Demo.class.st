"
Phaser effeect demo.
A phaser is an electronic sound processor used to filter a signal by creating a series of peaks and troughs in the frequency spectrum. The position of the peaks and troughs of the waveform being affected is typically modulated by an internal low-frequency oscillator so that they vary over time, creating a sweeping effect.
"
Class {
	#name : 'Phaser2_Demo',
	#superclass : 'Demos',
	#instVars : [
		'inputL',
		'inputR'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Phaser2_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR  asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'as yet unclassified' }
Phaser2_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'as yet unclassified' }
Phaser2_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
