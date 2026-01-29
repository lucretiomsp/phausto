Class {
	#name : 'DsPolice',
	#superclass : 'Object',
	#instVars : [
		'fMin',
		'fMax',
		'sirenSpeed'
	],
	#category : 'Phausto-DesigningSounds-Practicals',
	#package : 'Phausto-DesigningSounds',
	#tag : 'Practicals'
}

{ #category : 'converting' }
DsPolice >> asBox [ 

| power freq lfo siren |
lfo := LFOTriPos new offset: 300 asBox ; amount: 400 asBox .
power := PhPower new inputL: (fMax asBox / fMin asBox); inputR: (LFOTriPos  new freq: sirenSpeed) .
freq := fMin asBox * power asBox.
siren := TriOsc new freq: lfo.

^ siren 
]

{ #category : 'initialization' }
DsPolice >> initialize [

super initialize .
fMin := 300.
fMax := 1100.
sirenSpeed := 0.1.


]
