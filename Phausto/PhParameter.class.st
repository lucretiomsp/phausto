"
I am one control of a Faust DSP, as its source declares it: address, short name, label, range, default, step, Faust type and metadata. I was DSPParameter.

I am built from one leaf of the Faust UI JSON (fromFaustItem:), with no FFI and no initialized DSP, and I fail loudly on a type I do not know. I have no setters: what Faust declared does not change.

I answer the two questions the JUCE exporter asks: isToggle (AudioParameterBool or AudioParameterFloat) and isHostParameter (meters are outputs). My class side is where Phausto keeps the Faust type names.

I hold no current value and no view. CoypuIDE chooses widgets from my type and style.

parameterID is the single ID derivation. The APVTS header and the JuBloc glue both send it, so they cannot disagree.
"
Class {
	#name : 'PhParameter',
	#superclass : 'Object',
	#instVars : [
		'label',
		'shortName',
		'address',
		'minValue',
		'maxValue',
		'initValue',
		'stepValue',
		'type',
		'meta'
	],
	#category : 'Phausto-Parameters',
	#package : 'Phausto',
	#tag : 'Parameters'
}

{ #category : 'instance creation' }
PhParameter class >> fromDictionary: aDictionary [

	self
		deprecated: 'Use fromFaustItem:'
		transformWith: '`@receiver fromDictionary: `@item' -> '`@receiver fromFaustItem: `@item'.
	^ self fromFaustItem: aDictionary

]

{ #category : 'instance creation' }
PhParameter class >> fromFaustItem: anItem [
	"anItem: one leaf of the Faust UI JSON, a Dictionary with an #address."

	^ self new
		initializeFromFaustItem: anItem;
		yourself
]

{ #category : 'testing' }
PhParameter class >> isParameterItem: anItem [
	"Soundfiles are leaves of the Faust UI JSON, but not parameters."

	^ (anItem at: #type) ~= 'soundfile'

]

{ #category : 'accessing' }
PhParameter class >> knownTypes [

	^ #( 'hslider' 'vslider' 'nentry' ) , self toggleTypes , self meterTypes
]

{ #category : 'private' }
PhParameter class >> metaOf: anItem [
	"Faust meta is an Array of one-key Dictionaries. I merge them into one."

	| meta |
	meta := Dictionary new.
	(anItem at: #meta ifAbsent: [ #() ]) do: [ :each | meta addAll: each ].
	^ meta
]

{ #category : 'accessing' }
PhParameter class >> meterTypes [
	"Faust outputs: a host cannot write them."

	^ #( 'hbargraph' 'vbargraph' )
]

{ #category : 'accessing' }
PhParameter class >> toggleTypes [
	"Faust controls that become an AudioParameterBool."

	^ #( 'button' 'checkbox' )
]

{ #category : 'accessing' }
PhParameter >> address [ 
^ address
]

{ #category : 'accessing' }
PhParameter >> initValue [

	^ initValue
]

{ #category : 'initialization' }
PhParameter >> initializeFromFaustItem: anItem [
	"Faust declares buttons and checkboxes without min, max, init or step.
	 The defaults are what PhaustoParams.h has always written for them."

	type := anItem at: #type.
	(self class knownTypes includes: type) ifFalse: [
		self error: 'Unknown Faust control type: ' , type ].
	meta := self class metaOf: anItem.
	label := anItem at: #label.
	shortName := anItem at: #shortname.
	address := anItem at: #address.
	minValue := anItem at: #min ifAbsent: [ 0 ].
	maxValue := anItem at: #max ifAbsent: [ 1 ].
	initValue := anItem at: #init ifAbsent: [ 0 ].
	stepValue := anItem at: #step ifAbsent: [ 0.01 ]
]

{ #category : 'testing' }
PhParameter >> isHostParameter [

	^ (self class meterTypes includes: type) not
]

{ #category : 'testing' }
PhParameter >> isToggle [

^ self class toggleTypes includes: type
]

{ #category : 'accessing' }
PhParameter >> label [

	^ label
]

{ #category : 'accessing' }
PhParameter >> label: aString [ 
	label := aString
]

{ #category : 'accessing' }
PhParameter >> maxValue [

	^ maxValue
]

{ #category : 'accessing' }
PhParameter >> minValue [

	^ minValue
]

{ #category : 'accessing' }
PhParameter >> parameterID [
	"The one ID derivation. The APVTS header and the JuBloc glue both send this."

	^ shortName
]

{ #category : 'printing' }
PhParameter >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' '; nextPutAll: address
]

{ #category : 'accessing' }
PhParameter >> shortName [

	^ shortName
]

{ #category : 'accessing' }
PhParameter >> shortName: aString [ 
	shortName := aString
]

{ #category : 'accessing' }
PhParameter >> stepValue [

	^ stepValue
]

{ #category : 'accessing' }
PhParameter >> style [
	"The Faust [style:...] metadata, or an empty String."

	^ meta at: #style ifAbsent: [ '' ]
]

{ #category : 'accessing' }
PhParameter >> type [
	^ type
]
