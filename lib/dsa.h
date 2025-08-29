#ifndef DSA_H
#define DSA_H

#include "morse.h"

// --------- Tree Functions --------
int insertTree(char character, char *morseCode, int len); // Inserts character with Morse mapping into tree
void printDataPreOrder(s_morse *p_head);                  // Prints tree in pre-order
void printDataInOrder(s_morse *p_head);                   // Prints tree in in-order
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