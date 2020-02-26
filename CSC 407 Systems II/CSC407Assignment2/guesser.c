        #include "assign2Headers.h"

//guesser.c should also have a global int shouldRun variable initialized to 1. 
        int shouldRun = 1;

//The handler for TIME_OVER_SIGNAL announces that the time is up and sets shouldRun to 0. 
        void tmOverSigHandler(int sigNum){
                printf("\nOh no!  The time is up! \n");
                shouldRun = 0;
        }

//The handler for WIN_SIGNAL announces that the user won and sets shouldRun to 0. 
        void winSigHandler(int sigNum){
                printf("\nCongratulations!  You found it! \n");
                shouldRun = 0;
        }

//The handler for CORRECT_SIGNAL announces that the user got their last guess correct. 
        void corrSigHandler(int sigNum){
                printf("That was right! Go to next level! ");
        }

//The handler for INCORRECT_SIGNAL announces that the user got their last guess wrong, 
//and should start again from the beginning. 
        void incorrSigHandler(int sigNum){
                printf("Oops!  That was wrong.  Please restart from the beginning. \n\n\n Re-starting from the beginning:");
        }

//main() should install 4 signal handler: 
        int main (int argc, char* argv[]){

// The handler for TIME_OVER_SIGNAL announces that the time is up and sets shouldRun to 0. 
        struct sigaction tmOverSig;
                alarm(NUM_SECONDS);
                memset(&tmOverSig, '\0', sizeof(tmOverSig));
                tmOverSig.sa_handler = tmOverSigHandler;
                sigaction(SIGALRM, &tmOverSig, NULL);

//The handler for WIN_SIGNAL announces that the user won and sets shouldRun to 0. 
        struct sigaction winSig;
                memset(&winSig, '\0', sizeof(winSig));
                winSig.sa_handler = winSigHandler;
                sigaction(WIN_SIGNAL, &winSig, NULL);

//The handler for CORRECT_SIGNAL announces that the user got their last guess correct. 
        struct sigaction corrSig;
                memset(&corrSig, '\0', sizeof(corrSig));
                corrSig.sa_handler = corrSigHandler;
                sigaction(CORRECT_SIGNAL, &corrSig, NULL);

//The handler for INCORRECT_SIGNAL announces that the user got their last guess wrong, 
//and should start again from the beginning. 
        struct sigaction incorrSig;
                memset(&incorrSig, '\0', sizeof(incorrSig));
                incorrSig.sa_handler = incorrSigHandler;
                sigaction(INCORRECT_SIGNAL, &incorrSig, NULL);


        int entry = -1;
        pid_t  answererPid;
        answererPid = strtol(argv[1],NULL,10);
        char	line[LINE_LEN];

        printf("Starting from the beginning:");
        
//In a while(shouldRun) loop, allow the user to enter their next guess.        
        while(shouldRun){
                printf("\nWhat would you like your next guess to be (0 or 1)?: ");
                fgets(line,LINE_LEN,stdin);
                entry = strtol(line,NULL,10);
                
//If they enter 0 send the answerer ZERO_SIGNAL. 
                if(entry == 0){
                        kill(answererPid,ZERO_SIGNAL);
//At after sending the signal, do a sleep(1) to give the answerer time to respond. 
                        sleep(1);
                }
//	If they enter 1 send the answerer ONE_SIGNAL.                
                else if(entry == 1){
                        kill(answererPid,ONE_SIGNAL);
//At after sending the signal, do a sleep(1) to give the answerer time to respond. 
                        sleep(1);
                }
// trying to force time over, when no input detected                
                else if (entry == -1) {
                        kill(answererPid, TIME_OVER_SIGNAL);
                        sleep(1);
                }
                else {
                        kill(answererPid, INCORRECT_SIGNAL);
                        sleep(1);
                }
}
//After the loop just do: 
        printf("guesser finished\n");
        return(EXIT_SUCCESS);
}


