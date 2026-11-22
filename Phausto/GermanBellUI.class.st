"
German church bell physical model based on germanBell with built-in UI.

Faust: `pm.germanBell_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := GermanBellUI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'GermanBellUI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
GermanBellUI class >> faustName [

	^ 'germanBell_ui'
]
