"
Ready-to-use source-filter vocal synthesizer with built-in user interface.

Faust: `pm.SFFormantModelFofSmooth_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := SFFormantModelFofSmooth_UI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'SFFormantModelFofSmooth_UI',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
SFFormantModelFofSmooth_UI class >> faustName [

	^ 'SFFormantModelFofSmooth_ui'
]
