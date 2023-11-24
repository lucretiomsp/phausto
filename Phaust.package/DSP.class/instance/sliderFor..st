as yet unclassified
sliderFor: aString
" creates a new slider for the parameter named aString"
| index |

index := self getParamIndex: aString.
"the parameter must exist!!"
(index = -1) ifTrue: [ ^ Error new signal: 'Parameter named ' , self, ' does not exist!!' ] ifFalse: [^ PhSlider newWithIndex: index forDSP: self ]

