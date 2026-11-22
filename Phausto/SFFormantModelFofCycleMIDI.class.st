"
Ready-to-use MIDI-controllable source-filter vocal synthesizer.

Faust: `pm.SFFormantModelFofCycle_ui_MIDI` (0 in / 1 out)

## Example

```language=Pharo
dsp := SFFormantModelFofCycleMIDI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'SFFormantModelFofCycleMIDI',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
SFFormantModelFofCycleMIDI class >> faustName [

	^ 'SFFormantModelFofCycle_ui_MIDI'
]
