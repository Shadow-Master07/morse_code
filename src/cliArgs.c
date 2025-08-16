#include "../lib/morse.h"
#include "../lib/structs.h"
#include "../lib/cliArgs.h"
#include "../lib/dsa.h"

// ================= MODE FUNCTIONS =================
void run_ctf_mode(int fileOrMorse, char *string)
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
    }
    else if (fileOrMorse == MORSE_MODE)
    {
        s_queueNode *head = NULL;
        char *token = strtok(string, " ");
        while (token != NULL)
        {
            insertQueue(traverseTree(token), &head);
            token = strtok(NULL, " ");
        }

        printQueue(head);
    }

    deleteTree(treeHead);
    treeHead = NULL;
}

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

// ================= CLI PARSER FUNCTION =================
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
        run_ctf_mode(fileOrMorse, string);
    }
    else if (mode == 1)
    {
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
