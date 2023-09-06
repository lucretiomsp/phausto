as yet unclassified
getLastError
^ self ffiCall: #(String getLastError()) 