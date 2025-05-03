Extension { #name : 'FileReference' }

{ #category : '*Phausto' }
FileReference >> hasAudioFiles [
	

	self isDirectory ifTrue: [ ^ (self children select: [ :i | i isAudioFile ]) isNotEmpty ] ifFalse: [ ^ false ]
]

{ #category : '*Phausto' }
FileReference >> isAudioFile [

	^ self pathString isAudioFilePath
]
