#include "../lib/morse.h"
#include "../lib/cliArgs.h"

#define MORSE_MODE 0
#define FILE_MODE 1

extern s_morse *treeHead;

// Using this queue node to add characters to print later after morse to text transformation
typedef struct queueNode
{
    char data;
    struct queueNode *next;
    struct queueNode *prev;
} s_queueNode;

// Insert into the Queue that will be used to print the character next
void insert(char data, s_queueNode **head)
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

// Hopefully this delete function works, by GPT
char popQueue(s_queueNode **head)
{
    if (*head == NULL) // empty queue
    {
        return '\0'; // or some sentinel value
    }

    char data = (*head)->data;

    // Only one element
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
        *head = temp->next; // move head to next element
        free(temp);
    }

    return data;
}

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

// ctf mode feature
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
        // handle file opening and reading work
    }
    else if (fileOrMorse == MORSE_MODE)
    {
        s_queueNode *head = NULL;
        // handle morse work
        char *token = strtok(string, " ");
        while (token != NULL)
        {
            // printf("%d ", token);
            // need to move in the tree and look for the data

            // then add it to the queue
            insert(traverseTree(token), &head);
            token = strtok(NULL, " ");
        }

        printQueue(head);
    }

    deleteTree(treeHead);
    treeHead = NULL;
}

// real world transmission happening here
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
        // calling run_ctf_mode
        run_ctf_mode(fileOrMorse, string);
    }
    else if (mode == 1)
    {
        // calling run_real_mode
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