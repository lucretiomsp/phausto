Extension { #name : #String }

{ #category : #'*Phaust' }
String >> asPhFader [
	"Create a Phaust fader with slef as label with range: #(0 1) , initiValue: 0.5 and step: 0.001 "
	
PhVslider new label:  self init: 0.5  min: 0.0  max: 1.0  step: 0.001 
]
