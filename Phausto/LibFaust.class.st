"
I am LibFaust, use me to execute functions from LibFaust
"
Class {
	#name : 'LibFaust',
	#superclass : 'FFILibrary',
	#instVars : [
		'errorBuffer'
	],
	#category : 'Phausto-DynamicEngine',
	#package : 'Phausto',
	#tag : 'DynamicEngine'
}

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString [
|errorBuffer|


errorBuffer := ByteArray new: 4096.

	^  self createCMajorFileFromString: aString buffer: errorBuffer
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString buffer: errorMsg [
| myArgv fileOutput |

fileOutput := FileLocator documents asAbsolute pathString .


	myArgv := ExternalAddress arrayOfStringsFrom:
		         #('-lang' 'cmajor' '-o' 'testOutput.cmajor').
	
	^ [
	  self
		  createCMajorFileFromString: aString 
		  buffer: errorMsg arguments: myArgv  ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString buffer: errorMsg arguments: argv [ 

^ self ffiCall:
		   #( bool generateCAuxFilesFromString
        ( const char * 'MyApp', 
          const char * aString, 
          int 4, 
          void * argv, 
          ByteArray errorMsg
        )
    )
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString buffer: errorMsg withName: aName [
| myArgv fileOutput |

fileOutput := FileLocator documents asAbsolute pathString , '/' , aName , '.cmajor'.


	myArgv := ExternalAddress arrayOfStringsFrom:
		         {'-lang' . 'cmajor' . '-o' . fileOutput }.
	
	^ [
	  self
		  createCMajorFileFromString: aString 
		  buffer: errorMsg arguments: myArgv  ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString withName: aName [
|errorBuffer|


errorBuffer := ByteArray new: 4096.

	^  self createCMajorFileFromString: aString buffer: errorBuffer withName: aName
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorMIDIFileFromString: aString buffer: errorMsg arguments: argv [

	^ self ffiCall:
		  #( bool generateCAuxFilesFromString #( const char #* 'MyApp'
		        #, const char #* aString #, int 6 #, void #* argv #, ByteArray
		        errorMsg ) )
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorMIDIFileFromString: aString buffer: errorMsg withName: aName [

	| myArgv fileOutput|
	fileOutput := FileLocator documents asAbsolute pathString , '/'
	              , aName , '.cmajor'.


	myArgv := ExternalAddress arrayOfStringsFrom: {
			          '-a'.
			          '/Users/domenicocipriani/MyStuff/coding/faust4pharo/architecture/cmajor/poly-dsp.cmajor'.
			          '-lang'.
			          'cmajor-poly'.
			          '-o'.
			          fileOutput }.

	^ [
	  self
		  createCMajorMIDIFileFromString: aString
		  buffer: errorMsg
		  arguments: myArgv ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorMIDIFileFromString: aString withName: aName [

	| errorBuffer |
	errorBuffer := ByteArray new: 4096.

	^ self
		  createCMajorMIDIFileFromString: aString
		  buffer: errorBuffer
		  withName: aName
]

{ #category : 'accessing - platform' }
LibFaust >> macLibraryName [

	
	^ 'librariesBundle/libfaust.2.dylib'
]
