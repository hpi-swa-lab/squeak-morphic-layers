Class {
	#name : #VkGeneratedCommandsInfoNV,
	#superclass : #ExternalStructure,
	#category : #'Vulkan-Generated'
}

{ #category : #'as yet unclassified' }
VkGeneratedCommandsInfoNV class >> fields [

	^ #(
		(sType 'VkStructureType')
		(pNext 'void*')
		(pipelineBindPoint 'VkPipelineBindPoint')
		(pipeline 'VkPipeline')
		(indirectCommandsLayout 'VkIndirectCommandsLayoutNV')
		(streamCount 'uint32_t')
		(pStreams 'VkIndirectCommandsStreamNV*')
		(sequencesCount 'uint32_t')
		(preprocessBuffer 'VkBuffer')
		(preprocessOffset 'VkDeviceSize')
		(preprocessSize 'VkDeviceSize')
		(sequencesCountBuffer 'VkBuffer')
		(sequencesCountOffset 'VkDeviceSize')
		(sequencesIndexBuffer 'VkBuffer')
		(sequencesIndexOffset 'VkDeviceSize')
	)
]