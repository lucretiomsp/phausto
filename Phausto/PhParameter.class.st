"
DSPParameter represents a single adjustable value of a DSP unit.

It holds the current value of the parameter and knows its valid range.
A DSPParameter may convert between a normalized control value (0–1)
and the value used by the DSP (e.g. Hz, dB).

DSPParameter is independent of UI, DSP code, and presets.
It only represents what the parameter is and what its value is.

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
