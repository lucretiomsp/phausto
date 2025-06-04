Extension { #name : 'ByteString' }

{ #category : '*Phausto' }
ByteString >> afterLastSlash [


		^ (self findBetweenSubstrings: '/') last 
]

{ #category : '*Phausto' }
ByteString >> afterLastSlashOfPath [


Smalltalk os family = #MacOSX ifTrue: 
	[^ (self findBetweenSubstrings: '/') last].
Smalltalk os family = #Windows ifTrue: [^ (self findBetweenSubstrings: '
\') last]
]

{ #category : '*Phausto' }
ByteString >> asSymbolWithSuffix: aString [

	^ ((WriteStream on: String new)
		   nextPutAll: self;
		   nextPutAll: aString;
		   yourself) contents asSymbol
]

{ #category : '*Phausto' }
ByteString >> asTpSampler [
	"creates a TpSampler loaded with the file or folder with self as path"
self isAudioFilePath ifTrue: [  
	^ TpSampler new
		  pathToFile: self.
		  "label: self afterLastSlash"]
	ifFalse: [ 
			^ TpSampler new
		  pathToFolder: self;
		  label: self afterLastSlash ]
]
