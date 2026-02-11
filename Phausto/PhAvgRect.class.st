"
Moving average.

## Parameters:
**period:** the averaging frame in seconds
"
Class {
	#name : 'PhAvgRect',
	#superclass : 'PhFilter',
	#instVars : [
		'period'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
PhAvgRect >> asBox [ 

^ self period asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhAvgRect >> initialize [

	super initialize.
	period := PhHSlider new
		          label: self label , 'Period'
		          values: #( 0.1 0.01 2 0.01 ).
	processExpression := 'process = fi.avg_rect;'.
	
]

{ #category : 'accessing' }
PhAvgRect >> period [ 
^ period
]
