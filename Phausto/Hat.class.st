"
Hi hat drum synthesis via phase modulation.


pitch: base frequency in the range [317Hz, 3170Hz]
tone: bandpass filter cutoff frequency, tuned for [800Hz, 18kHz]
attack: attack time in seconds, tuned for [0.005s, 0.2s]
decay: decay time in seconds, tuned for [0.005s, 4.0s]
gate: the gate which triggers the amp envelope
Reference
https://github.com/nick-thompson/drumsynth/blob/master/hat.js
"
Class {
	#name : 'Hat',
	#superclass : 'Synths',
	#instVars : [
		'tone',
		'attack',
		'decay',
		'gate',
		'pitch'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
Hat >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self pitch asBox , self tone asBox , self attack asBox
	            , self decay asBox , self gate asBox connectTo:
		            intermediateBox.
	^ finalBox  * self uLevel
]

{ #category : 'accessing' }
Hat >> attack [

^ attack
]

{ #category : 'accessing' }
Hat >> decay [

	^ decay 
]

{ #category : 'accessing' }
Hat >> gate [

	^ gate ifNil: [ gate := PhButton new label: self label , 'Gate' ]
]

{ #category : 'initialization' }
Hat >> initialize [

	super initialize.
	self processExpression: 'process = sy.hat;'.

	attack := 0.005.
	pitch := PhHSlider new
		         label: self label , 'Note'
		         init: 440
		         min: 20
		         max: 1400
		         step: 0.1.
	gate := PhButton new label: self label , 'Gate'.
	decay := PhHSlider new
		         label: self label , 'Decay'
		         init: 0.2
		         min: 0
		         max: 4.0
		         step: 0.01.
	
	self controlParameters add: #pitch -> (self pitch
			 asControlParameterOfWidgetType: #knob
			 description: 'Frequency in Hertz').

	tone := PhHSlider new
		        label: self label , 'Tone'
		        init: 9800
		        min: 800
		        max: 18000
		        step: 1
]

{ #category : 'as yet unclassified' }
Hat >> pitch [

	^ pitch ifNil: [
		  pitch := PhHSlider new
			           label: self label , 'Note'
			           init: 1900
			           min: 317
			           max: 3170
			           step: 1 ]
]

{ #category : 'accessing' }
Hat >> tone [

	^ tone
]
