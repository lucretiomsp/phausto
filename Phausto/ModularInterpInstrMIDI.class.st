"
Ready-to-use MIDI-enabled string instrument with a modular body (see modeInterpRes and <https://ccrma.stanford.edu/~rmichon/3dPrintingModeling/>) with built-in UI.

Faust: `pm.modularInterpInstr_ui_MIDI` (0 in / 1 out)

## Example

```language=Pharo
dsp := ModularInterpInstrMIDI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'ModularInterpInstrMIDI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
ModularInterpInstrMIDI class >> faustName [

	^ 'modularInterpInstr_ui_MIDI'
]
