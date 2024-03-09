Class {
	#name : #Marimba,
	#superclass : #ModalPercussion,
	#instVars : [
		'freq',
		'strikePosition',
		'strikeCutoff',
		'strikeSharpness',
		'gain',
		'trigger'
	],
	#category : #'Phaust-BoxAPI-PhysicalModels'
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
	self freq: 440.
	self strikePosition: 0.5.
	self strikeCutoff: 7000.
	self strikeSharpness: 0.8.
	self gain: 1.
	self trigger: 0.0
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
