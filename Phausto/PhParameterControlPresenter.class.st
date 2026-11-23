"
I am one row of the Parameters inspector of a DSPParameterStore: the label of one PhParameter and a widget that drives it in the running DSP.

The widget comes from the Faust type:
- hslider, vslider, nentry: a slider over the declared range, quantized to the declared step, and a number field (type a value, press Enter);
- checkbox: a check box writing 1 or 0;
- button: TRIG sends a 10 ms pulse, the hold check box keeps it at 1 until unchecked;
- hbargraph, vbargraph: a read-only bar, the DSP writes it.

Sliders and meters show their declared range around the widget (min on the left, max on the right); sliders also show their step after the value.

refresh reads the DSP back into my widgets without writing to it again (isRefreshing guards the change handlers). Every write goes through the store, which clamps to the declared range.
"
Class {
	#name : 'PhParameterControlPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'store',
		'parameter',
		'nameLabel',
		'control',
		'valueField',
		'holdButton',
		'minLabel',
		'maxLabel',
		'stepLabel',
		'isRefreshing'
	],
	#category : 'Phausto-Inspector',
	#package : 'Phausto',
	#tag : 'Inspector'
}

{ #category : 'accessing' }
PhParameterControlPresenter >> control [

	^ control
]

{ #category : 'formatting' }
PhParameterControlPresenter >> decimalPlaces [
	"As many decimals as the declared step needs, at most 4."

	| step places |
	step := parameter stepValue.
	(step isNil or: [ step <= 0 ]) ifTrue: [ ^ 3 ].
	places := 0.
	[ places < 4 and: [ (step * (10 raisedTo: places)) fractionPart abs > 1e-9 ] ]
		whileTrue: [ places := places + 1 ].
	^ places
]

{ #category : 'formatting' }
PhParameterControlPresenter >> format: aNumber [

	^ aNumber asFloat printShowingDecimalPlaces: self decimalPlaces
]

{ #category : 'accessing' }
PhParameterControlPresenter >> holdButton [

	^ holdButton
]

{ #category : 'initialization' }
PhParameterControlPresenter >> initialize [

	isRefreshing := false.
	super initialize
]

{ #category : 'initialization' }
PhParameterControlPresenter >> initializeButton [

	control := self newButton
		label: 'TRIG';
		help: 'Send a 10 ms pulse';
		action: [ self trig ];
		yourself.
	holdButton := self newCheckBox
		label: 'hold';
		help: 'Keep the button pressed';
		whenChangedDo: [ :pressed | self write: pressed asBit ];
		yourself
]

{ #category : 'initialization' }
PhParameterControlPresenter >> initializeCheckBox [

	control := self newCheckBox
		whenChangedDo: [ :checked | self write: checked asBit ];
		yourself
]

{ #category : 'initialization' }
PhParameterControlPresenter >> initializeControl [

	parameter isHostParameter ifFalse: [ ^ self initializeMeter ].
	parameter type = 'checkbox' ifTrue: [ ^ self initializeCheckBox ].
	parameter type = 'button' ifTrue: [ ^ self initializeButton ].
	self initializeSlider
]

{ #category : 'initialization' }
PhParameterControlPresenter >> initializeLayout [

	| box |
	box := SpBoxLayout newLeftToRight
		spacing: 6;
		vAlignCenter;
		add: nameLabel width: 160;
		yourself.
	minLabel ifNotNil: [ box add: minLabel width: 60 ].
	box add: control.
	maxLabel ifNotNil: [ box add: maxLabel width: 60 ].
	holdButton ifNotNil: [ box add: holdButton expand: false ].
	valueField ifNotNil: [ box add: valueField width: 80 ].
	stepLabel ifNotNil: [ box add: stepLabel width: 90 ].
	self layout: box
]

{ #category : 'initialization' }
PhParameterControlPresenter >> initializeMeter [

	control := self newProgressBar.
	valueField := self newLabel.
	self initializeRangeLabels
]

{ #category : 'initialization' }
PhParameterControlPresenter >> initializeRangeLabels [

	minLabel := self newLabel
		label: (self format: parameter minValue);
		help: 'Minimum';
		yourself.
	maxLabel := self newLabel
		label: (self format: parameter maxValue);
		help: 'Maximum';
		yourself
]

{ #category : 'initialization' }
PhParameterControlPresenter >> initializeSlider [

	control := self newSlider
		min: parameter minValue;
		max: parameter maxValue;
		quantum: ((parameter stepValue ifNil: [ 0 ]) > 0
			ifTrue: [ parameter stepValue ]
			ifFalse: [ 0.001 ]);
		whenValueChangedDo: [ :value | self write: value ];
		yourself.
	valueField := self newNumberInput
		beFloat;
		help: 'Type a value and press Enter';
		whenSubmitDo: [ :text | self write: valueField number ];
		yourself.
	self initializeRangeLabels.
	stepLabel := self newLabel
		label: 'step ' , (self format: parameter stepValue);
		help: 'Step';
		yourself
]

{ #category : 'accessing' }
PhParameterControlPresenter >> maxLabel [

	^ maxLabel
]

{ #category : 'accessing' }
PhParameterControlPresenter >> minLabel [

	^ minLabel
]

{ #category : 'accessing' }
PhParameterControlPresenter >> nameLabel [

	^ nameLabel
]

{ #category : 'accessing' }
PhParameterControlPresenter >> parameter [

	^ parameter
]

{ #category : 'refreshing' }
PhParameterControlPresenter >> refresh [
	"Show the DSP's current value, without writing it back."

	| value |
	value := store valueOf: parameter.
	isRefreshing := true.
	[ self show: value ] ensure: [ isRefreshing := false ]
]

{ #category : 'initialization' }
PhParameterControlPresenter >> setStore: aStore parameter: aParameter [

	store := aStore.
	parameter := aParameter.
	nameLabel := self newLabel
		label: aParameter label;
		help: aParameter address;
		yourself.
	self initializeControl.
	self initializeLayout.
	self refresh
]

{ #category : 'refreshing' }
PhParameterControlPresenter >> show: aNumber [

	parameter isHostParameter ifFalse: [
		control fixedAt: (self unitValueOf: aNumber).
		^ valueField label: (self format: aNumber) ].
	parameter type = 'checkbox' ifTrue: [ ^ control state: aNumber > 0 ].
	parameter type = 'button' ifTrue: [ ^ holdButton state: aNumber > 0 ].
	control value: aNumber.
	valueField number: (self format: aNumber)
]

{ #category : 'accessing' }
PhParameterControlPresenter >> stepLabel [

	^ stepLabel
]

{ #category : 'accessing' }
PhParameterControlPresenter >> store [

	^ store
]

{ #category : 'actions' }
PhParameterControlPresenter >> trig [
	"A 10 ms pulse, like DSP>>trig:."

	self write: 1.
	[
		10 milliSeconds wait.
		store setValue: 0 of: parameter ] forkAt: Processor userInterruptPriority
]

{ #category : 'formatting' }
PhParameterControlPresenter >> unitValueOf: aNumber [
	"aNumber mapped from the declared range to 0..1, for a bar graph."

	| range |
	range := parameter maxValue - parameter minValue.
	range = 0 ifTrue: [ ^ 0 ].
	^ (((aNumber - parameter minValue) / range) asFloat max: 0) min: 1
]

{ #category : 'accessing' }
PhParameterControlPresenter >> valueField [

	^ valueField
]

{ #category : 'actions' }
PhParameterControlPresenter >> write: aNumber [
	"Send aNumber to the DSP, then show what the store really wrote (it clamps)."

	| written |
	isRefreshing ifTrue: [ ^ self ].
	written := store setValue: aNumber of: parameter.
	written ifNil: [ ^ self ].
	isRefreshing := true.
	[ self show: written ] ensure: [ isRefreshing := false ]
]
