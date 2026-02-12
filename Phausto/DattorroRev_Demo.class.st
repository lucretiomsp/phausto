"
Datorro Reverb Demo.

see:
https://ccrma.stanford.edu/~dattorro/EffectDesignPart1.pdf
"
Class {
	#name : 'DattorroRev_Demo',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
DattorroRev_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]
