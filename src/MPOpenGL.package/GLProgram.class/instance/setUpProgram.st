initialize-release
setUpProgram

	| attachedShaders status |
	self createProgram.
	self shareGlInstance.
	attachedShaders := self attachShaders.
	gl glLinkProgram: id.
	status := IntegerArray new: 1.
	gl glGetProgramiv: id with: GL_LINK_STATUS with: status.
	status first = 0 ifTrue: [self error: 'failed to link shader: ', (self getProgramInfoLog: id)].
	self deleteShaders: attachedShaders.