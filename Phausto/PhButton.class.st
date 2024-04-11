"
A very simple button corresponding to Faust button primitive
"
Class {
	#name : #PhButton,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'dsp'
	],
	#category : #'Phausto-GUI'
}

{ #category : #accessing }
PhButton >> dsp [

	^ dsp
]

{ #category : #accessing }
PhButton >> dsp: aDsp [

"Assign a DSP to the button"
	dsp := aDsp
]

{ #category : #'event handling' }
PhButton >> mouseDown: evt [

super mouseDown: evt.
self dsp setValue: 1 parameter: self label

]

{ #category : #'event handling' }
PhButton >> mouseUp: evt [

super mouseUp: evt.

self dsp setValue: 0 parameter: self label

]
