"
A filtered noise excitation
"
Class {
	#name : 'StrikeModel',
	#superclass : 'Exciter',
	#instVars : [
		'lpCutoff',
		'hpCutoff',
		'strikePosition',
		'strikeSharpness',
		'gain'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'accessing' }
StrikeModel >> gain [

	^ gain
]

{ #category : 'accessing' }
StrikeModel >> hpCutoff [

	^ hpCutoff
]

{ #category : 'initialization' }
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

{ #category : 'accessing' }
StrikeModel >> lpCutoff [

	^ lpCutoff
]

{ #category : 'accessing' }
StrikeModel >> strikePosition [

	^ strikePosition
]

{ #category : 'accessing' }
StrikeModel >> strikeSharpness [

	^ strikeSharpness
]
