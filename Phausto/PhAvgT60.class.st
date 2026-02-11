"
Averaging function based on a one-pole filter and the t60 response time. This response is particularly useful when the system is required to reach the final value after about period seconds.
"
Class {
	#name : 'PhAvgT60',
	#superclass : 'PhAvgRect',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhAvgT60 >> initialize [

	super initialize.
	processExpression := 'process = fi.avg_t60;'
]
