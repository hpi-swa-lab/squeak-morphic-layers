Class {
	#name : #GLTInteger2DMultisampleArrayImage,
	#superclass : #GLTImage,
	#category : #'OpenGL-Wrappers-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:48'
}
GLTInteger2DMultisampleArrayImage class >> declarators [

	^ #('iimage2DMSArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:48'
}
GLTInteger2DMultisampleArrayImage class >> enum [

	^ GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:48'
}
GLTInteger2DMultisampleArrayImage class >> enumName [

	^ 'INT_IMAGE_2D_MULTISAMPLE_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:48'
}
GLTInteger2DMultisampleArrayImage class >> squeakName [

	^ 'Integer2DMultisampleArrayImage'
]