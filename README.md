# MoonBit-Brainfuck 

This is a Brainfuck interpreter written in MoonBit created for learning purposes.

You can clone the repository and run it with the following command:

```bash
moon run main
```

It is also available as a library on mooncakes.io.

```bash
moon add nuskey8/brainfuck
```

```mbt
let source = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."
@brainfuck.run_string(source)
```

> [!NOTE]
> Currently, MoonBit does not implement `,` because there is no API to receive standard input in `native` target. Also, `.` is implemented by `println()`.

## LICENSE

This library is under the [MIT License](./LICENSE).