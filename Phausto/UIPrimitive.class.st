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
		'widgetType'
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

	min := 0.
	max := 1.
	init := 0.
	step := 1.
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
