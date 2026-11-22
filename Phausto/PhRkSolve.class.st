"
Solves the system of ordinary differential equations of any order using the explicit Runge-Kutta methods.

Faust: `pm.rk_solve(ts, ks, ni, h, eq, iv)` (0 in / 1 out)

## Parameters

- **ts**: the c column of the Butcher tableau (a list)
- **ks**: the a and b coefficients of the Butcher tableau (a list)
- **iterations**: number of iterations at each tick, compile time constant ni > 1 can improve accuracy but will degrade performance _(compile-time constant: give me a Number)_
- **timeStep**: time step, run time constant, e.g. 1/ma.SR
- **equations**: list of derivative functions
- **initialValues**: list of initial values

## Example

```language=Pharo
dsp := PhRkSolve new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhRkSolve',
	#superclass : 'PhPmFunction',
	#instVars : [
		'ts',
		'ks',
		'iterations',
		'timeStep',
		'equations',
		'initialValues'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhRkSolve class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#ts -> 'the c column of the Butcher tableau (a list)'.
			#ks -> 'the a and b coefficients of the Butcher tableau (a list)'.
			#iterations -> 'number of iterations at each tick, compile time constant ni > 1 can improve accuracy but will degrade performance'.
			#timeStep -> 'time step, run time constant, e.g. 1/ma.SR'.
			#equations -> 'list of derivative functions'.
			#initialValues -> 'list of initial values' }
]

{ #category : 'faust' }
PhRkSolve class >> argumentNames [

	^ #( #ts #ks #iterations #timeStep #equations #initialValues )
]

{ #category : 'faust' }
PhRkSolve class >> faustName [

	^ 'rk_solve'
]

{ #category : 'accessing' }
PhRkSolve >> equations [

	^ equations
]

{ #category : 'accessing' }
PhRkSolve >> equations: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhRkSolve >> initialValues [

	^ initialValues
]

{ #category : 'accessing' }
PhRkSolve >> initialValues: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhRkSolve >> initializeArguments [

	ts := #( 0 ).
	ks := #( 1 ).
	iterations := 1.
	timeStep := '1.0/ma.SR'.
	equations := '\(t,x).(0-x)'.
	initialValues := #( 1 )
]

{ #category : 'accessing' }
PhRkSolve >> iterations [

	^ iterations
]

{ #category : 'accessing' }
PhRkSolve >> iterations: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhRkSolve >> ks [

	^ ks
]

{ #category : 'accessing' }
PhRkSolve >> ks: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhRkSolve >> timeStep [

	^ timeStep
]

{ #category : 'accessing' }
PhRkSolve >> timeStep: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhRkSolve >> ts [

	^ ts
]

{ #category : 'accessing' }
PhRkSolve >> ts: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
