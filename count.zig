const std = @import("std");

pub fn main() void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buffer: [100]u8 = undefined;
    stdout.print("Enter a number: ", .{}) catch {};
    const input = stdin.readUntilDelimiterOrEof(&buffer, '\n') catch null;

    if (input) |line| {
        const number = std.fmt.parseInt(i32, line, 10) catch 0;
        stdout.print("Double: {}\n", .{number * 2}) catch {};
    }
}
