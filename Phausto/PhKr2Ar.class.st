"
Force a control rate signal to be used as an audio signal

_For example:_

```language= Pharo
dsp := (PhHSlider new => PhKr2Ar new) asDsp.
```
"
Class {
	#name : 'PhKr2Ar',
	#superclass : 'PhBasics',
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhKr2Ar >> asBox [ 

^ self input asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhKr2Ar >> initialize [ 

super initialize .
processExpression := 'process = ba.kr2ar;'
]
