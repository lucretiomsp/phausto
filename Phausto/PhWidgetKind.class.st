Class {
	#name : 'PhWidgetKind',
	#superclass : 'Object',
	#category : 'Phausto-Parameters',
	#package : 'Phausto',
	#tag : 'Parameters'
}

{ #category : 'as yet unclassified' }
PhWidgetKind class >> classForFaustType: aString [

	^ {
		'hslider' -> PhHorizontalSliderKind.
		'vslider' -> PhVerticalSliderKind.
		'nentry' -> PhNumEntryKind.
		'checkbox' -> PhCheckboxKind.
		'button' -> PhButtonKind.
		'hbargraph' -> PhHorizontalBargraphKind.
		'vbargraph' -> PhVerticalBargraphKind } asDictionary
			at: aString
			ifAbsent: [ self error: 'No widget kind for Faust type ' , aString ]

]

{ #category : 'as yet unclassified' }
PhWidgetKind class >> forFaustItem: anItem [
	"The parse boundary: the only place a Faust type string is read."

	^ (self classForFaustType: (anItem at: #type)) fromStyle: (self styleOf: anItem)

]

{ #category : 'instance creation' }
PhWidgetKind class >> fromSTyle: aString [ 

^ self new
]
