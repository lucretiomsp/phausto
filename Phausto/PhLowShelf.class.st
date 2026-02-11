"
First-order ""low shelf"" filter (gain boost|cut between dc and some freque
##Parameters:

**level:** desired level (dB) between dc and fx (boost L0>0 or cut L0<0)
**freq:** -3dB frequency of lowpass band (L0>0) or upper band (L0<0) (see ""SHELF SHAPE"" below).
"
Class {
	#name : 'PhLowShelf',
	#superclass : 'PhFilter',
	#instVars : [
		'level',
		'freq'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhLowShelf >> asBox [ 

^ self level asBox , self freq asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhLowShelf >> freq [ 
^ freq
]

{ #category : 'initialization' }
PhLowShelf >> initialize [

	super initialize.
	processExpression := 'process = fi.low_shelf;'.
	level := PhHSlider new label: self label , 'Level' values: #(3 -6 6 0.01).
	freq := PhHSlider new label: self label , 'Freq' values: #( 500 20 3000 0.1).
]

{ #category : 'accessing' }
PhLowShelf >> level [ 
^ level
]
