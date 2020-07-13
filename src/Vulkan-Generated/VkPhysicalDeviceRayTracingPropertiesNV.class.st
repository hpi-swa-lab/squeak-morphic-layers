Class {
	#name : #VkPhysicalDeviceRayTracingPropertiesNV,
	#superclass : #ExternalStructure,
	#category : #'Vulkan-Generated'
}

{ #category : #'as yet unclassified' }
VkPhysicalDeviceRayTracingPropertiesNV class >> fields [

	^ #(
		(sType 'VkStructureType')
		(pNext 'void*')
		(shaderGroupHandleSize 'uint32_t')
		(maxRecursionDepth 'uint32_t')
		(maxShaderGroupStride 'uint32_t')
		(shaderGroupBaseAlignment 'uint32_t')
		(maxGeometryCount 'uint64_t')
		(maxInstanceCount 'uint64_t')
		(maxTriangleCount 'uint64_t')
		(maxDescriptorSetAccelerationStructures 'uint32_t')
	)
]