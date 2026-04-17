"
Datorro Reverb Demo.

see:
https://ccrma.stanford.edu/~dattorro/EffectDesignPart1.pdf
"
Class {
	#name : 'Dattorro_Rev_Demo',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'converting' }
Dattorro_Rev_Demo >> asBox [


^  self inputL asBox , self inputR asBox connectTo:
		            self code asBox.


]
