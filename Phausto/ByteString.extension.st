Extension { #name : 'ByteString' }

{ #category : '*Phausto' }
ByteString >> afterLastSlash [

	^ (self reverse copyUpToSubstring: '/') reverse
]

{ #category : '*Phausto' }
ByteString >> asSymbolWithSuffix: aString [

	^ ((WriteStream on: String new)
		   nextPutAll: self;
		   nextPutAll: aString;
		   yourself) contents asSymbol
]
