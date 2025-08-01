"
Superclass for all Conversion tools
"
Class {
	#name : 'PhConversionTool',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'initialization' }
PhConversionTool >> initialize [

	super initialize.
	input := Wire new.
]
