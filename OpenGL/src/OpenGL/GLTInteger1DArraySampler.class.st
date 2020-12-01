Class {
	#name : #GLTInteger1DArraySampler,
	#superclass : #GLTSampler,
	#category : #'OpenGL-Wrappers-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:49'
}
GLTInteger1DArraySampler class >> declarators [

	^ #('isampler1DArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:49'
}
GLTInteger1DArraySampler class >> enum [

	^ GL_INT_SAMPLER_1D_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:49'
}
GLTInteger1DArraySampler class >> enumName [

	^ 'INT_SAMPLER_1D_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:49'
}
GLTInteger1DArraySampler class >> squeakName [

	^ 'Integer1DArraySampler'
]