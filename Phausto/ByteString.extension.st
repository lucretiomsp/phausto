Extension { #name : 'ByteString' }

{ #category : '*Phausto' }
ByteString >> addViewPropertyFrom: aCmajorView [

| originalCmajorPatch newCmajorPatch |
originalCmajorPatch := STONJSON fromString: self.	
originalCmajorPatch  add: aCmajorView patchViewProperty .
newCmajorPatch := STONJSON toString: originalCmajorPatch .
^ newCmajorPatch 
]

{ #category : '*Phausto' }
ByteString >> asDSPParameter [

	^ DSPParameter new
]
