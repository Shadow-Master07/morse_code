#include "../lib/morse.h"

s_morse *head = NULL;

// Create the node
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
    s_morse *temp = head;
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

int insert(char character, char *morseCode, int len)
{
    if (character == ' ')
        character = ' '; // Store actual space

    s_morse *addressPrevious = giveAddress(morseCode, len);

    s_morse **nextPtr = (morseCode[len - 1] == '.') ? &addressPrevious->dot : &addressPrevious->dash;

    if (*nextPtr == NULL)
        *nextPtr = createNode(addressPrevious, morseCode[len - 1]);

    (*nextPtr)->character = character;
    return function_ran_success;
}

// Preorder printing
void printDataPreOrder(s_morse *p_head)
{
    if (p_head == NULL)
    {
        return;
    }

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

// Inorder printing
void printDataInOrder(s_morse *p_head)
{
    if (p_head == NULL)
    {
        return;
    }

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

        length = strlen(buffer); // This is temporarily stored to assign values to appropriate parameters
        buffer[length - 1] = '\0';
        length = strlen(buffer);
        character = buffer[0];
        for (int i = 0; i < length; i++)
        {
            string[i] = buffer[i + 2];
        }
        string[length] = '\0';
        length = strlen(string);

        insert(character, string, length);
    }
}

// Hopefully deletes the tree
void deleteTree(s_morse *input)
{
    if (input == NULL)
        return;

    deleteTree(input->dot);
    deleteTree(input->dash);

    free(input);
}

int main()
{
    FILE *file;
    file = fopen("../morse.txt", "r");
    if (file == NULL)
    {
        fprintf(stderr, "File opening failed\n");
        exit(file_open_failed);
    }
    head = createNode(NULL, '\0');

    readFile(file);
    printDataPreOrder(head);
    fclose(file);

    // Delete the tree
    deleteTree(head);
    head = NULL;

    return 0;
}
