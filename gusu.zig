const std = @import("std");

pub fn main() void {
    const stdout = std.io.getStdOut().writer();
    const n: i32 = 7;

    if (n % 2 == 0) {
        stdout.print("{d} is even\n", .{n}) catch {};
    } else {
        stdout.print("{d} is odd\n", .{n}) catch {};
    }
}
