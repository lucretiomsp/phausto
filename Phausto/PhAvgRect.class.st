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

{ #category : 'accessing' }
PhAvgRect >> initialize [ 
super initialize .
processExpression := 'process = fi.avg_rect;'.
period := PhHSlider new label: self label , 'Period' values: #(0.1 0.01 2 0.01).
]

{ #category : 'accessing' }
PhAvgRect >> period [ 
^ period
]
