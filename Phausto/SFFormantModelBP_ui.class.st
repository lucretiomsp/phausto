Class {
	#name : 'SFFormantModelBP_ui',
	#superclass : 'FormantSynthesis',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
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
