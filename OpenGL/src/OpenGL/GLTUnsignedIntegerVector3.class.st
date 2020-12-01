Class {
	#name : #GLTUnsignedIntegerVector3,
	#superclass : #GLTVector,
	#category : #'OpenGL-Wrappers-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 17:57'
}
GLTUnsignedIntegerVector3 class >> componentType [

	^ GLTUnsignedInteger
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 17:57'
}
GLTUnsignedIntegerVector3 class >> declarators [

	^ #('uvec3')
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 17:57'
}
GLTUnsignedIntegerVector3 class >> enum [

	^ GL_UNSIGNED_INT_VEC3
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 17:57'
}
GLTUnsignedIntegerVector3 class >> enumName [

	^ 'UNSIGNED_INT_VEC3'
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 17:57'
}
GLTUnsignedIntegerVector3 class >> numComponents [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 17:57'
}
GLTUnsignedIntegerVector3 class >> squeakName [

	^ 'UnsignedIntegerVector3'
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/19/2020 07:37'
}
GLTUnsignedIntegerVector3 >> numComponents [

	^ 3
]