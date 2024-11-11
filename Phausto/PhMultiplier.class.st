"
I am a PhMultiplier. I correspond to a multiplication between PhBoxes but I am designed for Faust Core Syntax.
For example:
1 asBox , 2 asBox connectTo: PhMultiplier new
"
Class {
	#name : 'PhMultiplier',
	#superclass : 'PhBox',
	#category : 'Phausto-Boxes',
	#package : 'Phausto',
	#tag : 'Boxes'
}

{ #category : 'initialization' }
PhMultiplier >> initialize [

	BoxAPI uniqueInstance  createLibContext.
	^ BoxAPI uniqueInstance ffiCall: #( #PhBox * CboxMul #(  ) )
]
