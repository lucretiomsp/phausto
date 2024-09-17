Extension { #name : 'ByteSymbol' }

{ #category : '*Phausto' }
ByteSymbol >> asPhButton [
	"shortcut to create an horizontal slider for Phausto (with range #(0 - 1), an initvalue 0.5 and step 0.001) "

	^ (PhButton new label: self asString) asBox
]

{ #category : '*Phausto' }
ByteSymbol >> asPhHSlider [
	"shortcut to create an horizontal slider for Phausto (with range #(0 - 1), an initvalue 0.5 and step 0.001) "

	^ (PhHSlider new
		   label: self asString
		   init: 0.5
		   min: 0
		   max: 1
		   step: 0.001) asBox
]
