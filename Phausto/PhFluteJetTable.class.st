"
Extremely basic reed table that can be used to implement a wide range of single reed types for many different instruments (saxophone, clarinet, etc.).
##Parameters:

**excitation:** an excitation signal
**offset:** table offset
**slope:** table slope

"
Class {
	#name : 'PhFluteJetTable',
	#superclass : 'PhPmFunction',
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhFluteJetTable class >> faustName [

	^ 'fluteJetTable'
]

{ #category : 'accessing' }
PhFluteJetTable >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhFluteJetTable >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'initialization' }
PhFluteJetTable >> initializeArguments [

	input := PhBlower new
]
