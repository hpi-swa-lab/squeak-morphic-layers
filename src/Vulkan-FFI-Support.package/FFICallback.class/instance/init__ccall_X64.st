initialization - thunk prepare
init__ccall_X64
	<abi: 'X64'> <init>
	"Initialize the receiver with a __ccall thunk.  The thunk calls thunkEntry in the IA32ABI plugin,
	 whose source is in platforms/Cross/plugins/IA32ABI/x64sysvabicc.c.  thunkEntry is the entry point
	 for Callbacks. The objective of the thunk is to call thunkEntry with all arguments to the call of the
	 thunk (registers and stack) as well as a pointer to the thunk itself.  thunkEntry is as follows:

		long
		thunkEntry(long a0, long a1, long a2, long a3, long a4, long a5,
		            double d0, double d1, double d2, double d3,
		            double d4, double d5, double d6, double d7,
		            void *thunkp, sqIntptr_t *stackp)

	thunkEntry then collects the various arguments (thunk, integer register arguments, floating-point
	register arguments, stack pointer) in a VMCallbackContext and invokes the callback via invokeCallbackContext:."

	"thunk+0x0:	pushq  %rsp							54
	 thunk+0x1:	pushq  %rsp							54
	 thunk+0x4:	movabsq $thunk, %rax					48 b8 b0..b7 eight bytes of thunk address a.k.a. handle
	 thunk+0xc:	pushq  %rax							50
	 thunk+0xd:	movabsq $thunkEntry, %rax			48 b8 b0..b7 eight bytes of the thunkEntry address
	 thunk+0x17:	callq  *%rax							ff d0
	 thunk+0x19:	addq   $0x18, %rsp					48 83 c4 18
	 thunk+0x1d:	retq									c3
	 thunk+0x1e:	nop										90
	 thunk+0x1f:	nop										90"
	thunk getHandle
		unsignedLongAt:		  1 put: 16rb8485454;
		longPointerAt:			  5 put: thunk getHandle;
		unsignedLongAt:		13 put: 16r00b84850; "00 is the first byte of the 64-bit constant the movabsq/0x48 opcode moves"
		longPointerAt:			16 put: self thunkEntryAddress;
		unsignedByteAt:		24 put: 16rff;
		unsignedLongAt:		25 put: 16rc48348d0;
		unsignedLongAt:		29 put: 16r9090c318.