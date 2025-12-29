"
Special subclass of PhList counting from zero, used for parallel composition that avoid transformation into PhBox before cobersion to Dsp
"
Class {
	#name : 'PhZeroList',
	#superclass : 'PhList',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'arithmetic' }
PhZeroList >> , aUnitGenerator [

| oneElementArray |
oneElementArray := Array with: aUnitGenerator .
	self addAll: oneElementArray
]

{ #category : 'converting' }
PhZeroList >> asPhList [
	
^ self
]

{ #category : 'initialization' }
PhZeroList >> initialize [

	super initialize.
	items := OrderedCollection new
]
