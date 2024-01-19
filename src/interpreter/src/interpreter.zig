const std = @import("std");
const expect = std.testing.expect;

const Stack = @import("interpreter/stack.zig").Stack;
const InstructionTable = @import("instructions/opcode.zig").InstructionTable;

pub const Interpreter = struct {
    const Self = @This();

    alloc: std.mem.Allocator,
    stack: Stack(u256),

    fn init(alloc: std.mem.Allocator) !Self {
        return .{
            .alloc = alloc,
            .stack = try Stack(u256).init(alloc),
        };
    }

    // TODO: add null optimization
    fn step(self: *Self, comptime op: u8) !void {
        const opcodeFunc = InstructionTable[op];
        if (opcodeFunc) |func| {
            func(self);
        } else {
            unreachable;
        }
    }
};

test "POP" {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();

    var interpreter = try Interpreter.init(allocator);

    try interpreter.stack.push(1);
    try interpreter.stack.push(2);

    try interpreter.step(0x50);

    try expect(interpreter.stack.pop() == 1);
}

test "PUSHN" {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();

    var interpreter = try Interpreter.init(allocator);

    try interpreter.step(0x61);
}
