#ifndef CLI_ARGS
#define CLI_ARGS

// ================= GLOBALS & STRUCTS =================
#define MORSE_MODE 0
#define FILE_MODE 1

// ---- CLI & Mode Functions ----
void run_ctf_mode(int fileOrMorse, char *string);  // Runs Capture The Flag mode
void run_real_mode(int fileOrMorse, char *string); // Runs Real-world decoding mode
void cliParser(int argc, char *argv[]);            // Parses CLI arguments and calls appropriate mode

#endif