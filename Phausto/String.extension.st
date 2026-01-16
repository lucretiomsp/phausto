Extension { #name : 'String' }

{ #category : '*Phausto' }
String >> afterLastSlash [


		^ (self findBetweenSubstrings: '/') last 
]

{ #category : '*Phausto' }
String >> afterLastSlashOfPath [


Smalltalk os family = #MacOSX ifTrue: 
	[^ (self findBetweenSubstrings: '/') last].
Smalltalk os family = #Windows ifTrue: [^ (self findBetweenSubstrings: '
\') last]
]

{ #category : '*Phausto' }
String >> asChainBlockString [


	| eqIndex result |
	
	eqIndex := self indexOf: $= ifAbsent: [ ^ self ].
	result := self copyFrom: eqIndex + 1 to: self size.

	(result notEmpty and: [ result last = $; ])
		ifTrue: [ result := result allButLast ].

	^ result

]

{ #category : '*Phausto' }
String >> asPhFader [
	"Create a Phaust fader with slef as label with range: #(0 1) , initiValue: 0.5 and step: 0.001 "
	
PhVSlider new label:  self init: 0.5  min: 0.0  max: 1.0  step: 0.001 
]

{ #category : '*Phausto' }
String >> asSymbolWithSuffix: aString [

	^ ((WriteStream on: String new)
		   nextPutAll: self;
		   nextPutAll: aString;
		   yourself) contents asSymbol
]

{ #category : '*Phausto' }
String >> asTpSampler [
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

{ #category : '*Phausto' }
String >> betweenParenthesis [

	| result |
	result := ReadWriteStream on: ''.
	result << $(.
	result << self.
	result << $).
	^ result contents
]

{ #category : '*Phausto' }
String >> isAudioFilePath [
"return true if string end with .wav or .aif  .aiff , valid files for TpSampler"
^ ((self endsWith: '.wav') or: (self endsWith: '.aif')) or: (self endsWith: '.aiff')
]

{ #category : '*Phausto' }
String >> surroundedByQuotes [
	" return the string surrounde by quotes, to use a path for soundfile based DSP"

	^ self surroundedBy: ''''
]

{ #category : '*Phausto' }
String >> terminatesWithSemiColon [
	" valid Faust dsp code always terminates  with semicolon  "


self last = $ ifTrue: [ ^ true ] ifFalse: [ Error new signal: 'String does not terminate with semicolon' ]
]
