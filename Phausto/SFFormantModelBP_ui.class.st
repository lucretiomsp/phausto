Class {
	#name : 'SFFormantModelBP_ui',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
SFFormantModelBP_ui >> asBox [ 


super asBox
]

{ #category : 'initialization' }
SFFormantModelBP_ui >> initialize [

	super initialize.
	processExpression := 'process = pm.SFFormantModelBP_ui;'
]

{ #category : 'initialization' }
SFFormantModelBP_ui >> initializeULevel [ 
super initialize.
processExpression := 'process = pm.SFFormantModelBP_ui;'
]
