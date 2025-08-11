#ifndef MORSE_H
#define MORSE_H

// Headers are here
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define morse_max_length              9 // 1 space for null character and remaining for maximum length of morse values
#define function_ran_success          0
#define memory_allocation_failed      1
#define file_open_failed              2
#define less_parameters               3
#define incomplete_parameters         4

// Struct to be used
typedef struct morse
{
    struct morse *parent; // Will use when extending for different languages, currently to track the parent
    struct morse *dot;    // Points to next dot morse character
    struct morse *dash;   // Points to next dash morse character
    char character;       // Stores the character it represents
    char last_morse;      // Stores the ending character of morse notation
} s_morse;

// Function declaration
s_morse *createNode(s_morse *parent, char last_morse);
s_morse *giveAddress(char *morseCode, int len);
int insert(char character, char *morseCode, int len);
void printDataPreOrder(s_morse *p_head);
void printDataInOrder(s_morse *p_head);
void readFile(FILE *file);
void deleteTree(s_morse *input);

// Create some transmission related functions
/*
    Understood -> ...-.
    error -> ........ (8 dots)
    invitation to transmit -> -.-
    wait -> .-..
    end of work -> ...-.-
    starting signal -> -.-.-
*/

#endif
