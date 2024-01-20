const std = @import("std");

const Interpreter = @import("../interpreter.zig").Interpreter;

pub fn pop(interpreter: *Interpreter) void {
    _ = interpreter.stack.pop();
}

pub fn push(interpreter: *Interpreter, n: usize) void {
    _ = interpreter;
    // Implement the PUSHN logic here
    std.debug.print("PUSH{d} called\n", .{n});
}
