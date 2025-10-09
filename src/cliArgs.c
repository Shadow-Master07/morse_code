#include "../lib/morse.h"
#include "../lib/structs.h"
#include "../lib/cliArgs.h"
#include "../lib/dsa.h"

// Need to add this to other header file for future use
// Taken from CHATGPT
char *readToken(FILE *file)
{
    int capacity = 64;
    int length = 0;
    char *token = malloc(capacity);
    if (!token)
    {
        return NULL;
    }

    int c;

    while ((c = fgetc(file)) != EOF && isspace(c))
        ; // Infinite loop to skip leading spaces

    if (c == EOF)
    {
        free(token);
        return NULL;
    }

    // Read until next space or EOF
    do
    {
        if (length + 1 >= capacity)
        {
            capacity *= 2;
            token = realloc(token, capacity);
            if (!token)
                return NULL;
        }
        token[length++] = (char)c;
        c = fgetc(file);
    } while (c != EOF && !isspace(c));

    token[length] = '\0';
    return token;
}

// ================= MODE FUNCTIONS =================
void runCtfMode(int fileOrMorse, char *string)
{
    FILE *file = fopen("morse.txt", "r");
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
        FILE *inputFile = fopen(string, "r");
        // char line[256];
        if (inputFile == NULL)
        {
            fprintf(stderr, "File opening failed\n");
            exit(file_open_failed);
        }

        s_queueNode *queueHead = NULL;
        // Using the new function from here
        char *token = NULL;
        while ((token = readToken(inputFile)) != NULL)
        {
            insertQueue(traverseTree(token), &queueHead);
            free(token);
        }
        printQueue(queueHead);
    }
    else if (fileOrMorse == MORSE_MODE)
    {
        s_queueNode *queueHead = NULL;
        char *token = strtok(string, " ");
        while (token != NULL)
        {
            insertQueue(traverseTree(token), &queueHead);
            token = strtok(NULL, " ");
        }

        printQueue(queueHead);
    }

    deleteTree(treeHead);
    treeHead = NULL;
}

void runRealMode(int fileOrMorse, char *string)
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
    int ctfOrReal = -1;
    int fileOrMorse = -1;
    char *string = NULL;
    if (argc < 2)
    {
        fprintf(stderr, "Usage: %s --mode ctf|real\n", argv[0]);
        exit(1);
    }

    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "--mode") == 0)
        {
            if (strcmp(argv[i + 1], "ctf") == 0)
            {
                ctfOrReal = 0;
            }
            if (strcmp(argv[i + 1], "real") == 0)
            {
                ctfOrReal = 1;
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

    if ((ctfOrReal == -1) || (fileOrMorse == -1))
    {
        fprintf(stderr, "Usage: %s --mode ctf|real [--morse \"<morse_string>\" | --file <filename>]\n", argv[0]);
        exit(incomplete_parameters);
    }

    if (ctfOrReal == 0)
    {
        runCtfMode(fileOrMorse, string);
    }
    else if (ctfOrReal == 1)
    {
        runRealMode(fileOrMorse, string);
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
