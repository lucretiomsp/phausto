Extension { #name : 'ByteString' }

{ #category : '*Phausto' }
ByteString >> afterLastSlash [

	^ (self reverse copyUpToSubstring: '/') reverse
]
