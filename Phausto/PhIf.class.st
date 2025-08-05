"
**if-then-else** implemented with a select2. WARNING: since _Faust select2 _ is strict (always evaluating both branches), the resulting if does not have the usual ""lazy"" semantic of the C if form, and thus cannot be used to protect against forbidden computations like division-by-zero for instance.

## Parameter
**condition:**condition
**then:** signal selected while cond is true
**else:** signal selected while cond is false
"
Class {
	#name : 'PhIf',
	#superclass : 'UnitGenerator',
	#instVars : [
		'condition',
		'then',
		'else'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhIf >> asBox [ 

^ self condition asBox , self then asBox , self else asBox connectTo: super asBox
]

{ #category : 'accessing' }
PhIf >> condition [

	^ condition 
]

{ #category : 'accessing' }
PhIf >> else [

	^ else 
]

{ #category : 'initialization' }
PhIf >> initialize [

	super initialize.
	processExpression := 'process = ba.if;'.
	condition := 1.
	then := 0.
	else := 0.
]

{ #category : 'accessing' }
PhIf >> then [ 

^ then 
]
