Class {
	#name : #Clap,
	#superclass : #Synths,
	#category : #'Phaust-BoxAPI'
}

{ #category : #initialization }
Clap >> initialize [

| box |
super initialize.
code := self code , 'process = sy.clap'
	
]
