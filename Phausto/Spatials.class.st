"
Subclasse of Spatials are tools for sound spatialization. 
"
Class {
	#name : 'Spatials',
	#superclass : 'UnitGenerator',
	#instVars : [
		'pan',
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
Spatials >> input [

	^ input 
]

{ #category : 'accessing' }
Spatials >> input: aPhBox [

	input := aPhBox
]

{ #category : 'accessing' }
Spatials >> pan [

	^ pan 
]

{ #category : 'accessing' }
Spatials >> pan: anObject [

	pan := anObject
]

{ #category : 'connecting' }
Spatials >> patchedWith: aPhBox [

self input: aPhBox
]
