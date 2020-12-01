Class {
	#name : #GLTUnsignedIntegerCubeSampler,
	#superclass : #GLTSampler,
	#category : #'OpenGL-Wrappers-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:49'
}
GLTUnsignedIntegerCubeSampler class >> declarators [

	^ #('usamplerCube')
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:49'
}
GLTUnsignedIntegerCubeSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_CUBE
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:49'
}
GLTUnsignedIntegerCubeSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_CUBE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:49'
}
GLTUnsignedIntegerCubeSampler class >> squeakName [

	^ 'UnsignedIntegerCubeSampler'
]