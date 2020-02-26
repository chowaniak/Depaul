
//---		Common standard header files				---//

#include	<stdlib.h>
#include	<stdio.h>
#include	<string.h>
#include	<signal.h>
#include	<sys/types.h>
#include	<sys/wait.h>
#include	<unistd.h>

/*

Please start by looking at assign2Headers.h. There you will find the definitions of: ZERO_SIGNAL, ONE_SIGNAL,
CORRECT_SIGNAL, INCORRECT_SIGNAL, WIN_SIGNAL, TIME_OVER_SIGNAL, GUESSER_PROGNAME
("guesser"), ANSWERER_PROGNAME ("answerer") LINE_LEN, and NUM_SECONDS.

*/





//---		Common constants:					---//

#define		ZERO_SIGNAL		SIGUSR1

#define		ONE_SIGNAL		SIGUSR2

#define		CORRECT_SIGNAL		SIGUSR1

#define		INCORRECT_SIGNAL	SIGUSR2

#define		WIN_SIGNAL		SIGINT

#define		TIME_OVER_SIGNAL	SIGTERM

#define		GUESSER_PROGNAME	"guesser"

#define		ANSWERER_PROGNAME	"answerer"

#define		LINE_LEN		256

#define		NUM_SECONDS		30

