"
Extremely basic reed table that can be used to implement a wide range of single reed types for many different instruments (saxophone, clarinet, etc.).
##Parameters:

**excitation:** an excitation signal
**offset:** table offset
**slope:** table slope

"
Class {
	#name : 'PhBrassLipsTable',
	#superclass : 'UnitGenerator',
	#instVars : [
		'excitation',
		'tubeLength',
		'lipsTension'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhBrassLipsTable >> asBox [

	^ self tubeLength asBox , self lipsTension asBox , self  excitation asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhBrassLipsTable >> excitation [ 

^ excitation
]

{ #category : 'initialization' }
PhBrassLipsTable >> initialize [

	super initialize.
	processExpression := 'process = pm.brassLipsTable;'.
	tubeLength := PhHSlider new
		              label: self label , 'Offset'
		              values: #( 0.4 0 1 0.01 ).
	lipsTension := PhHSlider new
		               label: self label , 'Slope'
		               values: #( 0.4 0 1 0.01 ).
	excitation := PhBlower new
]

{ #category : 'as yet unclassified' }
PhBrassLipsTable >> lipsTensiom [

^ lipsTension
]

{ #category : 'accessing' }
PhBrassLipsTable >> lipsTension [
	^ lipsTension
]

{ #category : 'accessing' }
PhBrassLipsTable >> tubeLength [
	^ tubeLength
]
