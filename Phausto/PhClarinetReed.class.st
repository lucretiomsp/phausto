"
Extremely basic reed table that can be used to implement a wide range of single reed types for many different instruments (saxophone, clarinet, etc.).
##Parameters:

**excitation:** an excitation signal
**offset:** table offset
**slope:** table slope

"
Class {
	#name : 'PhClarinetReed',
	#superclass : 'UnitGenerator',
	#instVars : [
		'excitation',
		'stiffness'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhClarinetReed >> asBox [

	^ self stiffness asBox , self excitation asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhClarinetReed >> excitation [ 

^ excitation
]

{ #category : 'initialization' }
PhClarinetReed >> initialize [

	super initialize.
	processExpression := 'process = pm.clarinetReed;'.

	excitation := PhBlower new.
	stiffness := (self  label , 'Stiffness') asSymbol asPhHSlider
]

{ #category : 'accessing' }
PhClarinetReed >> stiffness [
	^ stiffness
]
