Class {
	#name : #GLSLUnsignedInteger,
	#superclass : #GLSLScalar,
	#category : #'OpenGL-Wrappers-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> commandInitials [

	^ 'ui'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> componentType [

	^ GLSLUnsignedInteger
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> declarators [

	^ #('uint' 'unsigned int')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> enum [

	^ GL_UNSIGNED_INT
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> enumName [

	^ 'UNSIGNED_INT'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> glslInitials [

	^ 'u'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> squeakArrayClass [

	^ WordArray
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> squeakName [

	^ 'UnsignedInteger'
]

{
	#category : #'program resources',
	#timestamp : 'stlu 11/23/2020 17:11'
}
GLSLUnsignedInteger >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentUnsignedIntegerArray: aRawBitsArray count: numElements
]