"
I am one control of a Faust DSP, as its source declares it: address, short name, label, range, default, step, and my PhControlKind. I was DSPParameter.

I am built from one leaf of the Faust UI JSON (fromFaustItem:), with no FFI and no initialized DSP. I have no setters: what Faust declared does not change.

I hold no current value and no view. The JUCE exporter reads me to write PhaustoParams.h, and CoypuIDE visits me to build widgets (acceptVisitor:).

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
		'kind'
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
	"anItem: one leaf of Faust's UI JSON, a Dictionary with an #address."

	^ self new
		initializeFromFaustItem: anItem;
		yourself
]

{ #category : 'visiting' }
PhParameter >> acceptVisitor: aVisitor [
	"Double dispatch on the declared kind. What the visit answers is the visitor's business."

	^ kind acceptVisitor: aVisitor for: self
]

{ #category : 'accessing' }
PhParameter >> address [ 
^ address
]

{ #category : 'accessing' }
PhParameter >> address: aString [ 
	address := aString 
]

{ #category : 'accessing' }
PhParameter >> initValue [

	^ initValue
]

{ #category : 'accessing' }
PhParameter >> initValue: aFloat [

initValue := aFloat
]

{ #category : 'visiting' }
PhParameter >> isHostParameter [

	^ kind isHostParameter

]

{ #category : 'visiting' }
PhParameter >> isToggle [ 

^ kind isToggle
]

{ #category : 'accessing' }
PhParameter >> kind [ 
^ kind
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
PhParameter >> maxValue: aFloat [

maxValue := aFloat
]

{ #category : 'accessing' }
PhParameter >> min: aFloat [

minValue := aFloat
]

{ #category : 'accessing' }
PhParameter >> minValue [

	^ minValue
]

{ #category : 'accessing' }
PhParameter >> minValue: anInteger [ 
	minValue := anInteger
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
PhParameter >> stepValue: aFloat [

stepValue := aFloat 
]
