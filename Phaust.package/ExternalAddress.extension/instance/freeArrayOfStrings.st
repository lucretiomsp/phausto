*Phaust
freeArrayOfStrings
| index string |
index := 1.
[  (string := self pointerAt: index) isNull ]
whileFalse: [  string free . index := index + FFIExternalType  pointerSize  ].
self free.