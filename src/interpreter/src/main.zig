const std = @import("std");
const expect = std.testing.expect;

const Interpreter = @import("interpreter.zig").Interpreter;

const TestState = struct {
    arena: std.heap.ArenaAllocator,
    interpreter: Interpreter,

    pub fn deinit(self: *TestState) void {
        self.interpreter.deinit() catch std.debug.print("failed to deinit interpreter", .{});
        self.arena.deinit();
    }
};

fn setupTest() !TestState {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const allocator = arena.allocator();

    var bytecode = [_]u8{
        0x61, 0x02, 0x01, // PUSH 2
        0x60, 0x01, // PUSH 1
    };

    var interpreter = try Interpreter.init(allocator, &bytecode);

    return TestState{
        .arena = arena,
        .interpreter = interpreter,
    };
}

// INSTRUCTION TESTS
test "POP" {
    var testState = try setupTest();
    defer testState.deinit();

    try testState.interpreter.stack.push(1);
    try testState.interpreter.stack.push(2);

    try testState.interpreter.step(0x50);

    try expect(testState.interpreter.stack.pop() == 1);
}

test "PUSH N" {
    var testState = try setupTest();
    defer testState.deinit();

    try testState.interpreter.step(0x61);
    try testState.interpreter.step(0x60);
}

// STACK TESTS
test "stack" {
    var testState = try setupTest();
    defer testState.deinit();

    try testState.interpreter.stack.push(1);
    try testState.interpreter.stack.push(2);

    try expect(testState.interpreter.stack.pop() == 2);
    try expect(testState.interpreter.stack.pop() == 1);
}
