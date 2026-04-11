"
I am a Faust horizontal slider
"
Class {
	#name : 'PhHSlider',
	#superclass : 'PhSlider',
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'connecting' }
PhHSlider >> => aUnitGenerator [ 
	aUnitGenerator patchedWith: self
]

{ #category : 'as yet unclassified' }
PhHSlider >> patchWith: aPhF2l [ 
	self shouldBeImplemented.
]
