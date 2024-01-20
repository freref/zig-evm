// Stack wrapper for instructions
const std = @import("std");

const Interpreter = @import("../interpreter.zig").Interpreter;

pub fn pop(interpreter: *Interpreter) void {
    _ = interpreter.stack.pop();
}

pub fn push(interpreter: *Interpreter, n: usize) !void {
    var value = [1]u8{0} ** 32;
    @memcpy(value[32 - n ..], interpreter.instruction_pointer[1..][0..n]);

    var x: u256 = std.mem.readInt(u256, &value, .Big);

    try interpreter.stack.push(x);

    interpreter.instruction_pointer += n;
}
