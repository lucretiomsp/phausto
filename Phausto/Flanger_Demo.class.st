"
Flanger effect demo.
Flanging /ˈflændʒɪŋ/ is an audio effect produced by mixing two identical signals together, one signal delayed by a small and (usually) gradually changing period, usually smaller than 20 milliseconds. This produces a swept comb filter effect: peaks and notches are produced in the resulting frequency spectrum, related to each other in a linear harmonic series. 
"
Class {
	#name : 'Flanger_Demo',
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
Flanger_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR  asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'as yet unclassified' }
Flanger_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'as yet unclassified' }
Flanger_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
