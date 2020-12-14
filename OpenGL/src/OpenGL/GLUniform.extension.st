Extension { #name : #GLUniform }

{
	#category : #'*OpenGL-Wrappers-CodeGeneration',
	#timestamp : 'stlu 12/14/2020 14:22'
}
GLUniform class >> arraySetterTemplate [

	^ 'setTo{1}Component{4}Array: {2} count: numElements

	stateAccessImp set: self to{1}Component{4}Array: {2} count: numElements'
]

{
	#category : #'*OpenGL-Wrappers-CodeGeneration',
	#timestamp : 'stlu 12/14/2020 14:06'
}
GLUniform class >> generateSetterInferface [

	GLUniformStateAccessImp generateArrayInterfaceFor: self classified: #'setting - arrays'.
	GLUniformStateAccessImp generateMatrixInterfaceFor: self classified: #'setting - matrices'.
	GLUniformStateAccessImp generateScalarInterfaceFor: self classified: #'setting - scalars'
]

{
	#category : #'*OpenGL-Wrappers-CodeGeneration',
	#timestamp : 'stlu 12/14/2020 14:22'
}
GLUniform class >> matrixSetterTemplate [

	^ 'setTo{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	stateAccessImp
		set: self
		to{1}Matrices{2}x{3}: {4}
		count: numMatrices
		transpose: isRowMajor'
]

{
	#category : #'*OpenGL-Wrappers-CodeGeneration',
	#timestamp : 'stlu 12/14/2020 14:22'
}
GLUniform class >> scalarSetterTemplate [

	^ 'setTo{1}: {2}

	stateAccessImp set: self to{1}: {2}'
]