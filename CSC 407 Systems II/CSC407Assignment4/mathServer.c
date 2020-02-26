/*--------------mathServer.c						---*
 *---									---*
 *---	    This file defines a C program that gets file-sys commands	---*
 *---	from client via a socket, executes those commands in their own	---*
 *---	threads, and returns the corresponding output back to the	---*
 *---	client.								---*
 *---									---*
 *---	----	----	----	----	----	----	----	----	---*
 *---									---*
 *---	Version 1.0		2017 February 20	Joseph Phillips	---*
 *---									---*
 *-------------------------------------------------------------------------*/

//	Compile with:
//	$ gcc mathServer.c -o mathServer -lpthread

//---		Header file inclusion					---//

#include	"mathClientServer.h"
#include	<errno.h>	// For perror()
#include	<pthread.h>	// For pthread_create()


//---		Definition of constants:				---//

#define		STD_OKAY_MSG		"Okay"

#define		STD_ERROR_MSG		"Error doing operation"

#define		STD_BYE_MSG		"Good bye!"

#define		THIS_PROGRAM_NAME	"mathServer"

#define		FILENAME_EXTENSION	".bc"

#define		OUTPUT_FILENAME		"out.txt"

#define		ERROR_FILENAME		"err.txt"

#define		CALC_PROGNAME		"/usr/bin/bc"

const int	ERROR_FD		= -1;

extern   void* handleClient(void* vPtr);

//---		Definition of functions:				---//

//  PURPOSE:  To run the server by 'accept()'-ing client requests from
//	'listenFd' and doing them.
void		doServer	(int listenFd)
{
  //  I.  Application validity check:

  //  II.  Server clients:
  pthread_t		threadId;
  pthread_attr_t	threadAttr;
  int			threadCount	= 0;

  

  
  // YOUR CODE HERE
  
  while(1)
  {
//waits for a client to connect to listenFd
  	int clientToConnect = accept(listenFd, NULL, NULL);

//malloc() enough memory for 2 integers
    int* servPtr = malloc(2 * sizeof(int));
//put the file descriptor from accept() in one of those spaces   
    servPtr[0] = clientToConnect;
//put the value of threadCount in the other space, and increment threadCount   
    servPtr[1] = threadCount;
    threadCount++;

//Make a detached thread to handle this new client.
//Pass the address of your malloc()-ed array.    

    pthread_attr_init(&threadAttr); 
    pthread_attr_setdetachstate(&threadAttr,PTHREAD_CREATE_DETACHED);
    pthread_create(&threadId,&threadAttr,handleClient,servPtr);
  }
}

void* handleClient(void* vPtr)
{

    char  buffer[BUFFER_LEN];
    char  command;
    int   fileNum;
    char  text[BUFFER_LEN];
    int   shouldContinue  = 1;
	
//Use another pointer to cast back to void*    
	int *iPtr;
    iPtr = (int*) vPtr;

//Save the file descriptor and thread number in local vars    
    int fd = iPtr[0];
    int threadNum = iPtr[1];
    
//free() the memory    
    free(iPtr);

    
    
    while  (shouldContinue)
    {
      //text[0] = '\0';
        memset(buffer,'\0',BUFFER_LEN);
        memset(text  ,'\0',BUFFER_LEN);
        
        
      read(fd,buffer,BUFFER_LEN);
      printf("Thread %d received: %s\n",threadNum,buffer);
      sscanf(buffer,"%c %d \"%[^\"]\"",&command,&fileNum,text);

      
// YOUR CODE HERE

      
      switch(command){

//command == DIR_CMD_CHAR          
         case DIR_CMD_CHAR:
         {

              buffer[0] = '\0';

              struct dirent*  entPtr;

//Open the current directory (named ".")
              DIR*   directPtr   = opendir(".");
              
//If an error occurs then just send STD_ERROR_MSG back to the client
                if  (directPtr == NULL)
                {
                    write(fd,STD_ERROR_MSG,sizeof(STD_ERROR_MSG));
                    break;
                  }
//Copy as many entries that will fit into a buffer of length 
//BUFFER_LEN. Be sure to put a separating '\n' after each entry
                 while ((entPtr = readdir(directPtr)) != NULL )
                 {
                    strncat(buffer, entPtr->d_name, BUFFER_LEN);
                    strncat(buffer,"\n",BUFFER_LEN);
                  }
              write(fd, buffer, BUFFER_LEN);
              
//Close the directory
              closedir(directPtr); 
            }


//command == READ_CMD_CHAR           
            case READ_CMD_CHAR:
            {
//Open the file with the number fileNum. Get the name from the number with:
              char fileName[BUFFER_LEN];
              snprintf(fileName,BUFFER_LEN,"%d%s",fileNum,FILENAME_EXTENSION); 

              int oFd = open(fileName,O_RDONLY,0); 

              if(oFd < 0)
              {
                 write(fd,STD_ERROR_MSG,sizeof(STD_ERROR_MSG));
                 break;
              }
//read() up to BUFFER_LEN into a buffer. Put a '\0' character at the end of the buffer.
              int rdNum = read(fileNum,buffer,BUFFER_LEN);

              if(rdNum == -1)
              {
                write(fd, STD_ERROR_MSG,sizeof(STD_ERROR_MSG));
                close(oFd);
                break;
              }
//Send that buffer to the client                
              int wrNum = write(oFd,buffer,rdNum);

//If an error occurs during any of this, then send STD_ERROR_MSG back to the client.              
              if (wrNum == -1)
              {
                write(fd, STD_ERROR_MSG,sizeof(STD_ERROR_MSG));
                break;
              }
              
//Close the file.                
              close(oFd); 
            }

            
//command == WRITE_CMD_CHAR
            case WRITE_CMD_CHAR:
            {

             // int numByts;

              char fileName[BUFFER_LEN];

              snprintf(fileName,BUFFER_LEN,"%d%s",fileNum,FILENAME_EXTENSION); 

// Open the file               
              int oFd = open(fileName,O_WRONLY|O_CREAT|O_TRUNC,0660);

              if(oFd < 0)
              {
                   write(fd,STD_ERROR_MSG,sizeof(STD_ERROR_MSG));
                   break;
                }
//Save that text to the named file.
              int numRead = read(oFd,text,strlen(text)); 

              
//If there is an error send then send STD_ERROR_MSG back to the client             
              if(numRead == -1)
              {
                  write(fd, STD_ERROR_MSG,sizeof(STD_ERROR_MSG));
                  close(oFd);
                  break;
                }
              int wrNum = write(oFd,text,BUFFER_LEN);

              if(wrNum == -1)
              {
                  write(fd, STD_ERROR_MSG,sizeof(STD_ERROR_MSG));
                  close(oFd);
                  break;
                }
                
//If you succeeded then send STD_OKAY_MSG back to the client                
              else
              {
                  write(fd, STD_OKAY_MSG,sizeof(STD_OKAY_MSG));
                }
              
              close(oFd); 
            }

            
//command == DELETE_CMD_CHAR      
            case DELETE_CMD_CHAR:
            {
            
//fileNum tells the file number of the file to delete
              char  fileName[BUFFER_LEN];
              snprintf(fileName,BUFFER_LEN,"%d%s",fileNum,FILENAME_EXTENSION); 

//Using the unlink() command
              if(unlink(fileName) < 0)
              {
                  write(fd,STD_ERROR_MSG,sizeof(STD_ERROR_MSG));
                  break;
                }
//If there is an error send then send STD_ERROR_MSG back to the client                
                else
              {
                  write(fd, STD_OKAY_MSG,sizeof(STD_OKAY_MSG));
                }
              unlink(fileName);
              break;
            }
            
            
// command == CALC_CMD_CHAR           
            case CALC_CMD_CHAR:
            {

              char  calcbuf[BUFFER_LEN];
              int status    = 0;
              
//fork() a child.              
              pid_t cPid = fork();
              
//If fork() fails then send STD_ERROR_MSG back to the client.              
              if (cPid < 0)
              {
                fprintf(stderr,"Could not execl %s\n",CALC_PROGNAME);
              }

              
//For the child, do the following              
              if (cPid == 0)
              {
                  char  fileName[BUFFER_LEN];

                  snprintf(fileName,BUFFER_LEN,"%d%s",fileNum,FILENAME_EXTENSION);

                  int inFd  = open(fileName,O_RDONLY,0);
                  int outFd = open(OUTPUT_FILENAME,O_WRONLY|O_CREAT|O_TRUNC,0660);
                  int errFd = open(ERROR_FILENAME, O_WRONLY|O_CREAT|O_TRUNC,0660);

                    if  ((inFd<0) || (outFd<0) || (errFd<0))
                    {
                    fprintf(stderr,"Could not open one or more files\n");
                    exit(EXIT_FAILURE);
                    }

                  close(0);
                  dup(inFd);
                  close(1);
                  dup(outFd);
                  close(2);
                  dup(errFd);

//Then run CALC_PROGNAME                  
                  execl(CALC_PROGNAME,CALC_PROGNAME,NULL);
                  exit(EXIT_SUCCESS);
                }

//For the parent wait() for the child                
                pid_t waitpid = wait(&status);

//If the child crashed or did not return EXIT_SUCCESS                
		            if (WEXITSTATUS(status) == EXIT_SUCCESS)
                    {  
                    char  fileName[BUFFER_LEN];
                    snprintf(fileName,BUFFER_LEN,"%d%s",fileNum,FILENAME_EXTENSION);
		              
/*
If the child did not crash and returned EXIT_SUCCESS, then read() the first BUFFER_LEN chars from the file named OUTPUT_FILENAME. If there is any more space left in your buffer, then read() from the file named ERROR_FILENAME into the same buffer so that it has BUFFER_LEN chars maximum. */                  
                    int	outFd	= open(OUTPUT_FILENAME,O_RDONLY|O_CREAT,0660);
                    int	errFd	= open(ERROR_FILENAME, O_RDONLY|O_CREAT,0660);

                    if  ( (outFd < 0) || (errFd < 0) )
                    {
                    fprintf(stderr,"Could not open one or more files\n");
                    exit(EXIT_FAILURE);
                    }
                
                    int outNum = read(outFd, fileName, BUFFER_LEN);
                
                    int errNum = read(errFd, fileName, BUFFER_LEN);
                
//close() both files.                    
                    close(outFd);
                    close(errFd);
                    
//Send your buffer back to the client.
                    write(fd,buffer,BUFFER_LEN);
                    break;
                    }
                    else
                    {
                    write(fd, STD_ERROR_MSG, sizeof(STD_ERROR_MSG));
                    break;
                    }
        }
                    
                 

//command == QUIT_CMD_CHAR              
            case QUIT_CMD_CHAR:
//Just send STD_BYE_MSG back to the client and set shouldContinue to 0 to quit the loop.                
                
            {
              write(fd,STD_BYE_MSG,sizeof(STD_BYE_MSG));

              shouldContinue = 0; 
            }                 

        }
    }


  printf("Thread %d quitting.\n",threadNum);
  return(NULL);

}


//  PURPOSE:  To decide a port number, either from the command line arguments
//	'argc' and 'argv[]', or by asking the user.  Returns port number.
int		getPortNum	(int	argc,
				 char*	argv[]
				)
{
  //  I.  Application validity check:

  //  II.  Get listening socket:
  int	portNum;

  if  (argc >= 2)
    portNum	= strtol(argv[1],NULL,0);
  else
  {
    char	buffer[BUFFER_LEN];

    printf("Port number to monopolize? ");
    fgets(buffer,BUFFER_LEN,stdin);
    portNum	= strtol(buffer,NULL,0);
  }

  //  III.  Finished:  
  return(portNum);
}


//  PURPOSE:  To attempt to create and return a file-descriptor for listening
//	to the OS telling this server when a client process has connect()-ed
//	to 'port'.  Returns that file-descriptor, or 'ERROR_FD' on failure.
int		getServerFileDescriptor
				(int		port
				)
{
  //  I.  Application validity check:

  //  II.  Attempt to get socket file descriptor and bind it to 'port':
  //  II.A.  Create a socket
  int socketDescriptor = socket(AF_INET, // AF_INET domain
			        SOCK_STREAM, // Reliable TCP
			        0);

  if  (socketDescriptor < 0)
  {
    perror(THIS_PROGRAM_NAME);
    return(ERROR_FD);
  }

  //  II.B.  Attempt to bind 'socketDescriptor' to 'port':
  //  II.B.1.  We'll fill in this datastruct
  struct sockaddr_in socketInfo;

  //  II.B.2.  Fill socketInfo with 0's
  memset(&socketInfo,'\0',sizeof(socketInfo));

  //  II.B.3.  Use TCP/IP:
  socketInfo.sin_family = AF_INET;

  //  II.B.4.  Tell port in network endian with htons()
  socketInfo.sin_port = htons(port);

  //  II.B.5.  Allow machine to connect to this service
  socketInfo.sin_addr.s_addr = INADDR_ANY;

  //  II.B.6.  Try to bind socket with port and other specifications
  int status = bind(socketDescriptor, // from socket()
		    (struct sockaddr*)&socketInfo,
		    sizeof(socketInfo)
		   );

  if  (status < 0)
  {
    perror(THIS_PROGRAM_NAME);
    return(ERROR_FD);
  }

  //  II.B.6.  Set OS queue length:
  listen(socketDescriptor,5);

  //  III.  Finished:
  return(socketDescriptor);
}



int		main		(int	argc,
				 char*	argv[]
				)
{
  //  I.  Application validity check:

  //  II.  Do server:
  int 	      port	= getPortNum(argc,argv);
  int	      listenFd	= getServerFileDescriptor(port);
  int	      status	= EXIT_FAILURE;

  if  (listenFd >= 0)
  {
    doServer(listenFd);
    close(listenFd);
    status	= EXIT_SUCCESS;
  }

  //  III.  Finished:
  return(status);
}
