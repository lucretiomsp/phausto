"
I am the UnitGeneratorNullObject, all the UnitGenerators instances become an instance of my class after an underlying Faust context is destroyed. this should avoid null pointers operations in our Faust compiler
"
Class {
	#name : 'UnitGeneratorNullObject',
	#superclass : 'Object',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'error signalling' }
UnitGeneratorNullObject class >> defaultError [

^ Error new signal: 'All Unit Generators have been destroyed after the creation of the DSP. You should reinstantiate them'
]

{ #category : 'connecting' }
UnitGeneratorNullObject >> * aUnitGenerator [

	^ self class defaultError
]

{ #category : 'connecting' }
UnitGeneratorNullObject >> + aUnitGenerator [

	^ self class defaultError
]

{ #category : 'connecting' }
UnitGeneratorNullObject >> - aUnitGenerator [

	^ self class defaultError
]

{ #category : 'connecting' }
UnitGeneratorNullObject >> / aUnitGenerator [

	^ self class defaultError
]

{ #category : 'connecting' }
UnitGeneratorNullObject >> => anUnitGeneratorNullObject [ 
	^ self class defaultError
]

{ #category : 'connecting' }
UnitGeneratorNullObject >> asDsp [ 

	^ self class defaultError
]

{ #category : 'connecting' }
UnitGeneratorNullObject >> patchedWith: aUnitGenerator [

	^ self class defaultError
]

{ #category : 'connecting' }
UnitGeneratorNullObject >> smoo [

	^ self class defaultError
]
