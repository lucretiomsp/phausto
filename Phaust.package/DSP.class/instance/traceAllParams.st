as yet unclassified
traceAllParams

"show in transcript alla vailable parameters for this DSP"

1 to: self getParamCount do: [ :i | (self getParamAddress: i) traceCr.]