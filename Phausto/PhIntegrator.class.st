"
Integrator
Same as pole(1) [implemented separately for block-diagram clarity].


"
Class {
	#name : 'PhIntegrator',
	#superclass : 'PhFilter',
	#instVars : [
		'pole'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhIntegrator >> asBox [ 

^ self input asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhIntegrator >> initialize [

	super initialize.
	processExpression := 'process = fi.integrator;'
]
