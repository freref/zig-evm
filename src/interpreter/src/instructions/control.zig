const Interpreter = @import("../interpreter.zig").Interpreter;
const InstructionResult = @import("../instruction_result.zig").InstructionResult;

const OpcodeFunc = *const fn (interpreter: *Interpreter) void;

pub inline fn stop() OpcodeFunc {
    return struct {
        fn func(interpreter: *Interpreter) void {
            interpreter.instruction_result = InstructionResult.Stop;
        }
    }.func;
}
