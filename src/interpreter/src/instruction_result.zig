pub const InstructionResult = enum {
    Stop,
    Continue,
    OutOfGas,
    StackUnderflow,
    StackOverflow,
};
