"
Faust user interface widgets/primitives allow for an abstract description of a user interface from within the Faust code. This description is independent from any GUI toolkits/frameworks and is purely abstract. Widgets can be discrete (e.g., `PhButton`, `PhCheckbox`), continuous (e.g., `PhHSlider` , `PhVSlider`, `PhNumEntry`), and organizational (e.g., vgroup, hgroup).

Discrete and continuous elements are signal generators. For example, a button produces a signal which is 1 when the button is pressed and 0 otherwise.

** Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead.**
"
Class {
	#name : 'UIPrimitive',
	#superclass : 'PhBox',
	#instVars : [
		'label',
		'min',
		'max',
		'widgetType'
	],
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
UIPrimitive >> asControlParameter [
	self shouldBeImplemented.
]

{ #category : 'converting' }
UIPrimitive >> asControlParameterOfWidgetType: aSymbol description: aString [ 
	| controlParam |
	
	controlParam := PhControlParameter new label: self label; range: (self min to: self max); initialValue: self init; step: self step; widgetType: aSymbol; description: aString.
	^ controlParam
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

	max := aNumber asBox
]

{ #category : 'accessing' }
UIPrimitive >> min [ 
^ min
]

{ #category : 'accessing' }
UIPrimitive >> min: aNumber [

	min := aNumber asBox
]

{ #category : 'accessing' }
UIPrimitive >> widgetType [

	^ widgetType
]

{ #category : 'accessing' }
UIPrimitive >> widgetType: aSymbol [

widgetType := aSymbol
]
