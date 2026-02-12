"
Illustrate and compare all three Moog VCF implementations.
A voltage-controlled filter (VCF) is an electronic filter whose operating characteristics (primarily cutoff frequency) can be set by an input control voltage.[1] Voltage-controlled filters are widely used in synthesizers. 
"
Class {
	#name : 'MoogVcf_Demo',
	#superclass : 'PhDemosMono',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
MoogVcf_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]
