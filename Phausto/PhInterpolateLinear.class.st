"
Linear interpolation between 2 values.

##Parameters:
**dv:** in the fractional value in [0..1] range
**v0:** is the first value
**v1:** is the second value
"
Class {
	#name : 'PhInterpolateLinear',
	#superclass : 'UnitGenerator',
	#traits : 'ParamsSetter',
	#classTraits : 'ParamsSetter classTrait',
	#instVars : [
		'dv',
		'v0',
		'v1'
	],
	#category : 'Phausto-Interpolators',
	#package : 'Phausto',
	#tag : 'Interpolators'
}

{ #category : 'converting' }
PhInterpolateLinear >> asBox [ 

^ self dv asBox , self v0 asBox , self v1 asBox connectTo: self code asBox
]

{ #category : 'converting' }
PhInterpolateLinear >> dv [ 
^ dv
]

{ #category : 'initialization' }
PhInterpolateLinear >> initialize [

	super initialize.
	processExpression := 'process = it.interpolate_linear;'.
	dv := 0.5.
	v0 := 0.
	v1 := 1.
]

{ #category : 'converting' }
PhInterpolateLinear >> v0 [
^ v0
]

{ #category : 'converting' }
PhInterpolateLinear >> v1 [ 
^ v1
]
