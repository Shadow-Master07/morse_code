#include "../lib/morse.h"
#include "../lib/cliArgs.h"
#include "../lib/dsa.h"
#include "../lib/structs.h"

s_morse *treeHead = NULL;

s_morse *giveAddress(char *morseCode, int len)
{
    s_morse *temp = treeHead;
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

void readFile(FILE *file)
{
    char buffer[16];
    char character;
    char string[morse_max_length];
    int length = 0;

    while (fgets(buffer, 10, file))
    {
        length = strlen(buffer);
        buffer[length - 1] = '\0';
        length = strlen(buffer);
        character = buffer[0];
        for (int i = 0; i < length; i++)
        {
            string[i] = buffer[i + 2];
        }
        string[length] = '\0';
        length = strlen(string);

        insertTree(character, string, length);
    }
}

int main(int argc, char *argv[])
{
    cliParser(argc, argv);
    return 0;
}