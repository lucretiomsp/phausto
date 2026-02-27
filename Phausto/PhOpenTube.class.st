"
A tube segment without terminations (same as stringSegment).
##Parameters:
**maxLength:** the maximum length of the tube in meters (should be static)
**length:** the length of the tube in meters
"
Class {
	#name : 'PhOpenTube',
	#superclass : 'PhTube',
	#instVars : [
		'maxLength',
		'length'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhOpenTube >> asBox [ 

^ self input asBox , self length asBox connectTo: self code asBox 
]

{ #category : 'initialization' }
PhOpenTube >> initialize [

	super initialize.
	maxLength := 1.1.
	processExpression := 'process = pm.openTube(1.1);'.
	length := (self label , 'Length') asSymbol asPhHSlider 
	
]

{ #category : 'accessing' }
PhOpenTube >> length [

	^ length 
]

{ #category : 'accessing' }
PhOpenTube >> maxLenght: aLengthInMeters [

	maxLength := aLengthInMeters.
	self updateProcessExpressionWith: aLengthInMeters .
]
