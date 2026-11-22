"
English church bell physical model based on englishBell with built-in UI.

Faust: `pm.englishBell_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := EnglishBellUI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'EnglishBellUI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
EnglishBellUI class >> faustName [

	^ 'englishBell_ui'
]
