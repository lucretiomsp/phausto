Class {
	#name : 'PhUIMetadataBuilderTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testAccelerometer [
	| w |
	w := PhHSlider new label: 'tilt'.
	w meta accAxis: 0 curve: 0 min: -10 center: 0 max: 10.
	self assert: w fullLabel equals: 'tilt[acc:0 0 -10 0 10]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testBeHidden [
	| w |
	w := PhHSlider new label: 'x'.
	w meta beHidden.
	self assert: w fullLabel equals: 'x[hidden:1]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testGyroscope [
	| w |
	w := PhHSlider new label: 'spin'.
	w meta gyrAxis: 1 curve: 2 min: -5 center: 0 max: 5.
	self assert: w fullLabel equals: 'spin[gyr:1 2 -5 0 5]'

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMetadataOverwrite [
	| w |
	w := PhHSlider new label: 'x'.
	w meta style: 'knob'.
	w meta style: 'led'.
	self assert: w fullLabel equals: 'x[style:led]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiChanpress [
	| w |
	w := PhHSlider new label: 'at'.
	w meta midiChanpress.
	self assert: w fullLabel equals: 'at[midi:chanpress]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiClock [
	| w |
	w := PhHSlider new label: 'bpm'.
	w meta midiClock.
	self assert: w fullLabel equals: 'bpm[midi:clock]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiCtrl [
	| w |
	w := PhHSlider new label: 'cutoff'.
	w meta midiCtrl: 74.
	self assert: w fullLabel equals: 'cutoff[midi:ctrl 74]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiCtrlChannel [
	| w |
	w := PhHSlider new label: 'cutoff'.
	w meta midiCtrl: 74 channel: 1.
	self assert: w fullLabel equals: 'cutoff[midi:ctrl 74 1]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiCtrlOutOfRange [
	| w |
	w := PhHSlider new label: 'x'.
	self should: [ w meta midiCtrl: 128 ] raise: Error

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiKey [
	| w |
	w := PhHSlider new label: 'vel'.
	w meta midiKey: 60.
	self assert: w fullLabel equals: 'vel[midi:key 60]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiKeyoff [
	| w |
	w := PhHSlider new label: 'vel'.
	w meta midiKeyoff: 60.
	self assert: w fullLabel equals: 'vel[midi:keyoff 60]'

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiKeyon [
	| w |
	w := PhHSlider new label: 'vel'.
	w meta midiKeyon: 60.
	self assert: w fullLabel equals: 'vel[midi:keyon 60]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiKeypress [
	| w |
	w := PhHSlider new label: 'at'.
	w meta midiKeypress: 60.
	self assert: w fullLabel equals: 'at[midi:keypress 60]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiPgm [
	| w |
	w := PhHSlider new label: 'pgm'.
	w meta midiPgm.
	self assert: w fullLabel equals: 'pgm[midi:pgm]'

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiPitchwheel [
	| w |
	w := PhHSlider new label: 'bend'.
	w meta midiPitchwheel.
	self assert: w fullLabel equals: 'bend[midi:pitchwheel]'

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiStart [
	| w |
	w := PhButton new label: 'go'.
	w meta midiStart.
	self assert: w fullLabel equals: 'go[midi:start]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMidiStop [
	| w |
	w := PhButton new label: 'halt'.
	w meta midiStop.
	self assert: w fullLabel equals: 'halt[midi:stop]'

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testMultipleMetadata [
	| w |
	w := PhHSlider new label: 'freq'.
	w meta unit: 'Hz'.
	w meta scale: 'log'.
	w meta midiCtrl: 74.
	self assert: w fullLabel equals: 'freq[unit:Hz][scale:log][midi:ctrl 74]'

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testScale [
	| w |
	w := PhHSlider new label: 'freq'.
	w meta scale: 'log'.
	self assert: w fullLabel equals: 'freq[scale:log]'

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testStyle [
	| w |
	w := PhHSlider new label: 'freq'.
	w meta style: 'knob'.
	self assert: w fullLabel equals: 'freq[style:knob]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testStyleMenu [
	| w |
	w := PhHSlider new label: 'wave'.
	w meta styleMenu: { 'Saw' -> 0. 'Square' -> 1 }.
	self assert: w fullLabel equals: 'wave[style:menu{''Saw'':0;''Square'':1}]'

]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testStyleRadio [
	| w |
	w := PhHSlider new label: 'mode'.
	w meta styleRadio: { 'A' -> 0. 'B' -> 1 }.
	self assert: w fullLabel equals: 'mode[style:radio{''A'':0;''B'':1}]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testTooltip [
	| w |
	w := PhHSlider new label: 'vol'.
	w meta tooltip: 'Main volume'.
	self assert: w fullLabel equals: 'vol[tooltip:Main volume]'
]

{ #category : 'tests' }
PhUIMetadataBuilderTest >> testUnit [
	| w |
	w := PhHSlider new label: 'freq'.
	w meta unit: 'Hz'.
	self assert: w fullLabel equals: 'freq[unit:Hz]'

]
