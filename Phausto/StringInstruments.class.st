"
Low and high level string instruments parts. Most of the elments in this section can be used in a bidirectional chain.
length is the length of the string in meters.
a fequency in herts can be converted to a lenght in meters by sending the f2l message
"
Class {
	#name : 'StringInstruments',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'accessing' }
StringInstruments >> freq [

	^ freq ifNil: [
		  freq := PhHSlider new
			            label: self label , 'Note'
			            init: 440
			            min: 20
			            max: 1200
			            step: 1 ]
]

{ #category : 'initialization' }
StringInstruments >> initialize [

	super initialize
]
