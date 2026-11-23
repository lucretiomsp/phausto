"
Two-way 4th-order Linkwitz-Riley crossover (fi.crossover2LR4). 1 input, 2 outputs (low, high).

**cutoff:** crossover frequency (Hz)
"
Class {
	#name : 'PhCrossover2LR4',
	#superclass : 'PhLinkwitzRileyFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhCrossover2LR4 >> initialize [

	super initialize.
	processExpression := 'process = fi.crossover2LR4;'
]
