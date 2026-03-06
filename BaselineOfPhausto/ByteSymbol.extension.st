Extension { #name : 'ByteSymbol' }

{ #category : '*BaselineOfPhausto' }
ByteSymbol >> <- aNumber [

	DSP allInstances last setValue: aNumber parameter: self asString
]
