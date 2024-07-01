Class {
	#name : #BaselineOfPhausto,
	#superclass : #BaselineOf,
	#category : #BaselineOfPhausto
}

{ #category : #baselines }
BaselineOfPhausto >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'Phausto' ]
]
