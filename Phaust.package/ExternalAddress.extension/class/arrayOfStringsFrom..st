*Phaust
arrayOfStringsFrom: aCollection
    "answer a char**, terminated with nil"
    | stringArray index |

    stringArray := ExternalAddress allocate: (FFIExternalType pointerSize * (aCollection size + 1)).
    index := 1.
    aCollection do: [ :each | 
        stringArray pointerAt: index put: (self fromString: each).
        index := index + FFIExternalType pointerSize ].
    stringArray pointerAt: index put: ExternalAddress null.
    ^ stringArray