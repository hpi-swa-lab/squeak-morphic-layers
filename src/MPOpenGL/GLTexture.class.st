Class {
	#name : #GLTexture,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#pools : [
		'GLConstants'
	],
	#category : 'MPOpenGL-Core'
}

{ #category : #binding }
GLTexture >> bind [

	GL value glBindTexture: GL_TEXTURE_2D with: id.
	GL value checkForError
]

{ #category : #deletion }
GLTexture >> delete [

	|texIDs|
	texIDs := IntegerArray with: id.
	GL value glDeleteTextures: 1 with: texIDs.
	GL value checkForError.
]

{ #category : #accessing }
GLTexture >> id [
	^id
]

{ #category : #initialization }
GLTexture >> initialize [

	| texIDs |
	texIDs := IntegerArray new: 1.
	GL value glGenTextures: 1 with: texIDs.
	GL value checkForError.
	id := texIDs at: 1.
]

{ #category : #accessing }
GLTexture >> texImage: aForm [

	self bind.
	
	GL value
		glTexImage2D: GL_TEXTURE_2D
		with: 0
		with: GL_RGBA
		with: aForm width
		with: aForm height
		with: 0
		with: GL_BGRA
		with: GL_UNSIGNED_BYTE
		with: (aForm asFormOfDepth: 32) bits.
	GL value checkForError.
	
	GL value glTexParameteri: GL_TEXTURE_2D
		with: GL_TEXTURE_MIN_FILTER
		with: GL_LINEAR.
	GL value glTexParameteri: GL_TEXTURE_2D
		with: GL_TEXTURE_MAG_FILTER
		with: GL_LINEAR.
	
	self unbind
]

{ #category : #accessing }
GLTexture >> texImageExtent: aPoint [

	self bind.
	
	GL value
		glTexImage2D: GL_TEXTURE_2D
		with: 0
		with: GL_RGBA
		with: aPoint x
		with: aPoint y
		with: 0
		with: GL_BGRA
		with: GL_UNSIGNED_BYTE
		with: nil.
	GL value checkForError.
	
	GL value glTexParameteri: GL_TEXTURE_2D
		with: GL_TEXTURE_MIN_FILTER
		with: GL_LINEAR.
	GL value glTexParameteri: GL_TEXTURE_2D
		with: GL_TEXTURE_MAG_FILTER
		with: GL_LINEAR.
	
	self unbind
]

{ #category : #binding }
GLTexture >> unbind [

	GL value glBindTexture: GL_TEXTURE_2D with: 0.
	GL value checkForError
]