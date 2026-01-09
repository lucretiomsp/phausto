"
Noise Gate demo.
A noise gate or simply gate is an electronic device or software that is used to control the volume of an audio signal. Noise gates attenuate signals by a fixed amount, known as the range. In its simplest form, a noise gate allows a main signal to pass through only when it is above a set threshold: the gate is ""open"". If the signal falls below the threshold, no signal is allowed to pass (or the signal is substantially attenuated): the gate is ""closed"". A noise gate is used when the level of the ""signal"" is above the level of the unwanted ""noise"". The threshold is set above the level of the ""noise"", and so when there is no main ""signal"", the gate is closed.
"
Class {
	#name : 'Gate_Demo',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Gate_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]
