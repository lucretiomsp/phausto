"
Ready-to-use violin physical model with built-in UI.

Faust: `pm.violin_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := PhViolinUI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhViolinUI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhViolinUI class >> faustName [

	^ 'violin_ui'
]
