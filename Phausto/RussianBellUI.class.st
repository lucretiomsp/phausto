"
Russian church bell physical model based on russianBell with built-in UI.

Faust: `pm.russianBell_ui` (0 in / 1 out)

## Example

```language=Pharo
dsp := RussianBellUI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'RussianBellUI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
RussianBellUI class >> faustName [

	^ 'russianBell_ui'
]
