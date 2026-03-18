Class {
	#name : 'CppTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CppTest >> testAsSetValueDefinition [

| label definition |
label := 'Cutoff'.
definition := 'void setCutoff(float cutoff);'.
self assert: label asSetValueDefinition equals: definition.
]
