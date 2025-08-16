#ifndef MORSE_H
#define MORSE_H

// Headers are here
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "structs.h"

#define morse_max_length 9 // 1 space for null character and remaining for maximum length of morse values
#define function_ran_success 0
#define memory_allocation_failed 1
#define file_open_failed 2
#define less_parameters 3
#define incomplete_parameters 4

s_morse *giveAddress(char *morseCode, int len); // Traverses/creates tree path for given Morse code
void readFile(FILE *file);                      // Reads Morse mapping file and populates tree

extern s_morse *treeHead;
#endif
