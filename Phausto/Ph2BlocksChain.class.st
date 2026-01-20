"
Helper class to contruct chains for physical models

"
Class {
	#name : 'Ph2BlocksChain',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input1',
		'input2'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
Ph2BlocksChain >> asBox [

	| firstPart secondPart firstToSecond |
	firstPart := PhPreRouting new asBox connectTo:
		             Wire new asBox , self input1 asBox.
	secondPart := PhPostRouting new asBox connectTo:
		              Wire new asBox , self input2 asBox.
	firstToSecond := firstPart connectTo: secondPart.

	^ firstToSecond ~ Wire new asBox connectTo: PhEndRouting new asBox
]

{ #category : 'initialization' }
Ph2BlocksChain >> initialize [

	super initialize.
	input1 := PhBasicBlock new.
	input2 := PhBasicBlock new.
]

{ #category : 'accessing' }
Ph2BlocksChain >> input1 [ 

^ input1
]

{ #category : 'accessing' }
Ph2BlocksChain >> input2 [ 

	^ input2
]
