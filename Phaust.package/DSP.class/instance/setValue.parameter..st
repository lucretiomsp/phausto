as yet unclassified
setValue: aFloat parameter: aParamAsString
"  set the value of the parameter named aParamAsString"

| indexInteger |
self isNull ifTrue: [^ self class invalidException] ifFalse: [ indexInteger := self getParamIndex: aParamAsString . self setValue: aFloat parameterIndex: indexInteger]