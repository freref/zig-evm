// EVM opcode definitions
const std = @import("std");

const Interpreter = @import("../interpreter.zig").Interpreter;

const Stack = @import("stack.zig");

const OpcodeFunc = *const fn (interpreter: *Interpreter) void;

inline fn push(n: usize) OpcodeFunc {
    return struct {
        fn func(interpreter: *Interpreter) void {
            Stack.pushN(interpreter, n);
        }
    }.func;
}

pub const InstructionTable: [256]?OpcodeFunc = [_]?OpcodeFunc{
    null, // STOP = 0x00,
    //
    null, // ADD = 0x01,
    null, // MUL = 0x02,
    null, // SUB = 0x03,
    null, // DIV = 0x04,
    null, // SDIV = 0x05,
    null, // MOD = 0x06,
    null, // SMOD = 0x07,
    null, // ADDMOD = 0x08,
    null, // MULMOD = 0x09,
    null, // EXP = 0x0A,
    null, // SIGNEXTEND = 0x0B,
    null, // // 0x0C
    null, // // 0x0D
    null, // // 0x0E
    null, // // 0x0F
    null, // LT = 0x10,
    null, // GT = 0x11,
    null, // SLT = 0x12,
    null, // SGT = 0x13,
    null, // EQ = 0x14,
    null, // ISZERO = 0x15,
    null, // AND = 0x16,
    null, // OR = 0x17,
    null, // XOR = 0x18,
    null, // NOT = 0x19,
    null, // BYTE = 0x1A,
    null, // SHL = 0x1B,
    null, // SHR = 0x1C,
    null, // SAR = 0x1D,
    null, // // 0x1E
    null, // // 0x1F
    null, // KECCAK256 = 0x20,
    null, // // 0x21
    null, // // 0x22
    null, // // 0x23
    null, // // 0x24
    null, // // 0x25
    null, // // 0x26
    null, // // 0x27
    null, // // 0x28
    null, // // 0x29
    null, // // 0x2A
    null, // // 0x2B
    null, // // 0x2C
    null, // // 0x2D
    null, // // 0x2E
    null, // // 0x2F
    null, // ADDRESS = 0x30,
    null, // BALANCE = 0x31,
    null, // ORIGIN = 0x32,
    null, // CALLER = 0x33,
    null, // CALLVALUE = 0x34,
    null, // CALLDATALOAD = 0x35,
    null, // CALLDATASIZE = 0x36,
    null, // CALLDATACOPY = 0x37,
    null, // CODESIZE = 0x38,
    null, // CODECOPY = 0x39,
    //
    null, // GASPRICE = 0x3A,
    null, // EXTCODESIZE = 0x3B,
    null, // EXTCODECOPY = 0x3C,
    null, // RETURNDATASIZE = 0x3D,
    null, // RETURNDATACOPY = 0x3E,
    null, // EXTCODEHASH = 0x3F,
    null, // BLOCKHASH = 0x40,
    null, // COINBASE = 0x41,
    null, // TIMESTAMP = 0x42,
    null, // NUMBER = 0x43,
    null, // DIFFICULTY = 0x44,
    null, // GASLIMIT = 0x45,
    null, // CHAINID = 0x46,
    null, // SELFBALANCE = 0x47,
    null, // BASEFEE = 0x48,
    null, // BLOBHASH = 0x49,
    null, // BLOBBASEFEE = 0x4A,
    null, // // 0x4B
    null, // // 0x4C
    null, // // 0x4D
    null, // // 0x4E
    null, // // 0x4F
    Stack.pop, // POP = 0x50,
    null, // MLOAD = 0x51,
    null, // MSTORE = 0x52,
    null, // MSTORE8 = 0x53,
    null, // SLOAD = 0x54,
    null, // SSTORE = 0x55,
    null, // JUMP = 0x56,
    null, // JUMPI = 0x57,
    null, // PC = 0x58,
    null, // MSIZE = 0x59,
    null, // GAS = 0x5A,
    null, // JUMPDEST = 0x5B,
    null, // TLOAD = 0x5C,
    null, // TSTORE = 0x5D,
    null, // MCOPY = 0x5E,
    //
    null, // PUSH0 = 0x5F,
    push(1), // PUSH1 = 0x60,
    push(2), // PUSH2 = 0x61,
    push(3), // PUSH3 = 0x62,
    push(4), // PUSH4 = 0x63,
    push(5), // PUSH5 = 0x64,
    push(6), // PUSH6 = 0x65,
    push(7), // PUSH7 = 0x66,
    push(8), // PUSH8 = 0x67,
    push(9), // PUSH9 = 0x68,
    push(10), // PUSH10 = 0x69,
    push(11), // PUSH11 = 0x6A,
    push(12), // PUSH12 = 0x6B,
    push(13), // PUSH13 = 0x6C,
    push(14), // PUSH14 = 0x6D,
    push(15), // PUSH15 = 0x6E,
    push(16), // PUSH16 = 0x6F,
    push(17), // PUSH17 = 0x70,
    push(18), // PUSH18 = 0x71,
    push(19), // PUSH19 = 0x72,
    push(20), // PUSH20 = 0x73,
    push(21), // PUSH21 = 0x74,
    push(22), // PUSH22 = 0x75,
    push(23), // PUSH23 = 0x76,
    push(24), // PUSH24 = 0x77,
    push(25), // PUSH25 = 0x78,
    push(26), // PUSH26 = 0x79,
    push(27), // PUSH27 = 0x7A,
    push(28), // PUSH28 = 0x7B,
    push(29), // PUSH29 = 0x7C,
    push(30), // PUSH30 = 0x7D,
    push(31), // PUSH31 = 0x7E,
    push(32), // PUSH32 = 0x7F,
    //
    null, // DUP1 = 0x80,
    null, // DUP2 = 0x81,
    null, // DUP3 = 0x82,
    null, // DUP4 = 0x83,
    null, // DUP5 = 0x84,
    null, // DUP6 = 0x85,
    null, // DUP7 = 0x86,
    null, // DUP8 = 0x87,
    null, // DUP9 = 0x88,
    null, // DUP10 = 0x89,
    null, // DUP11 = 0x8A,
    null, // DUP12 = 0x8B,
    null, // DUP13 = 0x8C,
    null, // DUP14 = 0x8D,
    null, // DUP15 = 0x8E,
    null, // DUP16 = 0x8F,
    // null,
    null, // SWAP1 = 0x90,
    null, // SWAP2 = 0x91,
    null, // SWAP3 = 0x92,
    null, // SWAP4 = 0x93,
    null, // SWAP5 = 0x94,
    null, // SWAP6 = 0x95,
    null, // SWAP7 = 0x96,
    null, // SWAP8 = 0x97,
    null, // SWAP9 = 0x98,
    null, // SWAP10 = 0x99,
    null, // SWAP11 = 0x9A,
    null, // SWAP12 = 0x9B,
    null, // SWAP13 = 0x9C,
    null, // SWAP14 = 0x9D,
    null, // SWAP15 = 0x9E,
    null, // SWAP16 = 0x9F,
    //
    null, // LOG0 = 0xA0,
    null, // LOG1 = 0xA1,
    null, // LOG2 = 0xA2,
    null, // LOG3 = 0xA3,
    null, // LOG4 = 0xA4,
    null, // // 0xA5
    null, // // 0xA6
    null, // // 0xA7
    null, // // 0xA8
    null, // // 0xA9
    null, // // 0xAA
    null, // // 0xAB
    null, // // 0xAC
    null, // // 0xAD
    null, // // 0xAE
    null, // // 0xAF
    null, // // 0xB0
    null, // // 0xB1
    null, // // 0xB2
    null, // // 0xB3
    null, // // 0xB4
    null, // // 0xB5
    null, // // 0xB6
    null, // // 0xB7
    null, // // 0xB8
    null, // // 0xB9
    null, // // 0xBA
    null, // // 0xBB
    null, // // 0xBC
    null, // // 0xBD
    null, // // 0xBE
    null, // // 0xBF
    null, // // 0xC0
    null, // // 0xC1
    null, // // 0xC2
    null, // // 0xC3
    null, // // 0xC4
    null, // // 0xC5
    null, // // 0xC6
    null, // // 0xC7
    null, // // 0xC8
    null, // // 0xC9
    null, // // 0xCA
    null, // // 0xCB
    null, // // 0xCC
    null, // // 0xCD
    null, // // 0xCE
    null, // // 0xCF
    null, // // 0xD0
    null, // // 0xD1
    null, // // 0xD2
    null, // // 0xD3
    null, // // 0xD4
    null, // // 0xD5
    null, // // 0xD6
    null, // // 0xD7
    null, // // 0xD8
    null, // // 0xD9
    null, // // 0xDA
    null, // // 0xDB
    null, // // 0xDC
    null, // // 0xDD
    null, // // 0xDE
    null, // // 0xDF
    null, // // 0xE0
    null, // // 0xE1
    null, // // 0xE2
    null, // // 0xE3
    null, // // 0xE4
    null, // // 0xE5
    null, // // 0xE6
    null, // // 0xE7
    null, // // 0xE8
    null, // // 0xE9
    null, // // 0xEA
    null, // // 0xEB
    null, // // 0xEC
    null, // // 0xED
    null, // // 0xEE
    null, // // 0xEF
    null, // CREATE = 0xF0,
    null, // CALL = 0xF1,
    null, // CALLCODE = 0xF2,
    null, // RETURN = 0xF3,
    null, // DELEGATECALL = 0xF4,
    null, // CREATE2 = 0xF5,
    null, // // 0xF6
    null, // // 0xF7
    null, // // 0xF8
    null, // // 0xF9
    null, // STATICCALL = 0xFA,
    null, // // 0xFB
    null, // // 0xFC
    null, // REVERT = 0xFD,
    null, // INVALID = 0xFE,
    null, // SELFDESTRUCT = 0xFF,
};

//const Opcode = enum(u8) {
//    STOP = 0x00,
//
//    ADD = 0x01,
//    MUL = 0x02,
//    SUB = 0x03,
//    DIV = 0x04,
//    SDIV = 0x05,
//    MOD = 0x06,
//    SMOD = 0x07,
//    ADDMOD = 0x08,
//    MULMOD = 0x09,
//    EXP = 0x0A,
//    SIGNEXTEND = 0x0B,
//    // 0x0C
//    // 0x0D
//    // 0x0E
//    // 0x0F
//    LT = 0x10,
//    GT = 0x11,
//    SLT = 0x12,
//    SGT = 0x13,
//    EQ = 0x14,
//    ISZERO = 0x15,
//    AND = 0x16,
//    OR = 0x17,
//    XOR = 0x18,
//    NOT = 0x19,
//    BYTE = 0x1A,
//    SHL = 0x1B,
//    SHR = 0x1C,
//    SAR = 0x1D,
//    // 0x1E
//    // 0x1F
//    KECCAK256 = 0x20,
//    // 0x21
//    // 0x22
//    // 0x23
//    // 0x24
//    // 0x25
//    // 0x26
//    // 0x27
//    // 0x28
//    // 0x29
//    // 0x2A
//    // 0x2B
//    // 0x2C
//    // 0x2D
//    // 0x2E
//    // 0x2F
//    ADDRESS = 0x30,
//    BALANCE = 0x31,
//    ORIGIN = 0x32,
//    CALLER = 0x33,
//    CALLVALUE = 0x34,
//    CALLDATALOAD = 0x35,
//    CALLDATASIZE = 0x36,
//    CALLDATACOPY = 0x37,
//    CODESIZE = 0x38,
//    CODECOPY = 0x39,
//
//    GASPRICE = 0x3A,
//    EXTCODESIZE = 0x3B,
//    EXTCODECOPY = 0x3C,
//    RETURNDATASIZE = 0x3D,
//    RETURNDATACOPY = 0x3E,
//    EXTCODEHASH = 0x3F,
//    BLOCKHASH = 0x40,
//    COINBASE = 0x41,
//    TIMESTAMP = 0x42,
//    NUMBER = 0x43,
//    DIFFICULTY = 0x44,
//    GASLIMIT = 0x45,
//    CHAINID = 0x46,
//    SELFBALANCE = 0x47,
//    BASEFEE = 0x48,
//    BLOBHASH = 0x49,
//    BLOBBASEFEE = 0x4A,
//    // 0x4B
//    // 0x4C
//    // 0x4D
//    // 0x4E
//    // 0x4F
//    POP = 0x50,
//    MLOAD = 0x51,
//    MSTORE = 0x52,
//    MSTORE8 = 0x53,
//    SLOAD = 0x54,
//    SSTORE = 0x55,
//    JUMP = 0x56,
//    JUMPI = 0x57,
//    PC = 0x58,
//    MSIZE = 0x59,
//    GAS = 0x5A,
//    JUMPDEST = 0x5B,
//    TLOAD = 0x5C,
//    TSTORE = 0x5D,
//    MCOPY = 0x5E,
//
//    PUSH0 = 0x5F,
//    PUSH1 = 0x60,
//    PUSH2 = 0x61,
//    PUSH3 = 0x62,
//    PUSH4 = 0x63,
//    PUSH5 = 0x64,
//    PUSH6 = 0x65,
//    PUSH7 = 0x66,
//    PUSH8 = 0x67,
//    PUSH9 = 0x68,
//    PUSH10 = 0x69,
//    PUSH11 = 0x6A,
//    PUSH12 = 0x6B,
//    PUSH13 = 0x6C,
//    PUSH14 = 0x6D,
//    PUSH15 = 0x6E,
//    PUSH16 = 0x6F,
//    PUSH17 = 0x70,
//    PUSH18 = 0x71,
//    PUSH19 = 0x72,
//    PUSH20 = 0x73,
//    PUSH21 = 0x74,
//    PUSH22 = 0x75,
//    PUSH23 = 0x76,
//    PUSH24 = 0x77,
//    PUSH25 = 0x78,
//    PUSH26 = 0x79,
//    PUSH27 = 0x7A,
//    PUSH28 = 0x7B,
//    PUSH29 = 0x7C,
//    PUSH30 = 0x7D,
//    PUSH31 = 0x7E,
//    PUSH32 = 0x7F,
//
//    DUP1 = 0x80,
//    DUP2 = 0x81,
//    DUP3 = 0x82,
//    DUP4 = 0x83,
//    DUP5 = 0x84,
//    DUP6 = 0x85,
//    DUP7 = 0x86,
//    DUP8 = 0x87,
//    DUP9 = 0x88,
//    DUP10 = 0x89,
//    DUP11 = 0x8A,
//    DUP12 = 0x8B,
//    DUP13 = 0x8C,
//    DUP14 = 0x8D,
//    DUP15 = 0x8E,
//    DUP16 = 0x8F,
//
//    SWAP1 = 0x90,
//    SWAP2 = 0x91,
//    SWAP3 = 0x92,
//    SWAP4 = 0x93,
//    SWAP5 = 0x94,
//    SWAP6 = 0x95,
//    SWAP7 = 0x96,
//    SWAP8 = 0x97,
//    SWAP9 = 0x98,
//    SWAP10 = 0x99,
//    SWAP11 = 0x9A,
//    SWAP12 = 0x9B,
//    SWAP13 = 0x9C,
//    SWAP14 = 0x9D,
//    SWAP15 = 0x9E,
//    SWAP16 = 0x9F,
//
//    LOG0 = 0xA0,
//    LOG1 = 0xA1,
//    LOG2 = 0xA2,
//    LOG3 = 0xA3,
//    LOG4 = 0xA4,
//    // 0xA5
//    // 0xA6
//    // 0xA7
//    // 0xA8
//    // 0xA9
//    // 0xAA
//    // 0xAB
//    // 0xAC
//    // 0xAD
//    // 0xAE
//    // 0xAF
//    // 0xB0
//    // 0xB1
//    // 0xB2
//    // 0xB3
//    // 0xB4
//    // 0xB5
//    // 0xB6
//    // 0xB7
//    // 0xB8
//    // 0xB9
//    // 0xBA
//    // 0xBB
//    // 0xBC
//    // 0xBD
//    // 0xBE
//    // 0xBF
//    // 0xC0
//    // 0xC1
//    // 0xC2
//    // 0xC3
//    // 0xC4
//    // 0xC5
//    // 0xC6
//    // 0xC7
//    // 0xC8
//    // 0xC9
//    // 0xCA
//    // 0xCB
//    // 0xCC
//    // 0xCD
//    // 0xCE
//    // 0xCF
//    // 0xD0
//    // 0xD1
//    // 0xD2
//    // 0xD3
//    // 0xD4
//    // 0xD5
//    // 0xD6
//    // 0xD7
//    // 0xD8
//    // 0xD9
//    // 0xDA
//    // 0xDB
//    // 0xDC
//    // 0xDD
//    // 0xDE
//    // 0xDF
//    // 0xE0
//    // 0xE1
//    // 0xE2
//    // 0xE3
//    // 0xE4
//    // 0xE5
//    // 0xE6
//    // 0xE7
//    // 0xE8
//    // 0xE9
//    // 0xEA
//    // 0xEB
//    // 0xEC
//    // 0xED
//    // 0xEE
//    // 0xEF
//    CREATE = 0xF0,
//    CALL = 0xF1,
//    CALLCODE = 0xF2,
//    RETURN = 0xF3,
//    DELEGATECALL = 0xF4,
//    CREATE2 = 0xF5,
//    // 0xF6
//    // 0xF7
//    // 0xF8
//    // 0xF9
//    STATICCALL = 0xFA,
//    // 0xFB
//    // 0xFC
//    REVERT = 0xFD,
//    INVALID = 0xFE,
//    SELFDESTRUCT = 0xFF,
//};
