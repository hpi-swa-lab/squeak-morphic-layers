Class {
	#name : #CustomOpenGLTest,
	#superclass : #CustomOpenGLParentTestCase,
	#category : 'MPOpenGL-Test'
}

{ #category : #'before each' }
CustomOpenGLTest >> setUp [
	self setUpWindow 
]

{ #category : #'before each' }
CustomOpenGLTest >> setUpWindow [
	ogl := GL3_3 newInGLFW: (Rectangle origin: 0@0 extent: 640@480).
	GLFW makeContextCurrent: ogl glfwWindow.

]

{ #category : #'after each' }
CustomOpenGLTest >> tearDown [
	self tearDownWindow
]

{ #category : #'after each' }
CustomOpenGLTest >> tearDownWindow [
	ogl destroy.
]

{ #category : #testing }
CustomOpenGLTest >> testWindow [
	| frames startTime deltaTime framesPerSec program vbo vao mvp tex ver |
	frames := 0.
	startTime := Time millisecondClockValue.
	tex := OGLTexture new
				form: (Display
						copy: (0 @ 0 extent: 1000 @ 1000)).
	program := GLProgram newFor: ogl shaders: {VertexShader file: 'blur.vs'. FragmentShader file: 'blur.fs'}.
	ogl checkForError.
	vao := GLVertexArrayObject newFor: ogl.
	vao bind: ogl.
	vbo := GLBuffer newFor: ogl.
	vbo
		data: {
			-1. -1. 0 . 0 .
			1.  -1. 0 . 1 .
			-1. 1. 1 . 0	.
			1.   1. 1 . 1
		} asFloatArray
		usage: ogl GL_STATIC_DRAW
		componentsPerVertex: 4.
	ogl glDisable: ogl GL_CULL_FACE.
	ogl checkForError.
	[Sensor anyButtonPressed]
		whileFalse: ["start counting at second frame si------**nce first frame is
			penalized by the upload of the bitmap font outside of ogl."
			frames = 1
				ifTrue: [startTime := Time millisecondClockValue].
			ogl beginFrame.
			ogl checkForError.
			ogl installTexture: tex.
			"uploads only in first frame"
			ogl checkForError.
			ogl enableTexture: tex.
			ogl checkForError.
			"--- this is the actual scene content ---"
			ogl glDisable: ogl GL_DEPTH_TEST.
			"for the simple example only"
			ogl
				glClearColor: 0.0
				with: 0.0
				with: 1.0
				with: 1.0.
			ogl glClear: ogl GL_COLOR_BUFFER_BIT.
			ogl checkForError.
			program use.
			ogl checkForError.
			vao bind: ogl.
			ogl glBindBuffer: ogl GL_ARRAY_BUFFER with: vbo id.
			ogl checkForError.
			program vertexAttib: 0 value: vbo stride: 4 offset: 0.
			ogl checkForError.
			program vertexAttib: 1 value: vbo stride: 4 offset: 2.
			ogl checkForError.
			program
				uniform: 0
				value: (Matrix rotateZBy: (Float pi / 2) rounded).
			"program uniform: 0 value: (Matrix identity: 4)."
			ogl checkForError.
			vbo draw: ogl GL_TRIANGLE_STRIP.
			ogl checkForError.
			
			
			"--- here is the 2d overlay setup ---"
			mvp := (Matrix scaleX: 2.0 / 640 y: -2.0 / 480)
						+* (Matrix translateX: -1 y: 1).
			"--- here is the 2d overlay rendering ---"
			deltaTime := Time millisecondsSince: startTime.
			framesPerSec := frames * 1000 / (deltaTime max: 1) asFloat.
			"@@@@: Fixme. It appears as if #drawString: depends on
			glColor being set.
			Makes no sense but I'm not going to figure this out - probably
			some mishap
			wrt. GLLighting being disabled."
			"ogl glColor3f: 0.0 with: 0.0 with: 0.0.
			ogl drawString: frames printString, ' frames: ', (framesPerSec
			truncateTo: 0.1), ' fps'
			at: 0@font height@0 font: font color: Color black."
			ogl checkForError.
			ogl glDisable: ogl GL_BLEND.
			"--- end the end frame operations"
			ogl endFrame.
			ogl swapBuffers.
			ogl checkForError.
			frames := frames + 1].

	ogl glClearColor: 0 with: 1 with: 0 with: 1.
	ogl glClear: ogl GL_COLOR_BUFFER_BIT.
	ver := ogl glGetString: ogl GL_VERSION.
	"then"
	Transcript show: ver; cr.
	ver isKindOf: String
]