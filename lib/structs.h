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
