"
A collection of Envelopes from the Faust envelopes.lib
"
Class {
	#name : 'Reverbs',
	#superclass : 'UnitGenerator',
	#instVars : [
		'inputL',
		'inputR',
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
Reverbs >> input [

	^ input ifNil: [ input := Wire new ]
]

{ #category : 'accessing' }
Reverbs >> inputL [

	^ inputL ifNil: [ inputL := Wire new ]
]

{ #category : 'accessing' }
Reverbs >> inputR [

	^ inputR ifNil: [ inputR := Wire new ]
]

{ #category : 'accessing' }
Reverbs >> label [

	^ label
]

{ #category : 'accessing' }
Reverbs >> label: aString [

	label := aString
]
