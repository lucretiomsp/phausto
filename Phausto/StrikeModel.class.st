"
A filtered noise excitation
"
Class {
	#name : #StrikeModel,
	#superclass : #Exciter,
	#instVars : [
		'lpCutoff',
		'hpCutoff',
		'strikePosition',
		'strikeSharpness',
		'gain',
		'gate'
	],
	#category : #'Phausto-PhysicalModels'
}

{ #category : #accessing }
StrikeModel >> gain [

	^ gain
]

{ #category : #accessing }
StrikeModel >> gain: anObject [

	gain := anObject asBox
]

{ #category : #accessing }
StrikeModel >> gate [

	^ gate
]

{ #category : #accessing }
StrikeModel >> gate: anObject [

	gate := anObject asBox
]

{ #category : #accessing }
StrikeModel >> hpCutoff [

	^ hpCutoff
]

{ #category : #accessing }
StrikeModel >> hpCutoff: anObject [

	hpCutoff := anObject asBox
]

{ #category : #initialization }
StrikeModel >> initialize [

	super initialize.
	processExpression := 'process = pm.strikeModel;'.
	self hpCutoff: 10.
	self lpCutoff: 7000.
	self gain: 0.6.
	self strikePosition: 3.
	self strikeSharpness: 0.3.
	self gate: 0.0.
]

{ #category : #accessing }
StrikeModel >> lpCutoff [

	^ lpCutoff
]

{ #category : #accessing }
StrikeModel >> lpCutoff: anObject [

	lpCutoff := anObject asBox
]

{ #category : #accessing }
StrikeModel >> strikePosition [

	^ strikePosition
]

{ #category : #accessing }
StrikeModel >> strikePosition: anObject [

	strikePosition := anObject asBox
]

{ #category : #accessing }
StrikeModel >> strikeSharpness [

	^ strikeSharpness
]

{ #category : #accessing }
StrikeModel >> strikeSharpness: anObject [

	strikeSharpness := anObject asBox
]
