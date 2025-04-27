const std = @import("std");

pub fn main() void {
    const stdout = std.io.getStdOut().writer();

    var i: i32 = 1;
    while (i <= 10) : (i += 1) {
        stdout.print("{}\n", .{i}) catch {};
    }
}
