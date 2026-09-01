"
Faust user interface widgets/primitives allow for an abstract description of a user interface from within the Faust code. This description is independent from any GUI toolkits/frameworks and is purely abstract. Widgets can be discrete (e.g., `PhButton`, `PhCheckbox`), continuous (e.g., `PhHSlider` , `PhVSlider`, `PhNumEntry`), and organizational (e.g., vgroup, hgroup).

Discrete and continuous elements are signal generators. For example, a button produces a signal which is 1 when the button is pressed and 0 otherwise.

** Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead.**
"
Class {
	#name : 'UIPrimitive',
	#superclass : 'Object',
	#instVars : [
		'label',
		'init',
		'min',
		'max',
		'step',
		'widgetType',
		'metadata'
	],
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'arithmetic' }
UIPrimitive >> * aUnitGenerator [

	^ PhMultiplicator new
		  inputL: self;
		  inputR: aUnitGenerator
]

{ #category : 'arithmetic' }
UIPrimitive >> + aUnitGenerator [

	^ PhAdder new
		  inputL: self;
		  inputR: aUnitGenerator
]

{ #category : 'combining' }
UIPrimitive >> , aUnitGenerator [

	^ PhZeroList new addAll: {
			  self.
			  aUnitGenerator }
]

{ #category : 'converting' }
UIPrimitive >> asControlParameter [
	self shouldBeImplemented.
]

{ #category : 'converting' }
UIPrimitive >> asControlParameterOfWidgetType: aSymbol description: aString [ 
	| controlParam |
	
	controlParam := PhControlParameter new label: self label; min: self min; max: self max; initialValue: self init; step: self step; widgetType: aSymbol; description: aString.
	^ controlParam
]

{ #category : 'converting' }
UIPrimitive >> asDsp [ 

^ self asBox asDsp
]

{ #category : 'converting' }
UIPrimitive >> asParam: aString forUGen: aUGen [

	aUGen instVarNamed: aString put: self
]

{ #category : 'metadata' }
UIPrimitive >> belaPin: aBelaPin [
	^ self declare: 'BELA' value: aBelaPin faustName
]

{ #category : 'metadata' }
UIPrimitive >> declare: aKey value: aValue [
	self metadata at: aKey put: aValue

]

{ #category : 'accessing' }
UIPrimitive >> fullLabel [
	^ String streamContents: [ :s |
		s << self label.
		self metadata keysAndValuesDo: [ :k :v |
			s << '[' << k << ':' << v << ']' ] ]
]

{ #category : 'accessing' }
UIPrimitive >> init [

	^ init
]

{ #category : 'common' }
UIPrimitive >> init: aNumber [
"syntactic sugar"
]

{ #category : 'initialization' }
UIPrimitive >> initialize [

	super initialize.
	label := 'label'.
	metadata := OrderedDictionary new .

	min := 0.
	max := 1.
	init := 0.
	step := 1
]

{ #category : 'accessing' }
UIPrimitive >> label [

	^ label
]

{ #category : 'accessing' }
UIPrimitive >> label: aString [

	label := aString 
]

{ #category : 'accessing' }
UIPrimitive >> max [

	^ max
]

{ #category : 'accessing' }
UIPrimitive >> max: aNumber [

	max := aNumber 
]

{ #category : 'accessing' }
UIPrimitive >> metadata [

	^ metadata 
]

{ #category : 'metadata' }
UIPrimitive >> midiCtrl: aNumber [

		(aNumber between: 0 and: 127) ifFalse: [
		^ Error signal: 'MIDI controller number must be 0..127' ].
	^ self declare: 'midi' value: 'ctrl ' , aNumber asString
]

{ #category : 'metadata' }
UIPrimitive >> midiCtrl: aNumber channel: aChannel [ 

	(aNumber between: 0 and: 127) ifFalse: [
		^ Error signal: 'MIDI controller number must be 0..127' ].
	(aChannel between: 0 and: 16) ifFalse: [
		^ Error signal: 'MIDI channel must be 1..16, or 0 for all channels' ].
	^ self
		  declare: 'midi'
		  value: 'ctrl ' , aNumber asString , ' ' , aChannel asString
]

{ #category : 'metadata' }
UIPrimitive >> midiKeyon: aPitch [ 

	(aPitch between: 0 and: 127) ifFalse: [
		^ Error signal: 'MIDI key must be 0..127' ].
	^ self declare: 'midi' value: 'keyon ' , aPitch asString
]

{ #category : 'metadata' }
UIPrimitive >> midiPitchwheel [ 

	^ self declare: 'midi' value: 'pitchwheel'
]

{ #category : 'accessing' }
UIPrimitive >> min [ 
^ min
]

{ #category : 'accessing' }
UIPrimitive >> min: aNumber [

	min := aNumber 
]

{ #category : 'accessing' }
UIPrimitive >> step [

	^ step
]

{ #category : 'accessing' }
UIPrimitive >> widgetType [

	^ widgetType
]

{ #category : 'accessing' }
UIPrimitive >> widgetType: aSymbol [

widgetType := aSymbol
]
