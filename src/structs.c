#include "../lib/structs.h"
#include "../lib/morse.h"
#include <stdio.h>
#include <stdlib.h>

// ================= MORSE NODE FUNCTIONS =================
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

void deleteTree(s_morse *input)
{
    if (input == NULL)
        return;

    deleteTree(input->dot);
    deleteTree(input->dash);

    free(input);
}
