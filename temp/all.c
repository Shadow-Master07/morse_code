// ================= STRUCT.H ====================

#ifndef STRUCT_H
#define STRUCT_H

// Struct to be used
typedef struct morse
{
    struct morse *parent; // Will use when extending for different languages, currently to track the parent
    struct morse *dot;    // Points to next dot morse character
    struct morse *dash;   // Points to next dash morse character
    char character;       // Stores the character it represents
    char last_morse;      // Stores the ending character of morse notation
} s_morse;

// Using this queue node to add characters to print later after morse to text transformation
typedef struct queueNode
{
    char data;
    struct queueNode *next;
    struct queueNode *prev;
} s_queueNode;

// Using this stack node to store characters in LIFO order
typedef struct stackNode
{
    char data;              // Character stored in the stack
    struct stackNode *next; // Pointer to the next node (below this one in stack)
} s_stackNode;

#endif

// ================= MORSE.H =================
#ifndef MORSE_H
#define MORSE_H

// Headers are here
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define morse_max_length 9 // 1 space for null character and remaining for maximum length of morse values
#define function_ran_success 0
#define memory_allocation_failed 1
#define file_open_failed 2
#define less_parameters 3
#define incomplete_parameters 4

// ================= FUNCTION DECLARATIONS =================

// ---- CLI & Mode Functions ----
void run_ctf_mode(int fileOrMorse, char *string);  // Runs Capture The Flag mode
void run_real_mode(int fileOrMorse, char *string); // Runs Real-world decoding mode
void cliParser(int argc, char *argv[]);            // Parses CLI arguments and calls appropriate mode

// ---- Morse Tree Functions ----
s_morse *createNode(s_morse *parent, char last_morse);    // Creates a new Morse tree node
s_morse *giveAddress(char *morseCode, int len);           // Traverses/creates tree path for given Morse code
int insertTree(char character, char *morseCode, int len); // Inserts character with Morse mapping into tree
void printDataPreOrder(s_morse *p_head);                  // Prints tree in pre-order
void printDataInOrder(s_morse *p_head);                   // Prints tree in in-order
void readFile(FILE *file);                                // Reads Morse mapping file and populates tree
void deleteTree(s_morse *input);                          // Frees entire Morse tree
char traverseTree(char morse[]);                          // Traverses tree to decode Morse sequence

// ---- Queue Functions ----
void insertQueue(char data, s_queueNode **head); // Inserts a character into circular queue
void printQueue(s_queueNode *head);              // Prints all characters from queue
char popQueue(s_queueNode **head);               // Removes and returns first character from queue

// ================= STACK FUNCTIONS =================
void pushStack(char data, s_stackNode **top); // Pushes a character onto the stack
char popStack(s_stackNode **top);             // Pops and returns the top character from the stack
char peekStack(s_stackNode *top);             // Returns the top character without removing it
int isStackEmpty(s_stackNode *top);           // Checks if the stack is empty

// --------- EXTRA FUNCTIONALITIES ---------
void clearStack(s_stackNode **top);                     // Empties the stack and frees memory
int stackSize(s_stackNode *top);                        // Returns the number of elements in the stack
void printStack(s_stackNode *top);                      // Prints all elements in the stack
void reverseStack(s_stackNode **top);                   // Reverses the order of the stack
void duplicateTop(s_stackNode **top);                   // Duplicates the top element
char *stackToString(s_stackNode *top);                  // Converts stack contents to a string
void pushMultiple(s_stackNode **top, const char *data); // Pushes multiple characters from a string

#endif

// ================= GLOBALS & STRUCTS =================
#define MORSE_MODE 0
#define FILE_MODE 1

extern s_morse *treeHead;

// ================= QUEUE FUNCTIONS =================
void insertQueue(char data, s_queueNode **head)
{
    if (*head == NULL)
    {
        (*head) = (s_queueNode *)malloc(sizeof(s_queueNode));
        (*head)->next = *head;
        (*head)->prev = *head;
        (*head)->data = data;
    }
    else
    {
        s_queueNode *newNode = (s_queueNode *)malloc(sizeof(s_queueNode));
        newNode->data = data;

        newNode->prev = (*head)->prev;
        newNode->next = (*head);
        (*head)->prev->next = newNode;
        (*head)->prev = newNode;
    }
}

void printQueue(s_queueNode *head)
{
    if (head == NULL)
    {
        return; // empty list
    }
    s_queueNode *curr = head;
    do
    {
        printf("%c", curr->data);
        curr = curr->next;
    } while (curr != head);
    printf("\n");
}

char popQueue(s_queueNode **head)
{
    if (*head == NULL) // empty queue
    {
        return '\0';
    }

    char data = (*head)->data;

    if ((*head)->next == *head)
    {
        free(*head);
        *head = NULL;
    }
    else
    {
        s_queueNode *temp = *head;
        temp->prev->next = temp->next;
        temp->next->prev = temp->prev;
        *head = temp->next;
        free(temp);
    }

    return data;
}

// ================= TREE FUNCTIONS =================
char traverseTree(char morse[])
{
    int len = strlen(morse);
    s_morse *temp = treeHead;
    for (int i = 0; i < len; i++)
    {
        if (morse[i] == '.')
        {
            temp = temp->dot;
        }
        else if (morse[i] == '-')
        {
            temp = temp->dash;
        }
        else
        {
            continue;
        }
    }
    return temp->character;
}

s_morse *treeHead = NULL;

s_morse *createNode(s_morse *parent, char last_morse)
{
    s_morse *temp = (s_morse *)malloc(sizeof(s_morse));
    if (!temp)
    {
        fprintf(stderr, "Memory allocation failed\n");
        exit(memory_allocation_failed);
    }

    temp->parent = parent;
    temp->dot = NULL;
    temp->dash = NULL;
    temp->character = '\0';
    temp->last_morse = last_morse;
    return temp;
}

s_morse *giveAddress(char *morseCode, int len)
{
    s_morse *temp = treeHead;
    for (int i = 0; i < len - 1; i++)
    {
        if (morseCode[i] == '.')
        {
            if (temp->dot == NULL)
                temp->dot = createNode(temp, '.');
            temp = temp->dot;
        }
        else if (morseCode[i] == '-')
        {
            if (temp->dash == NULL)
                temp->dash = createNode(temp, '-');
            temp = temp->dash;
        }
    }
    return temp;
}

int insertTree(char character, char *morseCode, int len)
{
    if (character == ' ')
        character = ' ';

    s_morse *addressPrevious = giveAddress(morseCode, len);

    s_morse **nextPtr = (morseCode[len - 1] == '.') ? &addressPrevious->dot : &addressPrevious->dash;

    if (*nextPtr == NULL)
        *nextPtr = createNode(addressPrevious, morseCode[len - 1]);

    (*nextPtr)->character = character;
    return function_ran_success;
}

void printDataPreOrder(s_morse *p_head)
{
    if (p_head == NULL)
        return;

    if (p_head->character != '\0')
    {
        if (p_head->character == ' ')
            printf("' ' (space)\n");
        else
            printf("%c\n", p_head->character);
    }

    printDataPreOrder(p_head->dot);
    printDataPreOrder(p_head->dash);
}

void printDataInOrder(s_morse *p_head)
{
    if (p_head == NULL)
        return;

    printDataInOrder(p_head->dot);

    if (p_head->character != '\0')
    {
        if (p_head->character == ' ')
            printf("' ' (space)\n");
        else
            printf("%c\n", p_head->character);
    }

    printDataInOrder(p_head->dash);
}

void readFile(FILE *file)
{
    char buffer[16];
    char character;
    char string[morse_max_length];
    int length = 0;

    while (fgets(buffer, 10, file))
    {
        length = strlen(buffer);
        buffer[length - 1] = '\0';
        length = strlen(buffer);
        character = buffer[0];
        for (int i = 0; i < length; i++)
        {
            string[i] = buffer[i + 2];
        }
        string[length] = '\0';
        length = strlen(string);

        insertTree(character, string, length);
    }
}

void deleteTree(s_morse *input)
{
    if (input == NULL)
        return;

    deleteTree(input->dot);
    deleteTree(input->dash);

    free(input);
}

// ================= MODE FUNCTIONS =================
void run_ctf_mode(int fileOrMorse, char *string)
{
    FILE *file = fopen("../morse.txt", "r");
    if (!file)
    {
        fprintf(stderr, "Could not open morse.txt\n");
        exit(file_open_failed);
    }

    treeHead = createNode(NULL, '\0');
    readFile(file);
    fclose(file);

    if (fileOrMorse == FILE_MODE)
    {
        // handle file mode
    }
    else if (fileOrMorse == MORSE_MODE)
    {
        s_queueNode *head = NULL;
        char *token = strtok(string, " ");
        while (token != NULL)
        {
            insertQueue(traverseTree(token), &head);
            token = strtok(NULL, " ");
        }

        printQueue(head);
    }

    deleteTree(treeHead);
    treeHead = NULL;
}

void run_real_mode(int fileOrMorse, char *string)
{
    FILE *file = fopen("../morse.txt", "r");
    if (!file)
    {
        fprintf(stderr, "Could not open morse.txt\n");
        exit(file_open_failed);
    }

    treeHead = createNode(NULL, '\0');
    readFile(file);
    fclose(file);

    printf("Real-world Mode: Type Morse codes (e.g., .-- or -.-.), or 'exit' to quit.\n");

    char input[morse_max_length];
    while (1)
    {
        printf("Morse> ");
        scanf("%s", input);

        if (strcmp(input, "exit") == 0)
            break;

        s_morse *temp = treeHead;
        int valid = 1;
        for (int i = 0; input[i] != '\0'; i++)
        {
            if (input[i] == '.')
                temp = temp->dot;
            else if (input[i] == '-')
                temp = temp->dash;
            else
            {
                valid = 0;
                break;
            }

            if (temp == NULL)
            {
                valid = 0;
                break;
            }
        }

        if (valid && temp->character != '\0')
            printf("Character: %c\n", temp->character);
        else
            printf("Invalid Morse Code\n");
    }

    deleteTree(treeHead);
    treeHead = NULL;
}

// ================= CLI PARSER FUNCTION =================
void cliParser(int argc, char *argv[])
{
    int mode = -1;
    int fileOrMorse = -1;
    char *string = NULL;
    if (argc < 2)
    {
        fprintf(stderr, "Usage: %s --mode=ctf|real\n", argv[0]);
        exit(1);
    }

    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "--mode") == 0)
        {
            if (strcmp(argv[i + 1], "ctf") == 0)
            {
                mode = 0;
            }
            if (strcmp(argv[i + 1], "real") == 0)
            {
                mode = 1;
            }
            i++;
        }
        if (strcmp(argv[i], "--morse") == 0)
        {
            fileOrMorse = MORSE_MODE;
            string = (char *)malloc(sizeof(char) * (strlen(argv[i + 1]) + 2));
            strcpy(string, argv[i + 1]);
            i++;
        }
        if (strcmp(argv[i], "--file") == 0)
        {
            fileOrMorse = FILE_MODE;
            string = (char *)malloc(sizeof(char) * (strlen(argv[i + 1]) + 2));
            strcpy(string, argv[i + 1]);
            i++;
        }
    }

    if ((mode == -1) || (fileOrMorse == -1))
    {
        fprintf(stderr, "Usage: %s --mode ctf|real [--morse \"<morse_string>\" | --file <filename>]\n", argv[0]);
        exit(incomplete_parameters);
    }

    if (mode == 0)
    {
        run_ctf_mode(fileOrMorse, string);
    }
    else if (mode == 1)
    {
        run_real_mode(fileOrMorse, string);
    }
    else
    {
        fprintf(stderr, "Usage: %s --mode ctf|real [--morse <morse_string> | --file <filename>]\n", argv[0]);
        if (string != NULL)
        {
            free(string);
        }
        exit(incomplete_parameters);
    }

    if (string != NULL)
    {
        free(string);
    }
}

// ================= MAIN =================

int main(int argc, char *argv[])
{
    cliParser(argc, argv);
    return 0;
}
