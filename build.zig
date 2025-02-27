const std = @import("std");

pub fn build(b: *std.Build) void {
    var lib = b.addStaticLibrary(.{
        .name = "tree-sitter",
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });
    lib.linkLibC();
    lib.addCSourceFile(.{ .file = .{ .path = "lib/src/lib.c" }, .flags = &.{} });
    lib.addIncludePath(.{ .path = "lib/include" });
    lib.addIncludePath(.{ .path = "lib/src" });
    lib.installHeadersDirectory("lib/include/tree_sitter", "tree_sitter");
    b.installArtifact(lib);
}
