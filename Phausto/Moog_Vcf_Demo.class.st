"
Illustrate and compare all three Moog VCF implementations.
A voltage-controlled filter (VCF) is an electronic filter whose operating characteristics (primarily cutoff frequency) can be set by an input control voltage.[1] Voltage-controlled filters are widely used in synthesizers. 
"
Class {
	#name : 'Moog_Vcf_Demo',
	#superclass : 'Demos',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Moog_Vcf_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
Moog_Vcf_Demo >> input [


	^ input ifNil: [ input := 0 asBox ]
]
