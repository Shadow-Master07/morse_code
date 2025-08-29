#ifndef CLI_ARGS
#define CLI_ARGS

// ================= GLOBALS & STRUCTS =================
#define MORSE_MODE 0
#define FILE_MODE 1

// ---- CLI & Mode Functions ----
void runCtfMode(int fileOrMorse, char *string);  // Runs Capture The Flag mode
void runRealMode(int fileOrMorse, char *string); // Runs Real-world decoding mode
void cliParser(int argc, char *argv[]);            // Parses CLI arguments and calls appropriate mode

#endif