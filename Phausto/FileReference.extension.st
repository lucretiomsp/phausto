Extension { #name : 'FileReference' }

{ #category : '*Phausto' }
FileReference >> hasAudioFiles [
	

	self isDirectory ifTrue: [ ^ (self children select: [ :i | i isAudioFile ]) isNotEmpty ] ifFalse: [ ^ false ]
]

{ #category : '*Phausto' }
FileReference >> isAudioFile [

	^ self pathString isAudioFilePath
]

{ #category : '*Phausto' }
FileReference >> writePosixText: aString [
	"writeStreamDo: does not truncate an existing file, so delete first.
	 Pharo string literals embed CR; compilers and diffs want LF."

	self ensureDelete.
	self writeStreamDo: [ :stream |
		stream nextPutAll: aString withUnixLineEndings ]
]
