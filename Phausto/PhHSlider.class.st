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

{ #category : 'accessing' }
PhHSlider >> metadata [
	^ metadata ifNil: [ ^ OrderedDictionary new ]
]

{ #category : 'connecting' }
PhHSlider >> patchWith: aPhF2l [ 
	self shouldBeImplemented.
]
