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
ByteString >> asBox [

	| box emptyBox |
	"basic checking"
	self endsWith: ';'.
	BoxAPI uniqueInstance createLibContext.

	emptyBox := PhBox new.
	box := BoxAPI uniqueInstance
		       boxFromString: self 
		       inputs: emptyBox inputs
		       outputs: emptyBox outputs
		       buffer: emptyBox errorBuffer.
	^ box
]

{ #category : '*Phausto' }
ByteString >> asDSPParameter [

	^ DSPParameter new
]

{ #category : '*Phausto' }
ByteString >> asSetValueDefinition [
"Generates a C setter declaration for this string"

	| stream argument|
	argument:= self first asLowercase asString , self allButFirst.
	stream := ReadWriteStream on: ''.
	stream << 'void set'.
	stream << self.
	stream << '(float '.
	stream << argument.
	stream << ');'.
	^ stream contents
]
