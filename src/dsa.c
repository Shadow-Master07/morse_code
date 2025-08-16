#include "../lib/structs.h"
#include "../lib/dsa.h"

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

void deleteTree(s_morse *input)
{
    if (input == NULL)
        return;

    deleteTree(input->dot);
    deleteTree(input->dash);

    free(input);
}
