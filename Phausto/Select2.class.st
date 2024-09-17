"
The select2 primitive is a ""two-way selector"". It has three input signals: selector, input0, input1
 and one output signal y
At each instant the value of the selector signal selector(t) is used to dynamically route samples from the other two inputs input0(t) and input1(t) to the output y(t)

"
Class {
	#name : 'Select2',
	#superclass : 'PhBox',
	#instVars : [
		'selector',
		'input0',
		'input1',
		'label'
	],
	#category : 'Phausto-BoxAPI-Primitives',
	#package : 'Phausto',
	#tag : 'BoxAPI-Primitives'
}

{ #category : 'initialization' }
Select2 >> asBox [

	BoxAPI uniqueInstance createLibContext.
	^ BoxAPI uniqueInstance
		  boxSelect2Aux: self selector asBox
		  input0: self input0 asBox
		  input1: self input1 asBox
]

{ #category : 'initialization' }
Select2 >> initialize [

	super initialize.
	
]

{ #category : 'accessing' }
Select2 >> input0 [

	^ input0 ifNil: [ 0 ]
]

{ #category : 'accessing' }
Select2 >> input0: anObject [

	input0 := anObject asBox
]

{ #category : 'accessing' }
Select2 >> input1 [

	^ input1 ifNil: [ 0 ]
]

{ #category : 'accessing' }
Select2 >> input1: anObject [

	input1 := anObject asBox
]

{ #category : 'accessing' }
Select2 >> label [

	^ label ifNil: [ 'Selector' ]
]

{ #category : 'accessing' }
Select2 >> label: anObject [

	label := anObject
]

{ #category : 'connecting' }
Select2 >> patchedWith: aUnitGenerator [

^ self shouldBeImplemented 
]

{ #category : 'accessing' }
Select2 >> selector [

	^ selector ifNil: [
		  PhButton new label: self label  ]
]

{ #category : 'accessing' }
Select2 >> selector: anObject [

	selector := anObject asBox
]
