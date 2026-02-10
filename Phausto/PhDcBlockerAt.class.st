"
DC blocker with configurable ""break frequency"". The amplitude response is substantially flat above fb, and sloped at about +6 dB/octave below fb

##Parameters:

**fb:** ""break frequency"" in Hz, i.e., -3 dB gain frequency
"
Class {
	#name : 'PhDcBlockerAt',
	#superclass : 'PhFilter',
	#instVars : [
		'fb'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhDcBlockerAt >> asBox [

	^ self fb asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhDcBlockerAt >> fb [ 
^ fb
]

{ #category : 'initialization' }
PhDcBlockerAt >> initialize [ 
super initialize .
processExpression := 'process =fi.dcblockerat;'.
fb := PhHSlider new label: 'FreqBreak' values: #(200 20 2000 0.1).
]
