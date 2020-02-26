#include "assign2Headers.h"

//Definition of global variables:

        pid_t   answererPid;
        pid_t   guesserPid;
        int     shouldRun = 1;

//tells the two child processes to stop by sending them TIME_OVER_SIGNAL
//(1) Your handler for "time up" should be triggered by SIGALRM (not TIME_OVER_SIGNAL). 
//Instead, the body of your handler should send TIME_OVER_SIGNAL to both the answerer and the guesser.

        void sigAlHandler (int sigInt){
            kill(answererPid,TIME_OVER_SIGNAL);
            kill(guesserPid,TIME_OVER_SIGNAL);
            shouldRun= 0;
        }

//The SIGCHLD does a waitpid() in a loop to get all finished children. It also sets shouldRun to 0.
//(4) What should the SIGCHLD handler look like? Check out the SIGCHLD handler from shell3.c of lecture 4.

        void sigChldHander (int sig) {
            pid_t	pid;
            int	s;
        
            while( (pid=waitpid(-1,&s,WNOHANG)) > 0){
                if (WIFEXITED(s) != 0){
                printf(WEXITSTATUS(s));
                }
                else
                printf("%d crashed!\n",pid);
            }
            shouldRun = 0;  
        }

int main (void){
    
//Its main() install two signal handlers: one for SIGALRM and one for SIGCHLD.
// Install SIGALRM handlers        
        struct sigaction actionA;
        	memset(&actionA,'\0',sizeof(actionA));
          	actionA.sa_handler = sigAlHandler;
          	sigaction(SIGALRM,&actionA,NULL);
                
// Install SIGCHLD handler - like in  shell3.c
        struct sigaction actionC;
        	memset(&actionC,'\0',sizeof(actionC));
        	actionC.sa_handler	= sigChldHander;
          	sigaction(SIGCHLD,&actionC,NULL);

//To when launching the answering program put the child pid in answererPid 
//and have the child run the string constant ANSWERER_PROGNAME. 

        answererPid = fork();
        
        if (answererPid == 0){
            execl("./answerer", ANSWERER_PROGNAME, NULL);
            fprintf(stderr, "Couldn't find %s\n", ANSWERER_PROGNAME); 
            exit(EXIT_FAILURE);
        }
        else if(answererPid < 0){
            printf("Ups, Fork failed .");
            exit(1);
        }

//To when launching the guessing program put the child pid in guesserPid 
//and have the child run the string constant GUESSER_PROGNAME. 
//The guesser program must be told the process id of the answering process. 

        guesserPid = fork();
        if (guesserPid == 0){
                char    line[LINE_LEN];
                snprintf(line,LINE_LEN,"%d",answererPid);
                execl("./guesser", GUESSER_PROGNAME,line, NULL);
                fprintf(stderr, "Couldn't find %s\n", GUESSER_PROGNAME);
                _exit(EXIT_FAILURE);
        }
       else if (guesserPid < 0){
                printf("Ups, Fork failed .");
                exit(1);
        } 
        
        
//Then main() sets its self up to receive SIGALRM in NUM_SECONDS seconds.     
        alarm(NUM_SECONDS);
   
    
//Lastly main() just does the following:     
        while (shouldRun)
            sleep(1);
            
        sleep(1);
        sleep(1);
    
        printf("launcher finished\n");
        return(EXIT_SUCCESS);
    }
    
    