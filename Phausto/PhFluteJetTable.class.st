"
Extremely basic reed table that can be used to implement a wide range of single reed types for many different instruments (saxophone, clarinet, etc.).
##Parameters:

**excitation:** an excitation signal
**offset:** table offset
**slope:** table slope

"
Class {
	#name : 'PhFluteJetTable',
	#superclass : 'UnitGenerator',
	#instVars : [
		'excitation'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhFluteJetTable >> asBox [

	^ self excitation asBox
		  connectTo: self code asBox
]

{ #category : 'accessing' }
PhFluteJetTable >> excitation [ 

^ excitation
]

{ #category : 'initialization' }
PhFluteJetTable >> initialize [

	super initialize.
	processExpression := 'process = pm.fluteJetTable;'.

	excitation := PhBlower new
]
