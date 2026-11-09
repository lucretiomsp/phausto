Class {
	#name : 'SuperFx',
	#superclass : 'Object',
	#instVars : [
		'fx'
	],
	#category : 'Phausto',
	#package : 'Phausto'
}

{ #category : 'converting' }
SuperFx >> asDsp [ 

^ fx stereo asDsp.
]

{ #category : 'initialization' }
SuperFx >> initialize [ 

super initialize .

fx := PhTranspose new => Korg35LPF new.
]
