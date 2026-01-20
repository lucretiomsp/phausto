"
Abstract super class for string elements
"
Class {
	#name : 'PhStringAbstract',
	#superclass : 'UnitGenerator',
	#instVars : [
		'pluckPosition',
		'excitation',
		'length',
		'inputBlock'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'accessing' }
PhStringAbstract >> excitation [ 
^ excitation 
]

{ #category : 'initialization' }
PhStringAbstract >> initialize [

	super initialize.
	inputBlock := PhBasicBlock new .
	length := PhSlider new
		          label: 'StringLength'
		          values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
		                 label: 'PluckPosition'
		                 values: #( 0.3 0 1 0.01 ).
	excitation := 1
]

{ #category : 'accessing' }
PhStringAbstract >> inputBlock [ 

^ inputBlock
]

{ #category : 'accessing' }
PhStringAbstract >> length [ 

^ length 
]

{ #category : 'accessing' }
PhStringAbstract >> pluckPosition [ 
^ pluckPosition 
]
