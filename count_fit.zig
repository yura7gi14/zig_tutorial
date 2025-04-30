const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    // ランダムなバイトを作る
    var random_bytes: [4]u8 = undefined;
    std.crypto.random.bytes(&random_bytes);

    // 1バイト（0〜255）だけを使う！
    const answer = @as(i32, random_bytes[0] % 100);

    var attempts: u32 = 0;

    try stdout.print("I'm thinking of a number between 0 and 99!\n", .{});

    while (true) {
        try stdout.print("Enter your guess: ", .{});

        var buffer: [10]u8 = undefined;
        const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n');
        if (input) |line| {
            const guess = std.fmt.parseInt(i32, line, 10) catch {
                try stdout.print("Please enter a valid number!\n", .{});
                continue;
            };

            attempts += 1;

            if (guess < answer) {
                try stdout.print("Too small!\n", .{});
            } else if (guess > answer) {
                try stdout.print("Too big!\n", .{});
            } else {
                try stdout.print("Correct! You guessed it in {} tries!\n", .{attempts});
                break;
            }
        } else {
            break;
        }
    }
}
