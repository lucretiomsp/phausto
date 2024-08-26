"
I am the Baseline of Phausto
"
Class {
	#name : 'BaselineOfPhausto',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPhausto',
	#package : 'BaselineOfPhausto'
}

{ #category : 'baselines' }
BaselineOfPhausto >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec package: 'Phausto'.
		spec baseline: 'Toplo' with: [ spec repository: 'github://pharo-graphics/Toplo:v0.1.0/src' ].
		spec group: 'default' with: #( 'Phausto' ) ]
]
