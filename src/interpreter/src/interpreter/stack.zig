const std = @import("std");
const expect = std.testing.expect;

pub fn Stack(comptime T: type) type {
    return struct {
        const Self = @This();
        const MAX_STACK_SIZE: usize = 1024;

        stack: std.ArrayList(T),

        pub fn init(alloc: std.mem.Allocator) !Self {
            var stack = try std.ArrayList(T).initCapacity(alloc, MAX_STACK_SIZE);
            return .{
                .stack = stack,
            };
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

test "stack" {
    // Initialize a stack for integers
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();

    var stack = try Stack(u256).init(allocator);

    // Test pushing elements
    try stack.push(10);
    try stack.push(20);

    // Test popping elements
    try expect(stack.pop() == 20);
    try expect(stack.pop() == 10);
}
