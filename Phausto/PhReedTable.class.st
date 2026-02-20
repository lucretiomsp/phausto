"
Extremely basic reed table that can be used to implement a wide range of single reed types for many different instruments (saxophone, clarinet, etc.).
##Parameters:

**excitation:** an excitation signal
**offset:** table offset
**slope:** table slope

"
Class {
	#name : 'PhReedTable',
	#superclass : 'UnitGenerator',
	#instVars : [
		'excitation'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhReedTable >> asBox [

	^ self excitation asBox
		  connectTo: self code asBox
]

{ #category : 'accessing' }
PhReedTable >> excitation [ 

^ excitation
]

{ #category : 'initialization' }
PhReedTable >> initialize [

	super initialize.
	processExpression := 'process = pm.fluteJetTable;'.

	excitation := PhBlower new
]
