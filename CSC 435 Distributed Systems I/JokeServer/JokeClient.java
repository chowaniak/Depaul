/*--------------------------------------------------------

1. Name / Date: Michal Chowaniak 01/21/2018

2. Java version used: 1.8

3. Precise command-line compilation examples / instructions:

 javac JokeClient.java


4. Precise examples / instructions to run this program:


when running JokeClient.java press n and hit enter for next joke or proverb

5. List of files needed for running the program.

 1. JokeServer.java
 2. JokeClient.java
 3. JokeClientAdmin.java

5. Notes:

When server mode is switched it is not received by client immediately.
This cause client to show one more joke in joke mode or one more
proverb in proverb mode after server mode is changed.
I noticed it too late to make any changes...



----------------------------------------------------------*/



import java.io.*;
import java.net.Socket;




public class JokeClient {

    public static String serverMode = "J"; //keeps server state received from server
    static String uName; // initialize variable for user name
    static String serverName; // initialize variable serverName for server
    public static void main(String args[]) {


        if (args.length < 1) serverName = "localhost"; // if no arguments are given than localhost is passed to server
        else serverName = args[0]; // if an argument is entered it is passed as is

        System.out.println("Michal Chowaniak JokeClient");
        System.out.println("Using server: " + serverName + ", at Port 4545"); //inform user about server connection


        BufferedReader in = new BufferedReader(new InputStreamReader(System.in)); // text from keyboard

        String nCommand = ""; // initialize variable nCommand to ask for jokes

        try {

            System.out.println("Enter name please: "); // ask for user name
            System.out.flush();
            uName = in.readLine(); // put user name in variable
            String input; // variable to store user input
            String currentJokeState = ""; //variable to store which jokes were seen
            String currentproverbState = ""; //variable to store which proverbs were seen
            String conc = ""; //variable to store input and server state


            do {

                System.out.print("Type n and press Enter for next joke or proverb, (quit) to end: "); // ask user to enter something to get a joke
                System.out.flush(); //to remove output
                input = in.readLine(); // puts entered text in nCommand

                if (input.equals("n") && serverMode.equals("J")) // if stat checks for input and server state
                {
                    input = input.toUpperCase(); //change to upper case to avoid case problems
                    serverMode = serverMode.toUpperCase(); //change to upper case to avoid case problems
                    conc = input.concat(serverMode); // concatenate user input and server mode, which leter will be sent to server to get jokes
                    currentJokeState = currentJokeState.concat(conc); //concatenate conc variable to differentiate joke state and joke number
                    if (currentJokeState.equals("NJNJNJNJNJ")) //make sure jokes repeat after 4 were displayed
                    {
                        currentJokeState = "NJ"; //when 4th joke is displayed, than loop end and first one is displayed
                        nCommand = currentJokeState; // store joke state in variable which will be sent to server to retrieve jokes
                    }
                    else
                        nCommand = currentJokeState;
                }
                else if (input.equals("n") && serverMode.equals("P")) // if stat checks for input and server state
                {
                    input = input.toUpperCase();//change to upper case to avoid case problems
                    serverMode = serverMode.toUpperCase();//change to upper case to avoid case problems
                    conc = input.concat(serverMode);// concatenate user input and server mode, which leter will be sent to server to get proverbs
                    currentproverbState = currentproverbState.concat(conc);//concatenate conc variable to differentiate proverb state and proverb identifier
                    if (currentproverbState.equals("NPNPNPNPNP"))//make sure proverbs repeat after 4 were displayed
                    {
                        currentproverbState = "NP";
                        nCommand = currentproverbState;// store joke state in variable which will be sent to server to retrieve proverbs
                    }
                    else
                        nCommand = currentproverbState;
                }
                else {
                    System.out.println("Invalid entry, please enter letter  n  for next");  //checks for correct user input
                }

            if (nCommand.indexOf("quit") < 0) ;
            JokeClientSocket(nCommand, serverName, uName); // calls method and passes joke/proverb identifier, server name, and user name, which are sent to server.
        }

        while (nCommand.indexOf("quit") < 0) ;
        System.out.println("Cancelled by user request."); //if quit exists than prints this line
    } catch(
    IOException x)

    { // throws exception in case of error
        x.printStackTrace(); // to diagnose exception
    }

}

    static void JokeClientSocket(String nCommand, String serverName, String uName) {
        Socket sock; // initialize  socket
        BufferedReader fromServer; //initialize variable, reads from streams
        PrintStream toServer; //print streams
        String textFromServer=""; //initialize variable

        try {

            sock = new Socket(serverName,4545); //creates object socket, connection to server
            System.out.println("Connected ");
            fromServer = new BufferedReader(new InputStreamReader(sock.getInputStream())); //takes byte stream and changes to characters, use to receive info from server
            toServer = new PrintStream(sock.getOutputStream()); // takes output stream and puts it to object, to send out info to a server

            toServer.println(uName); // client sends user name to server
            toServer.println(nCommand ); //client sends a joke/proverb identifier to server to get a joke or proverb

            for (int i = 1; i <=5; i ++ ) { // reads from stream a line and outputs it if not null, receives info from server
                textFromServer = fromServer.readLine(); // variable used to store info received from server
                if (textFromServer != null)
                    if((textFromServer.equals("J") || textFromServer.equals("P"))){ //filter out server mode from other information received from server
                        serverMode = textFromServer;
                    System.out.println("Server Mode is: " + serverMode);}
                    else
                    System.out.println(textFromServer);
            }

            sock.close(); //shots down socket
        }
        catch (IOException x ) { //throws exception in case of error
            System.out.println("Socket error.");
            x.printStackTrace(); //helps to diagnose an error
        }

    }

}



