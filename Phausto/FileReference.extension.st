Extension { #name : 'FileReference' }

{ #category : '*Phausto' }
FileReference >> hasAudioFiles [
	
	| audioFiles |
	audioFiles := self children select: [ :i | i isAudioFile ].
	^ audioFiles isNotEmpty 
]
