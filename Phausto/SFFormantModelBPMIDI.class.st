"
Ready-to-use MIDI-controllable source-filter vocal synthesizer.

Faust: `pm.SFFormantModelBP_ui_MIDI` (0 in / 1 out)

## Example

```language=Pharo
dsp := SFFormantModelBPMIDI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'SFFormantModelBPMIDI',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
SFFormantModelBPMIDI class >> faustName [

	^ 'SFFormantModelBP_ui_MIDI'
]
