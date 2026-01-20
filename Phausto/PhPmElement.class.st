"
Abstract superclass for all Pysical Models blocks with 3 inputs
"
Class {
	#name : 'PhPmElement',
	#superclass : 'UnitGenerator',
	#instVars : [
		'inputBlock'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'initialization' }
PhPmElement >> initialize [ 
	
	super initialize.
	inputBlock := PhBasicBlock new.
]

{ #category : 'accessing' }
PhPmElement >> inputBlock [ 

^ inputBlock
]
