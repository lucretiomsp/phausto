Class {
	#name : 'BoxAPITest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BoxAPITest >> testBoxAttach [

	| testCase |
	testCase := BoxAPI uniqueInstance
		            boxAttach: Wire new asBox 
		            with: PhHBarGraph  new asBox .
	self deny: testCase asBox isNull
]

{ #category : 'tests' }
BoxAPITest >> testCreateAndDestroyLibContext [

	BoxAPI uniqueInstance createLibContext.
	self deny: PhBox libContext not.
	BoxAPI uniqueInstance destroyLibContext.
	self deny: PhBox libContext 
]

{ #category : 'tests' }
BoxAPITest >> testHBarGraph [

	| testCase |
	testCase := BoxAPI uniqueInstance
		            boxHBarGraphAux: 'testcase'
		            min: -1 asBox 
		            max: 1 asBox 
		            input: Wire new asBox.
	self deny: testCase asBox isNull
]

{ #category : 'tests' }
BoxAPITest >> testHBarGraphNoInput [

	| testCase |
	testCase := BoxAPI uniqueInstance
		            boxHBarGraph: 'testCase'
		            min: 0 asBox 
		            max: 2 asBox .
	self deny: testCase asBox isNull
]

{ #category : 'tests' }
BoxAPITest >> testReadOnlyTable [

	| n table index box |
	n := 4 asBox.
	table := #( -1 0 0.5 1 ) asPhZeroList asBox.
	index := 1 asBox.

	box := BoxAPI uniqueInstance
		       boxReadOnlyTable: n
		       init: table
		       index: index.

	self deny: box  isNull
]

{ #category : 'tests' }
BoxAPITest >> testVBarGraph [

	| testCase |
	testCase := BoxAPI uniqueInstance
		            boxVBarGraphAux: 'testcase'
		            min: -1 asBox
		            max: 1 asBox
		            input: Wire new asBox.
	self deny: testCase asBox isNull
]

{ #category : 'tests' }
BoxAPITest >> testVBarGraphNoInput [

	| testCase |
	testCase := BoxAPI uniqueInstance
		            boxVBarGraph: 'testCase'
		            min: 0 asBox 
		            max: 2 asBox .
	self deny: testCase asBox isNull
]
