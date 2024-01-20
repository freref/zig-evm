pub const Contract = struct {
    const Self = @This();

    bytecode: []u8,

    pub fn init(bytecode: []u8) !Self {
        return .{
            .bytecode = bytecode,
        };
    }
};
