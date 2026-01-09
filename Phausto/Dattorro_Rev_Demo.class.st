"
Datorro Reverb Demo.

see:
https://ccrma.stanford.edu/~dattorro/EffectDesignPart1.pdf
"
Class {
	#name : 'Dattorro_Rev_Demo',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Dattorro_Rev_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]
