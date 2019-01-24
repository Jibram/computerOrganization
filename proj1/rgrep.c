#include <stdio.h>
#define MAXSIZE 4096

/**
 * You can use this recommended helper function 
 * Returns true if partial_line matches pattern, starting from
 * the first char of partial_line.
 */

int matches_leading(char *partial_line, char *pattern) {
	
	//Success
	if (*pattern == '\0') {return 1;}
	
	//Failure
	if (*partial_line == '\0' || *partial_line == '\n') {return 0;}

	char next;
	if (*pattern != '\0') {
		next = *(pattern + 1);
	} else {
		next = '\0';
	}

	if ((*pattern == '\\') && (*(pattern + 1) == *partial_line)) {
		return matches_leading(partial_line + 1, pattern + 2);
	}
	
	if ((next == '+') && (*partial_line == *pattern || *pattern == '.')){
		while (*partial_line == *pattern) {
			if (*pattern == '.' && (*(pattern + 2) == *partial_line)) {
				if (matches_leading(partial_line, pattern + 2)) {return 1;}
			}
			partial_line++;
		}
		return matches_leading(partial_line, pattern + 2);
	}
	
	if (next == '?'){
		if (*partial_line != *pattern) {
			return matches_leading(partial_line, pattern + 2);
		} else {
			return (matches_leading(partial_line, pattern + 2) || matches_leading(partial_line + 1, pattern + 2));
		}
	}

	if (*pattern == '.' || *pattern == *partial_line){
		return matches_leading(partial_line + 1, pattern + 1);
	}
	
	return 0;
		
}

/**
 * You may assume that all strings are properly null terminated 
 * and will not overrun the buffer set by MAXSIZE 
 *
 * Implementation of the rgrep matcher function
 */

int rgrep_matches(char *line, char *pattern) {
	//This handles one loop per character in the line at a time.
	while (*line != '\0') {
		if (matches_leading(line, pattern)) {
			return 1;
		}
		line++;
	}
	return 0;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <PATTERN>\n", argv[0]);
        return 2;
    }

    /* we're not going to worry about long lines */
    char buf[MAXSIZE];

    while (!feof(stdin) && !ferror(stdin)) {
        if (!fgets(buf, sizeof(buf), stdin)) {
            break;
        }
        if (rgrep_matches(buf, argv[1])) {
            fputs(buf, stdout);
            fflush(stdout);
        }
    }

    if (ferror(stdin)) {
        perror(argv[0]);
        return 1;
    }

    return 0;
}
