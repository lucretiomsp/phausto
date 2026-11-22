"
Church bell physical model based on churchBell with built-in UI.

Faust: `pm.churchBell_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := ChurchBellUI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'ChurchBellUI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
ChurchBellUI class >> faustName [

	^ 'churchBell_ui'
]
