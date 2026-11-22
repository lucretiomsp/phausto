"
Calculate the gender for the provided voiceType value. (0: male, 1: female)
##Parameters:

** voiceType: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
"
Class {
	#name : 'PhVoiceGender',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'voiceType'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhVoiceGender class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)' }
]

{ #category : 'faust' }
PhVoiceGender class >> argumentNames [

	^ #( #voiceType )
]

{ #category : 'faust' }
PhVoiceGender class >> faustName [

	^ 'voiceGender'
]

{ #category : 'initialization' }
PhVoiceGender >> initializeArguments [

	voiceType := PhHSlider new
			label: self label , 'VoiceType'
			values: #( 0 0 4 1 )
]

{ #category : 'accessing' }
PhVoiceGender >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
PhVoiceGender >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
