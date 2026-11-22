"
Ready-to-use MIDI-controllable source-filter vocal synthesizer.

Faust: `pm.SFFormantModelFofSmooth_ui_MIDI` (0 in / 1 out)

## Example

```language=Pharo
dsp := SFFormantModelFofSmoothMIDI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'SFFormantModelFofSmoothMIDI',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
SFFormantModelFofSmoothMIDI class >> faustName [

	^ 'SFFormantModelFofSmooth_ui_MIDI'
]
