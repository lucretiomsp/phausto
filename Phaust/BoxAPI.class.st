"
I am the Phaust Box API, I call C functiond from the Faust Box API
The box_signal_api.cpp  is compiled in libfaust.
More about the Faust box API: https://faustdoc.grame.fr/tutorials/box-api/
"
Class {
	#name : #BoxAPI,
	#superclass : #FFILibrary,
	#classVars : [
		'boxAlias'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #accessing }
BoxAPI class >> ffiLibrary [ 
^ self class
]

{ #category : #'class initialization' }
BoxAPI class >> initialize [

	boxAlias := #CTree
]

{ #category : #'as yet unclassified' }
BoxAPI >> createLibContext [

	self ffiCall: #( void createLibContext #(  ) )
]

{ #category : #'as yet unclassified' }
BoxAPI >> destroyLibContext [

	self ffiCall: #( void destroyLibContext #(  ) )
]

{ #category : #'accessing - platform' }
BoxAPI >> macModuleName [
	"Returns the name of the dynamic libFaust for Mac."

	^ 'librariesBundle/libfaust.2.dylib'
]
