"
Abstract superclass for all Pysical Models blocks with 3 inputs
"
Class {
	#name : 'PhPmOutElement',
	#superclass : 'UnitGenerator',
	#instVars : [
		'outputBlock'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
PhPmOutElement >> initialize [

	super initialize.
	outputBlock := PhBasicBlock new
]

{ #category : 'accessing' }
PhPmOutElement >> outputBlock [

^ outputBlock 
]

{ #category : 'accessing' }
PhPmOutElement >> outputBlock: anOutputBlock [

	outputBlock := anOutputBlock 
]
