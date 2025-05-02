const std = @import("std");

pub fn main() !void {
    //const allocator = std.heap.page_allocator;
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    var file = try std.fs.cwd().createFile("memo.txt", .{ .read = true });
    defer file.close();

    var writer = file.writer();

    try stdout.print("メモしたい内容を入力してください(endと打つと終了します): \n", .{});

    while (true) {
        var buffer: [100]u8 = undefined;
        const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

        if (input) |line| {
            if (std.mem.eql(u8, line, "end")) {
                try stdout.print("保存して終了します\n", .{});
                break;
            }

            //ファイルに書き込み
            try writer.print("{s}\n", .{line});
        } else {
            break;
        }
    }
}
