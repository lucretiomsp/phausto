"
Standard church bell physical model based on standardBell with built-in UI.

Faust: `pm.standardBell_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := StandardBellUI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'StandardBellUI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
StandardBellUI class >> faustName [

	^ 'standardBell_ui'
]
