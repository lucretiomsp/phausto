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
		'slope',
		'offset',
		'excitation'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhReedTable >> asBox [ 

^  self offset asBox , self slope asBox , self excitation asBox connectTo: self code asBox 
]

{ #category : 'accessing' }
PhReedTable >> excitation [ 

^ excitation
]

{ #category : 'initialization' }
PhReedTable >> initialize [

	super initialize.
	processExpression := 'process = pm.reedTable;'.
	offset := PhHSlider new
		          label: self label , 'Offset'
		          values: #( 0.4 0 1 0.01 ).
	slope := PhHSlider new
		         label: self label , 'Slope'
		         values: #( 0.4 0 1 0.01 ).
	excitation := PhBlower new.
]

{ #category : 'accessing' }
PhReedTable >> offset [ 
^ offset
]

{ #category : 'accessing' }
PhReedTable >> slope [ 

^ slope
]
