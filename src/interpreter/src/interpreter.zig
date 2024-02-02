const std = @import("std");
const expect = std.testing.expect;

const Stack = @import("interpreter/stack.zig").Stack;
const InstructionTable = @import("instructions/opcode.zig").InstructionTable;
const InstructionResult = @import("instruction_result.zig").InstructionResult;

pub const Interpreter = struct {
    const Self = @This();

    alloc: std.mem.Allocator,
    stack: Stack(),
    instruction_pointer: [*]u8,
    bytecode: []u8,
    instruction_result: InstructionResult,

    pub fn init(alloc: std.mem.Allocator, bytecode: []u8) !Self {
        return .{
            .alloc = alloc,
            .stack = try Stack().init(alloc),
            .instruction_pointer = bytecode.ptr,
            .bytecode = bytecode,
            .instruction_result = InstructionResult.Continue,
        };
    }

    pub fn deinit(self: *Self) !void {
        try self.stack.deinit();
    }

    pub fn run(self: *Self) InstructionResult {
        while (self.instruction_result == InstructionResult.Continue) {
            const opcode = self.bytecode[self.instruction_pointer];
            self.step(opcode);
        }
        return self.instruction_result;
    }

    // TODO: add null optimization
    pub fn step(self: *Self, comptime op: u8) !void {
        const opcodeFunc = InstructionTable[op];
        if (opcodeFunc) |func| {
            func(self);
        } else {
            unreachable;
        }
        self.instruction_pointer += 1;
    }
};
