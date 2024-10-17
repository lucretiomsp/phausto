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
		spec group: 'default' with: #( 'Phausto' ) ]
]
