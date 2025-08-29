Extension { #name : 'ByteString' }

{ #category : '*Phausto' }
ByteString >> addViewProperty [

| originalCmajorPatch |
originalCmajorPatch := STONJSON fromString: self.	

^ 8
]

{ #category : '*Phausto' }
ByteString >> addViewPropertyFrom: aCmajorView [

| originalCmajorPatch newCmajorPatch |
originalCmajorPatch := STONJSON fromString: self.	
originalCmajorPatch  add: aCmajorView patchViewProperty .
newCmajorPatch := STONJSON toString: originalCmajorPatch .
^ newCmajorPatch 
]
