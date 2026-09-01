Class {
	#name : 'UIPrimitvesTest',
	#superclass : 'TestCase',
	#instVars : [
		'slider',
		'button',
		'entry'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
UIPrimitvesTest >> setUp [ 
	super setUp.
	slider := PhHSlider new label: 'cutoff' init: 800 min: 200 max: 2000 step: 1.
	button := PhButton new label: 'gate'.
	entry  := PhNumEntry new label: 'inst' init: 0 min: 0 max: 3 step: 1
]

{ #category : 'tests' }
UIPrimitvesTest >> testChannelRejectsOutOfRange [ 
	"channels are 1..16, plus 0 for all"
	self should: [ slider midiCtrl: 74 channel: 17 ] raise: Error
]

{ #category : 'tests' }
UIPrimitvesTest >> testChannelZeroMeansAllChannelsAndIsEmitted [ 
	"0 is meaningful, not a default to elide"
	slider midiCtrl: 74 channel: 0.
	self assert: slider fullLabel equals: 'cutoff[midi:ctrl 74 0]'
]

{ #category : 'tests' }
UIPrimitvesTest >> testCtrlEmitsBracket [ 
	slider midiCtrl: 74.
	self assert: slider fullLabel equals: 'cutoff[midi:ctrl 74]'

]

{ #category : 'tests' }
UIPrimitvesTest >> testCtrlOnButtonIsLegal [ 
	"1 maps to 127, 0 to 0 — not an error"
	self shouldnt: [ button midiCtrl: 64 ] raise: Error
]

{ #category : 'tests' }
UIPrimitvesTest >> testCtrlRejectsOutOfRangeController [ 
	self should: [ slider midiCtrl: 128 ] raise: Error.
	self should: [ slider midiCtrl: -1 ] raise: Error
]

{ #category : 'tests' }
UIPrimitvesTest >> testCtrlWithChannel [ 
	slider midiCtrl: 74 channel: 3.
	self assert: slider fullLabel equals: 'cutoff[midi:ctrl 74 3]'
]

{ #category : 'tests' }
UIPrimitvesTest >> testDeclareAppendsBracket [ 
	slider declare: 'BELA' value: 'ANALOG_0'.
	self assert: slider fullLabel equals: 'cutoff[BELA:ANALOG_0]'
]

{ #category : 'tests' }
UIPrimitvesTest >> testDeclareReturnsSelfForCascades [ 
	self assert: (slider declare: 'BELA' value: 'ANALOG_0') identicalTo: slider
]

{ #category : 'tests' }
UIPrimitvesTest >> testFullLabelIsPlainLabelWhenNoMetadata [ 
	self assert: slider fullLabel equals: 'cutoff'
]

{ #category : 'tests' }
UIPrimitvesTest >> testFullLabelIsStableAcrossSends [ 
	"guards against a stream/accumulator that appends on every call"
	slider declare: 'unit' value: 'Hz'.
	slider fullLabel.
	self assert: slider fullLabel equals: 'cutoff[unit:Hz]'
]

{ #category : 'tests' }
UIPrimitvesTest >> testKeyonEmitsPitch [ 
	slider midiKeyon: 62.
	self assert: slider fullLabel equals: 'cutoff[midi:keyon 62]'
]

{ #category : 'tests' }
UIPrimitvesTest >> testKeyonRejectsOutOfRangePitch [ 
	self should: [ slider midiKeyon: 128 ] raise: Error
]

{ #category : 'tests' }
UIPrimitvesTest >> testLabelIsUnchangedByDeclare [ 
	"MapUI and getParamIndex: match on the plain name"
	slider declare: 'BELA' value: 'ANALOG_0'.
	self assert: slider label equals: 'cutoff'
]

{ #category : 'tests' }
UIPrimitvesTest >> testMetadataIsPerInstance [ 
	slider declare: 'BELA' value: 'ANALOG_0'.
	self
		assert: (PhHSlider new label: 'q' init: 1 min: 0 max: 2 step: 0.1) fullLabel
		equals: 'q'
]

{ #category : 'tests' }
UIPrimitvesTest >> testMultipleKeysAppearInInsertionOrder [ 
	slider declare: 'unit' value: 'Hz'.
	slider declare: 'BELA' value: 'ANALOG_0'.
	self assert: slider fullLabel equals: 'cutoff[unit:Hz][BELA:ANALOG_0]'
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhButtonAsDsp [

	self deny: PhButton new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhHBargraphAsDsp [

	self deny: PhHBarGraph new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhHSliderAsDsp [

	self deny: PhHSlider new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhNumEntryAsDsp [

	self deny: PhNumEntry new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhSliderAsDsp [

self deny: PhSlider new asDsp isNull.
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhVBargraphAsDsp [

	self deny: PhVBarGraph new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPhVSliderAsDsp [

	self deny: PhVSlider new asDsp isNull
]

{ #category : 'tests' }
UIPrimitvesTest >> testPitchwheelTakesNoArgument [ 
	slider midiPitchwheel.
	self assert: slider fullLabel equals: 'cutoff[midi:pitchwheel]'

]

{ #category : 'tests' }
UIPrimitvesTest >> testRedeclaringSameKeyReplaces [ 
	slider declare: 'BELA' value: 'ANALOG_0'.
	slider declare: 'BELA' value: 'ANALOG_3'.
	self assert: slider fullLabel equals: 'cutoff[BELA:ANALOG_3]'
]

{ #category : 'tests' }
UIPrimitvesTest >> testReturnsSelfForCascades [ 
	self assert: (slider midiCtrl: 74) identicalTo: slider
]

{ #category : 'tests' }
UIPrimitvesTest >> testSec2Samples [

	self assert: Select2  new asDsp isNull equals: false
]
