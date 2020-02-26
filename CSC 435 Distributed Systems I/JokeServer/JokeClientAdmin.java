/*--------------------------------------------------------

1. Name / Date: Michal Chowaniak 01/21/2018

2. Java version used: 1.8

3. Precise command-line compilation examples / instructions:

 javac JokeClientAdmin.java


4. Precise examples / instructions to run this program:

press Enter first to connect admin client to server

when running JokeClientAdmin press J for joke mode or P for proverb mode


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


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.Socket;
import java.util.Scanner;

public class JokeClientAdmin {



    public static void main (String args[]) {

        Socket sock; // initialize  socket
        BufferedReader fromServer; //initialize variable, reads from streams
        PrintStream toServer; //print streams
        String textFromServer; //initialize variable
        int adminPort = 5050; // adminclient port
        Scanner scan = new Scanner(System.in); // needed for user input to hold client from connecting to server
        String startAdminClient; // variable to keep user input

        String serverName; // initialize variable serverName for server
        if (args.length < 1) serverName = "localhost"; // if no arguments are given than localhost is passed
        else serverName = args[0]; // if an argument is entered it is passed as is

        System.out.println("Michal Chowaniak JokeClientAdmin");
        System.out.println("Using server: " + serverName + ", at Port 5050");
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in)); // text from keyboard

        System.out.println("Please press enter to connect to a server"); //inform user what to do

        startAdminClient = scan.nextLine();// variable to hold user input
        boolean flag = true;

       while (flag) { // to make sure user press enter, user cannot proceceed unless correct input is received
           if (!startAdminClient.equals("")) {
               System.out.println("Invalid input. Please press enter to connect to a server. ");
               startAdminClient = scan.nextLine();
               flag = true;
           }
           else
               flag = false;
       }

        if (startAdminClient.equals("")) // joke admin client waits for user input to connect to server
             {

            try {

                sock = new Socket(serverName, adminPort); //creates object socket, connection

                while (true) {

                    String serverSwitchInput; // initialize variable serverSwitchInput
                    System.out.println("Please enter J for joke mode or P for proverb mode: ");
                    serverSwitchInput = in.readLine(); // puts entered text in serverSwitchInput

                    fromServer = new BufferedReader(new InputStreamReader(sock.getInputStream())); //takes byte stream and changes to characters, to receive info from server
                    toServer = new PrintStream(sock.getOutputStream()); // takes output stream and puts it to object, to send new server mode to server

                    toServer.println(serverSwitchInput); //prints serverSwitchInput // this is my jokecode????


                     for (int i = 1; i <= 1; i++) { // reads from stream 3 times a line and outputs it if not null
                         textFromServer = fromServer.readLine();
                       if (textFromServer != null)
                           System.out.println(textFromServer);

                      }
                }

            } catch (IOException x) { // throws exception in case of error
                x.printStackTrace(); // to diagnose exception
            }
        }
    }
    }