"
This is a stereo reverb following the ""ReverbTank"" example in [1], although some parameter ranges and scaling have been adjusted. It is an unofficial version of the Spin Semiconductor® Reverb. Other relevant instructional material can be found in [2-4].

References
[1] Pirkle, W. C. (2019). Designing audio effect plugins in C++ (2nd ed.). Chapter 17.14.

[2] Spin Semiconductor. (n.d.). Reverberation. Retrieved 2024-04-16, from http://www.spinsemi.com/knowledge_base/effects.html#Reverberation

[3] Zölzer, U. (2022). Digital audio signal processing (3rd ed.). Chapter 7, Figure 7.39.

[4] Valhalla DSP. (2010, August 25). RIP Keith Barr. Retrieved 2024-04-16, from https://valhalladsp.com/2010/08/25/rip-keith-barr/
"
Class {
	#name : 'ReverbTank_Demo',
	#superclass : 'Demos',
	#instVars : [
		'inputL',
		'inputR'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
ReverbTank_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
ReverbTank_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'accessing' }
ReverbTank_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
