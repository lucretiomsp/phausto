"
Calculate the gender for the provided voiceType value. (0: male, 1: female)
##Parameters:

** voiceType: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
"
Class {
	#name : 'PhVoiceGender',
	#superclass : 'UnitGenerator',
	#instVars : [
		'voiceType'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'converting' }
PhVoiceGender >> asBox [ 

^ self voiceType asBox connectTo: self code asBox.
]

{ #category : 'initialization' }
PhVoiceGender >> initialize [

	super initialize.
	processExpression := 'process = pm.voiceGender;'.
	voiceType := PhHSlider new label: self label , 'VoiceType' values: #(0 0 4 0.01).
	
]

{ #category : 'converting' }
PhVoiceGender >> voiceType [
^ voiceType
]
