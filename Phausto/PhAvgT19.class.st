"
Averaging function based on a one-pole filter and the t19 response time. This response is close to the moving-average algorithm as it roughly reaches the final value after period seconds and shows about the same oscillations for non-steady signals.
"
Class {
	#name : 'PhAvgT19',
	#superclass : 'PhAvgRect',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhAvgT19 >> initialize [ 
super initialize .
processExpression := 'process = fi.avg_t19;'
]
