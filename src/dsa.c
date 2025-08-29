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

// ================= STACK FUNCTIONS =================
void pushStack(char data, s_stackNode **top)
{
    s_stackNode *newNode = (s_stackNode *)malloc(sizeof(s_stackNode));
    if (!newNode)
    {
        fprintf(stderr, "Memory allocation failed in pushStack\n");
        exit(memory_allocation_failed);
    }
    newNode->data = data;
    newNode->next = *top;
    *top = newNode;
}

char popStack(s_stackNode **top)
{
    if (*top == NULL)
    {
        fprintf(stderr, "Stack underflow in popStack\n");
        exit(incomplete_parameters); // Using existing error code as "underflow"
    }
    s_stackNode *temp = *top;
    char data = temp->data;
    *top = temp->next;
    free(temp);
    return data;
}

char peekStack(s_stackNode *top)
{
    if (top == NULL)
    {
        fprintf(stderr, "Stack is empty in peekStack\n");
        exit(incomplete_parameters);
    }
    return top->data;
}

int isStackEmpty(s_stackNode *top)
{
    return (top == NULL);
}

// --------- EXTRA FUNCTIONALITIES ---------
void clearStack(s_stackNode **top)
{
    while (!isStackEmpty(*top))
    {
        popStack(top);
    }
}

int stackSize(s_stackNode *top)
{
    int count = 0;
    while (top != NULL)
    {
        count++;
        top = top->next;
    }
    return count;
}

void printStack(s_stackNode *top)
{
    if (top == NULL)
    {
        fprintf(stderr, "Stack is empty in printStack\n");
        exit(incomplete_parameters);
    }

    s_stackNode *curr = top;
    while (curr != NULL)
    {
        printf("%c ", curr->data);
        curr = curr->next;
    }
    printf("\n");
}

void reverseStack(s_stackNode **top)
{
    if (*top == NULL)
    {
        fprintf(stderr, "Stack is empty in reverseStack\n");
        exit(incomplete_parameters);
    }

    s_stackNode *prev = NULL, *curr = *top, *next = NULL;
    while (curr != NULL)
    {
        next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
    }
    *top = prev;
}

void duplicateTop(s_stackNode **top)
{
    if (*top == NULL)
    {
        fprintf(stderr, "Stack is empty in duplicateTop\n");
        exit(incomplete_parameters);
    }

    pushStack((*top)->data, top);
}

char *stackToString(s_stackNode *top)
{
    if (top == NULL)
    {
        fprintf(stderr, "Stack is empty in stackToString\n");
        exit(incomplete_parameters);
    }

    int size = stackSize(top);
    char *str = (char *)malloc(size + 1);
    if (!str)
    {
        fprintf(stderr, "Memory allocation failed in stackToString\n");
        exit(memory_allocation_failed);
    }

    s_stackNode *curr = top;
    int i = 0;
    while (curr != NULL)
    {
        str[i++] = curr->data;
        curr = curr->next;
    }
    str[i] = '\0';
    return str;
}

void pushMultiple(s_stackNode **top, const char *data)
{
    if (data == NULL)
    {
        fprintf(stderr, "Invalid string in pushMultiple\n");
        exit(incomplete_parameters);
    }

    for (int i = 0; data[i] != '\0'; i++)
    {
        pushStack(data[i], top);
    }
}
