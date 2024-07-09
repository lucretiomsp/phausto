"
This box represents a wire ( _ )in the Faust programming language.
it does nothing else but transmit the data stream
"
Class {
	#name : 'Wire',
	#superclass : 'PhBox',
	#category : 'Phausto-BoxAPI-Boxes',
	#package : 'Phausto',
	#tag : 'BoxAPI-Boxes'
}

{ #category : 'arithmetic' }
Wire >> , anotherWireOrUG [

"parallelComposition of Wires with other Objects"
self asBox , anotherWireOrUG asBox
]

{ #category : 'converting' }
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
