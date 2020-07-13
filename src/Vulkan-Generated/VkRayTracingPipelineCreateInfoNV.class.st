Class {
	#name : #VkRayTracingPipelineCreateInfoNV,
	#superclass : #ExternalStructure,
	#category : #'Vulkan-Generated'
}

{ #category : #'as yet unclassified' }
VkRayTracingPipelineCreateInfoNV class >> fields [

	^ #(
		(sType 'VkStructureType')
		(pNext 'void*')
		(flags 'VkPipelineCreateFlags')
		(stageCount 'uint32_t')
		(pStages 'VkPipelineShaderStageCreateInfo*')
		(groupCount 'uint32_t')
		(pGroups 'VkRayTracingShaderGroupCreateInfoNV*')
		(maxRecursionDepth 'uint32_t')
		(layout 'VkPipelineLayout')
		(basePipelineHandle 'VkPipeline')
		(basePipelineIndex 'int32_t')
	)
]