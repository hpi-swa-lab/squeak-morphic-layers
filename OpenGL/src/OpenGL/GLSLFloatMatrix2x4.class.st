Class {
	#name : #GLSLFloatMatrix2x4,
	#superclass : #GLSLMatrix,
	#category : #'OpenGL-Wrappers-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:48'
}
GLSLFloatMatrix2x4 class >> componentType [

	^ GLSLFloat
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:48'
}
GLSLFloatMatrix2x4 class >> declarators [

	^ #('mat2x4')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:48'
}
GLSLFloatMatrix2x4 class >> enum [

	^ GL_FLOAT_MAT2x4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:48'
}
GLSLFloatMatrix2x4 class >> enumName [

	^ 'FLOAT_MAT2x4'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:48'
}
GLSLFloatMatrix2x4 class >> numColumns [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:48'
}
GLSLFloatMatrix2x4 class >> numRows [

	^ 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:48'
}
GLSLFloatMatrix2x4 class >> squeakName [

	^ 'FloatMatrix2x4'
]