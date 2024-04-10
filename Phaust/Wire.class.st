"
This box represents a wire ( _ )in the Faust programming language.
it does nothing else but transmit the data stream
"
Class {
	#name : #Wire,
	#superclass : #Box,
	#category : #'Phaust-BoxAPI-Boxes'
}

{ #category : #arithmetic }
Wire >> , anotherWireOrUG [

"parallelComposition of Wires with other Objects"
self asBox , anotherWireOrUG asBox
]

{ #category : #converting }
Wire >> asBox [ 
 ^ BoxAPI uniqueInstance boxWire
]

{ #category : #initialization }
Wire >> initialize [

	super initialize.
	
]
