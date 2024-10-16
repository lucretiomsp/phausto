Extension { #name : 'DefaultExternalDropHandler' }

{ #category : '*Phausto' }
DefaultExternalDropHandler >> handle: aFileReference in: pasteUp dropEvent: anEvent [
	"the file was just droped, let's do our job"

	| fileName |
	fileName := aFileReference fullName surroundedBySingleQuotes .
	Clipboard clipboardText: fileName .
	StPlaygroundPresenter allInstances last millerList pages contents last text doTextPaste.
   ^ fileName 	
]
