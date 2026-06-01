"
Convenience class to merge unit generators before converting them into PhBoxes
"
Class {
	#name : 'PhMergeOperation',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input',
		'output'
	],
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'converting' }
PhMergeOperation >> asBox [ 

^ self input asBox  mergeWith: self output asBox.
]

{ #category : 'initialization' }
PhMergeOperation >> initialize [ 

super initialize.
	input :=  ZitaLight new  .
	output := Korg35LPF  new
]

{ #category : 'accessing' }
PhMergeOperation >> input [
^ input
]

{ #category : 'accessing' }
PhMergeOperation >> output [
^ output
]
