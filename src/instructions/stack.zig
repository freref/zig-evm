// Stack wrapper for instructions
const std = @import("std");

const Interpreter = @import("../interpreter.zig").Interpreter;

const OpcodeFunc = *const fn (interpreter: *Interpreter) void;

pub fn pop(interpreter: *Interpreter) void {
    _ = interpreter.stack.pop();
}

pub inline fn push(n: usize) OpcodeFunc {
    return struct {
        fn func(interpreter: *Interpreter) void {
            var value = [1]u8{0} ** 32;

            @memcpy(value[32 - n ..], interpreter.instruction_pointer[1..][0..n]);

            const x: u256 = std.mem.readInt(u256, &value, .big);

            interpreter.stack.push(x) catch unreachable;

            interpreter.instruction_pointer += n;
        }
    }.func;
}
