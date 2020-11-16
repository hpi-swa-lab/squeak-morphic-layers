Class {
	#name : #GLStaticProgram,
	#superclass : #GLProgram,
	#category : #'OpenGL-Wrappers-Shaders',
	#commentStamp : ''
}

{
	#category : #'shader code',
	#timestamp : 'stlu 11/13/2020 16:40'
}
GLStaticProgram class >> attributes [
	" return the names of all attributes your shader possesses here "

	^ #()
]

{
	#category : #'code generation',
	#timestamp : 'stlu 11/13/2020 16:39'
}
GLStaticProgram class >> compileAccessors [
	" call this method to automatically generate accessors for your attributes and uniforms "

	| source |
	self addInstVarNames: ((self uniforms, self attributes) collect: [:name | name, 'Location']).
	
	source := String streamContents: [:stream |
		stream
			nextPutAll: 'initializeLocations';
			cr;
			crtab;
			nextPutAll: 'super initializeLocations.'.
		
		stream crtab.
		self uniforms do: [:uniform |
			stream crtab;
				nextPutAll: uniform;
				nextPutAll: 'Location := self registerUniform: '; store: uniform; nextPut: $.].
		
		stream crtab.
		self attributes do: [:attribute |
			stream crtab;
				nextPutAll: attribute;
				nextPutAll: 'Location := self registerAttribute: '; store: attribute; nextPut: $.]].
		
	self compile: source classified: 'generated'.
	
	self uniforms do: [:uniform |
		source := String streamContents: [:stream |
			stream
				nextPutAll: uniform; nextPut: $:; nextPutAll: ' anObject';
				cr; crtab;
				nextPutAll: 'self uniform: '; nextPutAll: uniform; nextPutAll: 'Location value: anObject'].
		self compile: source classified: 'generated'].
	
	self attributes do: [:attribute |
		source := String streamContents: [:stream |
			stream
				nextPutAll: attribute;
				nextPutAll: 'Location';
				cr; crtab;
				nextPutAll: '^ '; nextPutAll: attribute; nextPutAll: 'Location'].
		self compile: source classified: 'generated']
]

{
	#category : #'shader code',
	#timestamp : 'stlu 11/13/2020 16:39'
}
GLStaticProgram class >> fragmentShader [

	self subclassResponsibility
]

{
	#category : #'shader code',
	#timestamp : 'stlu 11/13/2020 16:40'
}
GLStaticProgram class >> uniforms [
	" return the names of all uniforms your shader possesses here "

	^ #()
]

{
	#category : #'shader code',
	#timestamp : 'stlu 11/13/2020 16:39'
}
GLStaticProgram class >> vertexShader [

	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 15:50'
}
GLStaticProgram >> initialize [

	super initialize.
	self initializeShaders.
	self initializeLocations
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 15:50'
}
GLStaticProgram >> initializeLocations [

	
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 15:50'
}
GLStaticProgram >> initializeShaders [

	{
		GLVertexShader create
			source: self class vertexShader withUnixLineEndings;
			compile;
			yourself.
		GLFragmentShader create
			source: self class fragmentShader withUnixLineEndings;
			compile;
			yourself
	} do: [:shader | self attachShader: shader].
	
	self link.
	
	shaders do: [:shader | shader delete]
]

{
	#category : #resources,
	#timestamp : 'stlu 11/13/2020 15:52'
}
GLStaticProgram >> registerAttribute: aString [

	| location |
	location := GL getAttribLocation: id with: aString.
	self assert: location >= 0.
	^ location
]

{
	#category : #resources,
	#timestamp : 'stlu 11/13/2020 15:52'
}
GLStaticProgram >> registerUniform: aString [

	| location |
	location := GL getUniformLocation: id with: aString.
	self assert: location >= 0.
	^ location
]

{
	#category : #resources,
	#timestamp : 'stlu 11/13/2020 15:51'
}
GLStaticProgram >> uniform: location value: anObject [

	self assert: location >= 0.
	anObject putAtUniform: location
]

{
	#category : #resources,
	#timestamp : 'stlu 11/13/2020 16:10'
}
GLStaticProgram >> vertexAttrib: index components: numComponents stride: byteStride offset: byteOffset [

	self flag: #todo. "Hacky and broken. Wild assumptions."
	GL enableVertexAttribArray: index.
	GL vertexAttribPointer: index
		with: numComponents
		with: GL_FLOAT "HACK until proper type dispatching"
		with: false
		with: byteStride
		with: (ExternalAddress new fromInteger: byteOffset)
]