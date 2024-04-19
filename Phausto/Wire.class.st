"
This box represents a wire ( _ )in the Faust programming language.
it does nothing else but transmit the data stream
"
Class {
	#name : #Wire,
	#superclass : #Box,
	#category : #'Phausto-BoxAPI-Boxes'
}

{ #category : #arithmetic }
Wire >> , anotherWireOrUG [

"parallelComposition of Wires with other Objects"
self asBox , anotherWireOrUG asBox
]

{ #category : #converting }
Wire >> asBox [
	"^ BoxAPI uniqueInstance boxWire "

	| box code |
	
	code := 'import("stdfaust.lib"); process = _ ;'.

	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]
