Extension { #name : 'SpRubScrolledTextMorph' }

{ #category : '*Phausto' }
SpRubScrolledTextMorph >> handleDropFiles: anEvent [
	"Handle a drop from the OS."

	(self model isKindOf: SpMorphicCodeAdapter) ifFalse: [ ^ self ].
	(self model presenter isKindOf: SpCodePresenter) ifFalse: [ ^ self ].

	anEvent wasHandled: true.
	Clipboard clipboardText: '''' , anEvent fileNames first , ''''.
	self model presenter doTextPaste
]
