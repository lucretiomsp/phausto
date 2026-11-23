"
""DSPParameterStore holds all parameters of a DSP unit.

It is the single place where parameter values live.
UI, presets, automation, and DSP code read from it,
but it does not depend on any of them.

The store provides:
- access to parameters by name
- loading and saving state (e.g. JSON)
- a stable home for parameter objects

DSPParameterStore does not do DSP, UI, or control logic.
It only stores parameters and their current values.""

"
Class {
	#name : 'DSPParameterStore',
	#superclass : 'Object',
	#instVars : [
		'parameters',
		'dsp'
	],
	#category : 'Phausto-DSP',
	#package : 'Phausto',
	#tag : 'DSP'
}

{ #category : 'instance creation' }
DSPParameterStore class >> from: aDSP [

	| instance |
	instance := self new.
	aDSP getUIItemsLabeledDictionary keysAndValuesDo: [ :k :v |
		instance parameters at: k put: (PhParameter fromFaustItem: v) ].
	instance dsp: aDSP.
	^ instance
]

{ #category : 'accessing' }
DSPParameterStore >> dsp [ 
^ dsp
]

{ #category : 'accessing' }
DSPParameterStore >> dsp: aDsp [

dsp := aDsp
]

{ #category : 'live values' }
DSPParameterStore >> indexOf: aParameter [
	"The Faust index of aParameter in my DSP, found by its full address."

	^ dsp getParamIndexWithName: aParameter address
]

{ #category : 'initialization' }
DSPParameterStore >> initialize [ 
super initialize .

parameters  := Dictionary new
]

{ #category : 'inspector' }
DSPParameterStore >> inspectionParameters: aBuilder [
	"Drive my parameters live from the inspector."

	<inspectorPresentationOrder: -10 title: 'Parameters'>
	^ (aBuilder instantiate: DSPParameterStoreInspectorPresenter)
		setStore: self;
		yourself
]

{ #category : 'inspector' }
DSPParameterStore >> inspectionParametersContext: aContext [

	aContext active: self isLive
]

{ #category : 'testing' }
DSPParameterStore >> isLive [
	"Values can only be read and written while my DSP has a valid handle."

	^ dsp notNil and: [ dsp isNull not ]
]

{ #category : 'accessing' }
DSPParameterStore >> parameterNamed: aLabel [

	^ parameters at: aLabel
]

{ #category : 'accessing' }
DSPParameterStore >> parameters [ 

^ parameters
]

{ #category : 'live values' }
DSPParameterStore >> resetToDefaults [
	"Write every control's Faust init value back to the DSP."

	self sortedParameters do: [ :each |
		each isHostParameter ifTrue: [ self setValue: each initValue of: each ] ]
]

{ #category : 'live values' }
DSPParameterStore >> setValue: aNumber of: aParameter [
	"Write aNumber, clamped to the declared range, to the running DSP.
	 Meters are outputs of the DSP: they cannot be written."

	| clamped |
	aParameter isHostParameter ifFalse: [
		^ self error: aParameter label , ' is a meter, it cannot be set' ].
	self isLive ifFalse: [ ^ nil ].
	clamped := (aNumber max: aParameter minValue) min: aParameter maxValue.
	dsp setValue: clamped asFloat parameterIndex: (self indexOf: aParameter).
	^ clamped
]

{ #category : 'accessing' }
DSPParameterStore >> sortedParameters [
	"My parameters in Faust address order, the order of the DSP's own UI."

	^ parameters values asArray sort: [ :a :b | a address <= b address ]
]

{ #category : 'live values' }
DSPParameterStore >> valueOf: aParameter [
	"The current value of aParameter in the running DSP, or its init value when the DSP is gone."

	self isLive ifFalse: [ ^ aParameter initValue ].
	^ dsp getParamValueIndex: (self indexOf: aParameter)
]
