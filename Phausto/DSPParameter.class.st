"
DSPParameter represents a single adjustable value of a DSP unit.

It holds the current value of the parameter and knows its valid range.
A DSPParameter may convert between a normalized control value (0–1)
and the value used by the DSP (e.g. Hz, dB).

DSPParameter is independent of UI, DSP code, and presets.
It only represents what the parameter is and what its value is.

"
Class {
	#name : 'DSPParameter',
	#superclass : 'Object',
	#instVars : [
		'initValue',
		'maxValue',
		'minValue',
		'shortName',
		'label',
		'stepValue',
		'type'
	],
	#category : 'Phausto-DSP',
	#package : 'Phausto',
	#tag : 'DSP'
}

{ #category : 'instance creation' }
DSPParameter class >> fromDictionary: aParameterDictionary [ 
	^ self new label: (aParameterDictionary at: #label); shortName: (aParameterDictionary at: #shortname) ; minValue: (aParameterDictionary at: #min) ; maxValue: (aParameterDictionary at: #max) ; initValue: (aParameterDictionary at: #init); type: (aParameterDictionary at: #type); stepValue: (aParameterDictionary at: #step)
]

{ #category : 'accessing' }
DSPParameter >> initValue [

	^ initValue
]

{ #category : 'accessing' }
DSPParameter >> initValue: aFloat [

initValue := aFloat
]

{ #category : 'accessing' }
DSPParameter >> label [

	^ label
]

{ #category : 'accessing' }
DSPParameter >> label: aString [

label := aString 
]

{ #category : 'accessing' }
DSPParameter >> maxValue [

	^ maxValue
]

{ #category : 'accessing' }
DSPParameter >> maxValue: aFloat [

maxValue := aFloat
]

{ #category : 'accessing' }
DSPParameter >> min: aFloat [

minValue := aFloat
]

{ #category : 'accessing' }
DSPParameter >> minValue [

	^ minValue
]

{ #category : 'accessing' }
DSPParameter >> minValue: anInteger [ 
	minValue := anInteger
]

{ #category : 'accessing' }
DSPParameter >> shortName [

	^ shortName
]

{ #category : 'accessing' }
DSPParameter >> shortName: aString [

shortName := aString 
]

{ #category : 'accessing' }
DSPParameter >> stepValue [

	^ stepValue
]

{ #category : 'accessing' }
DSPParameter >> stepValue: aFloat [

stepValue := aFloat 
]

{ #category : 'accessing' }
DSPParameter >> type [
	^ type
]

{ #category : 'accessing' }
DSPParameter >> type: aWidgetType [ 
	type := aWidgetType
]
