#include "../lib/morse.h"
#include "../lib/cliArgs.h"

extern s_morse *head;

// ctf mode feature
void run_ctf_mode()
{
    FILE *file = fopen("../morse.txt", "r");
    if (!file)
    {
        fprintf(stderr, "Could not open morse.txt\n");
        exit(file_open_failed);
    }

    head = createNode(NULL, '\0');
    readFile(file);
    fclose(file);

    printf("CTF Mode: Preorder traversal of the Morse tree:\n");
    printDataPreOrder(head);

    deleteTree(head);
    head = NULL;
}

// real world transmission happening here
void run_real_mode()
{
    FILE *file = fopen("../morse.txt", "r");
    if (!file)
    {
        fprintf(stderr, "Could not open morse.txt\n");
        exit(file_open_failed);
    }

    head = createNode(NULL, '\0');
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

        s_morse *temp = head;
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

    deleteTree(head);
    head = NULL;
}

void cliParser(int argc, char *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "Usage: %s --mode=ctf|real\n", argv[0]);
        exit(1);
    }

    if (strcmp(argv[1], "--mode=ctf") == 0)
    {
        run_ctf_mode();
    }
    else if (strcmp(argv[1], "--mode=real") == 0)
    {
        run_real_mode();
    }
    else
    {
        fprintf(stderr, "Unknown mode. Use --mode=ctf or --mode=real\n");
        exit(1);
    }
}