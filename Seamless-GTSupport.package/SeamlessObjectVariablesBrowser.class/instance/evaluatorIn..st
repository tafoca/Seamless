private building
evaluatorIn: composite
	^ (composite custom: (SeamlessRemoteScriptPresentation remotePeer: remotePeer))
		doItReceiver: [ :object | object ];
		smalltalkClass: [ :object | object remoteClass ];
		display: [ :object | 
			String streamContents: [ :stream | 
				stream 
					nextPutAll: (self printStringOf: object);
					cr;
					nextPutAll: (GTSnippets snippetAt: object class)] ];
		onChangeOfPort: #text act: [ :textPresentation :object |
				GTSnippets 
					snippetAt: object class 
					put: (self stringWithoutInitialCommentFrom: textPresentation text asString).
				 textPresentation clearUserEdits ];
		installDefaultSelectionActions