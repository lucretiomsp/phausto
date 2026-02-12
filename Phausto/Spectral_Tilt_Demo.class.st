"
A spectral tilt application.

##Parameters: 
**n:** filter order (integer)
"
Class {
	#name : 'Spectral_Tilt_Demo',
	#superclass : 'PhDemosMono',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
Spectral_Tilt_Demo >> initialize [

	super initialize.
	processExpression := 'process = dm.spectral_tilt_demo(4);'
]

{ #category : 'trait' }
Spectral_Tilt_Demo >> n: anInteger [

| peStream |

peStream := ReadWriteStream on: ''.
peStream << 'process = dm.spectral_tilt_demo('.
anInteger printOn: peStream .
peStream << ');'.
processExpression := peStream contents
]
