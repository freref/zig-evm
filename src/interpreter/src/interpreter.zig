const std = @import("std");
const expect = std.testing.expect;

const Stack = @import("interpreter/stack.zig").Stack;
const InstructionTable = @import("instructions/opcode.zig").InstructionTable;

pub const Interpreter = struct {
    const Self = @This();

    alloc: std.mem.Allocator,
    stack: Stack(u256),

    pub fn init(alloc: std.mem.Allocator) !Self {
        return .{
            .alloc = alloc,
            .stack = try Stack(u256).init(alloc),
        };
    }

    pub fn deinit(self: *Self) !void {
        try self.stack.deinit();
    }

    // TODO: add null optimization
    pub fn step(self: *Self, comptime op: u8) !void {
        const opcodeFunc = InstructionTable[op];
        if (opcodeFunc) |func| {
            func(self);
        } else {
            unreachable;
        }
    }
};
