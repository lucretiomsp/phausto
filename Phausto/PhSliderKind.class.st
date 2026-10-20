"
I am the abstract kind of the continuous controls: hslider, vslider and nentry. [style:knob] on any of them answers a PhKnobKind instead (fromStyle:).'.
"
Class {
	#name : 'PhSliderKind',
	#superclass : 'PhControlKind',
	#category : 'Phausto-Parameters',
	#package : 'Phausto',
	#tag : 'Parameters'
}

{ #category : 'private' }
PhSliderKind class >> styleOf: anItem [
	"Faust meta is an Array of one-key Dictionaries."

	^ (anItem at: #meta ifAbsent: [ #() ])
		detect: [ :each | each includesKey: #style ]
		ifFound: [ :each | each at: #style ]
		ifNone: [ '' ]

]
