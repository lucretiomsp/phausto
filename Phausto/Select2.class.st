"
The select2 primitive is a ""two-way selector"". It has three input signals: selector, input0, input1
 and one output signal y
At each instant the value of the selector signal selector(t) is used to dynamically route samples from the other two inputs input0(t) and input1(t) to the output y(t)

"
Class {
	#name : #Select2,
	#superclass : #Box,
	#instVars : [
		'code',
		'selector',
		'input0',
		'input1'
	],
	#category : #'Phausto-BoxAPI-Primitives'
}

{ #category : #initialization }
Select2 >> asBox [

BoxAPI uniqueInstance createLibContext .
^ BoxAPI uniqueInstance boxSelect2Aux: self selector input0: self input0   input1: self input1 

]

{ #category : #accessing }
Select2 >> code [

	^ code
]

{ #category : #accessing }
Select2 >> code: aString [	

	code := aString
]

{ #category : #initialization }
Select2 >> initialize [ 

super initialize.
self input0: 0.
self input1: 0.
self selector: 0.

]

{ #category : #accessing }
Select2 >> input0 [

	^ input0
]

{ #category : #accessing }
Select2 >> input0: anObject [

	input0 := anObject asBox
]

{ #category : #accessing }
Select2 >> input1 [

	^ input1
]

{ #category : #accessing }
Select2 >> input1: anObject [

	input1 := anObject asBox
]

{ #category : #accessing }
Select2 >> selector [

	^ selector
]

{ #category : #accessing }
Select2 >> selector: anObject [

	selector := anObject asBox
]
