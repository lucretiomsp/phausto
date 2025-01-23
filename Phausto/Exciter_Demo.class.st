"
Psychoacoustic harmonic exciter, with GUI.

References
https://secure.aes.org/forum/pubs/ebriefs/?elib=16939
https://www.researchgate.net/publication/258333577_Modeling_the_Harmonic_Exciter

"
Class {
	#name : 'Exciter_Demo',
	#superclass : 'Demos',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'converting' }
Exciter_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'as yet unclassified' }
Exciter_Demo >> input [


	^ input ifNil: [ input := 0 asBox ]
]
