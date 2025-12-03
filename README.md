# ASM_Letter_Counter

**8086 Assembly program** to count uppercase and lowercase letters in a user-input word.  
This simple program demonstrates basic **TASM Assembly programming**, including string input, character processing, and DOS interrupts (INT 21h).

---

## Features

- Reads a word from the user.
- Counts **uppercase letters (A-Z)**.
- Counts **lowercase letters (a-z)**.
- Displays the counts on the screen.
- Uses **INT 21h DOS interrupts** for input/output.
- Properly ends the program using `mov ah, 4Ch; int 21h`.

---

## How to Run (TASM)

1. Open your **TASM environment** or **DOSBox**.
2. Assemble the program:
   ```bash
   tasm letter_counter.asm
   ```
3. Link the object file:
   ```bash
   tlink letter_counter.obj
   ```
4. Run the program:
   ```bash
   letter_counter.exe
   ```

---

## Example Output

```
Enter a word: HelloWorld
Uppercase letters: 2
Lowercase letters: 8
```

