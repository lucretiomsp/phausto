"
Ready-to-use source-filter vocal synthesizer with built-in user interface.

Faust: `pm.SFFormantModelBP_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := SFFormantModelBP_ui new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'SFFormantModelBP_ui',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
SFFormantModelBP_ui class >> faustName [

	^ 'SFFormantModelBP_ui'
]
