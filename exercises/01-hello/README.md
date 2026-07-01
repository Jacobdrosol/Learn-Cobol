# Exercise 01: Hello COBOL

Goal: compile and run the smallest useful COBOL program.

Run:

```bash
make hello
```

Study:

- `IDENTIFICATION DIVISION` names the program.
- `PROCEDURE DIVISION` contains executable statements.
- `DISPLAY` writes to the console.
- `GOBACK` returns to the caller or operating system.

Practice changes:

- Change the displayed text.
- Add a second `DISPLAY`.
- Break the spelling of `PROCEDURE` and rerun `make hello` to see a compiler error.
