const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var inputs = std.ArrayList([]u8).init(allocator);

    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Enter words (empty line to finish):\n", .{});

    while (true) {
        var buffer: [100]u8 = undefined;
        const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

        if (input) |line| {
            if (line.len == 0) {
                break;
            }
            try inputs.append(try allocator.dupe(u8, line));
        } else {
            break;
        }
    }

    try stdout.print("\nYou entered:\n", .{});
    for (inputs.items) |word| {
        try stdout.print("{s}\n", .{word});
    }
}
