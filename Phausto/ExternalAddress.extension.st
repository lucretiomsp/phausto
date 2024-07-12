Extension { #name : 'ExternalAddress' }

{ #category : '*Phausto' }
ExternalAddress class >> arrayOfStringsFrom: aCollection [
    "answer a char**, terminated with nil"
    | stringArray index |

    stringArray := ExternalAddress allocate: (FFIExternalType pointerSize * (aCollection size + 1)).
    index := 1.
    aCollection do: [ :each | 
        stringArray pointerAt: index put: (self fromString: each).
        index := index + FFIExternalType pointerSize ].
    stringArray pointerAt: index put: ExternalAddress null.
    ^ stringArray
]

{ #category : '*Phausto' }
ExternalAddress >> freeArrayOfStrings [
| index string |
index := 1.
[  (string := self pointerAt: index) isNull ]
whileFalse: [  string free . index := index + FFIExternalType  pointerSize  ].
self free.
]
