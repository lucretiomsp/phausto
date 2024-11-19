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

    spec baseline: 'MasterLu' with: [ spec repository: 'github://lucretiomsp/MasterLu:main' ].

    spec package: 'Phausto' with: [ spec requires: #('MasterLu' ) ].
    spec group: 'default' with: #('Phausto' 'MasterLu')].
]
