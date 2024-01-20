const std = @import("std");
const expect = std.testing.expect;

pub fn Stack(comptime T: type) type {
    return struct {
        const Self = @This();
        const MAX_STACK_SIZE: usize = 1024;

        stack: std.ArrayList(T),
        alloc: std.mem.Allocator,

        pub fn init(alloc: std.mem.Allocator) !Self {
            var stack = try std.ArrayList(T).initCapacity(alloc, MAX_STACK_SIZE);
            return .{
                .stack = stack,
                .alloc = alloc,
            };
        }

        pub fn deinit(self: *Self) !void {
            self.stack.deinit();
        }

        // Pushes an element to the top of the stack
        pub fn push(self: *Self, value: T) !void {
            return try self.stack.append(value);
        }

        // Removes top most element from the stack and integer overflow if the stack is empty
        pub fn pop(self: *Self) T {
            return self.stack.pop();
        }
    };
}
