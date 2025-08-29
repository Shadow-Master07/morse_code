# Morse Code Translator and Creator
## Languages Supported
- ### By default
  - English
- ### Not default
  - Devanagri
  - Greek
  - Hebrew
  - Cyrillic (Russian)
  - Arabic
  - Kurdish
  - Persian
  - Chinese
  - Korean
  - Japanese

## Writing method
- ### Left to Right
  - English
  - Devanagri
  - Greek
  - Cyrillic (Russian)
  - Korean
- ### Right to Left
  - Hebrew
  - Arabic
  - Kurdish
  - Persian
- ### Vertical Column Right to Left
  - Chinese
  - Japanese

```C
struct morse
{
  struct morse *parent;         // Will use when extending for different languages, currently to track the parent
  struct morse *dot;            // Points to next dot morse character
  struct morse *dash;           // Points to next dash morse character
  char character;               // Stores the character it represents
  char last_morse;              // Stores the ending character of morse notation
}
```

```C
// Using this tokenisation method to read further morse codes from string to use it accordingly
// C program for splitting a string
// using strtok()
#include <stdio.h>
#include <string.h>

int main()
{
    char str[] = "Geeks-for-Geeks";

    // Returns first token
    char* token = strtok(str, " - ");

    // Keep printing tokens while one of the
    // delimiters present in str[].
    while (token != NULL) {
        printf(" % s\n", token);
        token = strtok(NULL, " - ");
    }

    return 0;
}
```

NOTE:
  - Accented characters are introduced in morse.txt file that refer to english only characters as of now, so it is put as blank space character " " (space) for now to let it be skipped

TODO: 
- punction marks will take 6-8 characters, modify the code for that accordingly
- create a stack for using user input and pushing it to stack so the initial morse is written backwards, from top to bottom and pop the values to get the correct morse value
  - create a linked list of all the stacks that will be storing the morse
  - search the character in the tree and push the morse->last_morse to the stack then move to the parent with morse->parent
  - continue this till you reach the head, then do this for the other characters
  - all this is in a linked list of stacks and we pop the first stack and move to the next linked list node for the next character
  - when the last node is popped, assign the pointer head/temp to NULL
- as for the morse code to character creation it is easy
  - traverse the morse code and move to the appropriate character direction, morse->dash or morse->dot and at the final postion, print the character
    - do this for files now
- Add parameter passing options for make this a tool for linux specifically


CURRENT LOCATION:
- Working on cliArgs.c runCtfMode()