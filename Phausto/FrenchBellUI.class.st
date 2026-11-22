"
French church bell physical model based on frenchBell with built-in UI.

Faust: `pm.frenchBell_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := FrenchBellUI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'FrenchBellUI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
FrenchBellUI class >> faustName [

	^ 'frenchBell_ui'
]
