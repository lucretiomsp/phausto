"
Averaging function based on a one-pole filter and the tau response time. Tau represents the effective length of the one-pole impulse response, that is, tau is the integral of the filter's impulse response. This response is slower to reach the final value but has less ripples in non-steady signals.
"
Class {
	#name : 'PhAvgTau',
	#superclass : 'PhAvgRect',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhAvgTau >> initialize [ 
super initialize.
processExpression := 'process = fi.avg_tau;'
]
