Class {
	#name : 'DsPolice',
	#superclass : 'Object',
	#instVars : [
		'fMin',
		'fMax',
		'sirenSpeed'
	],
	#category : 'Phausto-DesigningSounds',
	#package : 'Phausto-DesigningSounds'
}

{ #category : 'converting' }
DsPolice >> asBox [ 

| power freq |
power := PhPower new inputL: (fMax asBox / fMin asBox); inputR: (LFOTriPos  new freq: sirenSpeed) .
freq := fMin asBox * PhPower 
]

{ #category : 'initialization' }
DsPolice >> initialize [

fMin := 300.
fMax := 1100.
sirenSpeed := 0.1.


]
