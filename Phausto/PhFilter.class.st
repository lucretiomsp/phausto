"
In signal processing, a filter is a process or device that removes frequencies from a signal.

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'PhFilter',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhFilter >> initialize [

	super initialize.
	input := Wire new.
]

{ #category : 'accessing' }
PhFilter >> input [

	^ input 
]

{ #category : 'connecting' }
PhFilter >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator 
]
