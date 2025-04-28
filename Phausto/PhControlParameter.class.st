"
I am a parameter of a UnitGenerator that _can_ be changed in real time if assigned to one subclass of `UIPrimitive`
§
"
Class {
	#name : 'PhControlParameter',
	#superclass : 'Object',
	#instVars : [
		'label',
		'range',
		'step',
		'widgetType',
		'value',
		'description',
		'name'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'accessing' }
PhControlParameter >> description [

^ description 
]

{ #category : 'accessing' }
PhControlParameter >> description: aString [

	description := aString
]

{ #category : 'accessing' }
PhControlParameter >> label [

	^ label
]

{ #category : 'accessing' }
PhControlParameter >> label: aString [

	label := aString
]

{ #category : 'accessing' }
PhControlParameter >> name [
^ name
]

{ #category : 'accessing' }
PhControlParameter >> name: aSymbol [

	name := aSymbol 
]

{ #category : 'accessing' }
PhControlParameter >> range [

	^ range
]

{ #category : 'accessing' }
PhControlParameter >> range: anInterval [

	range := anInterval
]

{ #category : 'accessing' }
PhControlParameter >> step [
	
^ step
]

{ #category : 'accessing' }
PhControlParameter >> step: aNumber [

	step := aNumber
]

{ #category : 'accessing' }
PhControlParameter >> step: aNumber

	step: aNumber [
]

{ #category : 'accessing' }
PhControlParameter >> value [
^ value
]

{ #category : 'accessing' }
PhControlParameter >> value: anObject [

value := anObject
]

{ #category : 'accessing' }
PhControlParameter >> widgetType [

	^ widgetType
]

{ #category : 'accessing' }
PhControlParameter >> widgetType: anObject [

	widgetType := anObject
]
