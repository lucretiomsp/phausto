"
VitalRev demo
"
Class {
	#name : 'PhVitalRev_Demo',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
PhVitalRev_Demo >> initialize [

	super initialize.
	processExpression := 'process = dm.vital_rev_demo;'
]
