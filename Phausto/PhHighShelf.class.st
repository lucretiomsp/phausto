"
First-order ""high shelf"" filter (gain boost|cut between dc and some freque
##Parameters:

**level:** desired level (dB) between fx and SR/2 (boost Lpi>0 or cut Lpi<0)
**freq:** -3dB frequency of highpass band (L0>0) or lower band (L0<0) 
"
Class {
	#name : 'PhHighShelf',
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
PhHighShelf >> asBox [ 

^ self level asBox , self freq asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhHighShelf >> freq [ 
^ freq
]

{ #category : 'initialization' }
PhHighShelf >> initialize [

	super initialize.
	processExpression := 'process = fi.high_shelf;'.
	level := PhHSlider new
		         label: self label , 'Level'
		         values: #( 3 -6 6 0.01 ).
	freq := PhHSlider new
		        label: self label , 'Freq'
		        values: #( 500 20 3000 0.1 )
]

{ #category : 'accessing' }
PhHighShelf >> level [ 
^ level
]
