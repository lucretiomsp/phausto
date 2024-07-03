"
Simple marimba physical model implementing a single tone bar connected to tube.
The marimba is a musical instrument in the percussion family that consists of wooden bars that are struck by mallets. Below each bar is a resonator pipe that amplifies particular harmonics of its sound.
The term is of Bantu origin, deriving from the prefix ma- meaning 'many' and -rimba meaning 'xylophone'.
(from Wikipedia) 
"
Class {
	#name : #Marimba,
	#superclass : #ModalPercussion,
	#instVars : [
		'strikeCutoff'
	],
	#category : #'Phausto-BoxAPI-PhysicalModels'
}

{ #category : #converting }
Marimba >> asBox [

	| intermediateBox finalBox |

	intermediateBox := super asBox.

	finalBox := 
	freq , strikePosition , strikeCutoff , strikeSharpness , gain
	, trigger connectTo: intermediateBox.

	^ finalBox
]

{ #category : #accessing }
Marimba >> freq [

	^ freq
]

{ #category : #accessing }
Marimba >> freq: anObject [

	freq := anObject asBox
]

{ #category : #accessing }
Marimba >> gain [

	^ gain
]

{ #category : #accessing }
Marimba >> gain: anObject [

	gain := anObject asBox
]

{ #category : #initialization }
Marimba >> initialize [

	super initialize.
	processExpression := 'process = pm.marimba;'.
	self freq: (PhHSlider new
			 label: self label , 'Freq'
			 init: 440
			 min: 20
			 max: 1200
			 step: 1).
	self strikePosition: (PhHSlider new
			 label: self label , 'StrikePos'
			 init: 0.5
			 min: 0
			 max: 4
			 step: 0.001).
	self strikeCutoff: (PhHSlider new
			 label: self label , 'StrikeCutoff'
			 init: 7000
			 min: 100
			 max: 9000
			 step: 1).
	self strikeSharpness: (PhHSlider new
			 label: self label , 'StrikeSharp'
			 init: 0.25
			 min: 0.1
			 max: 2
			 step: 0.01).
	self gain: 0.5.
	self trigger: (PhHSlider new
			 label: self label , 'Gate'
			 init: 0
			 min: 0
			 max: 1
			 step: 1)
]

{ #category : #accessing }
Marimba >> strikeCutoff [

	^ strikeCutoff
]

{ #category : #accessing }
Marimba >> strikeCutoff: anObject [

	strikeCutoff := anObject asBox
]

{ #category : #accessing }
Marimba >> strikePosition [

	^ strikePosition
]

{ #category : #accessing }
Marimba >> strikePosition: anObject [

	strikePosition := anObject asBox
]

{ #category : #accessing }
Marimba >> strikeSharpness [

	^ strikeSharpness
]

{ #category : #accessing }
Marimba >> strikeSharpness: anObject [

	strikeSharpness := anObject asBox
]

{ #category : #accessing }
Marimba >> trigger [

	^ trigger
]

{ #category : #accessing }
Marimba >> trigger: anObject [

	trigger := anObject asBox
]
