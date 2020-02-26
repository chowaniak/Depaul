/*--------------------------------------------------------

1. Name / Date: Michal Chowaniak 01/21/2018

2. Java version used: 1.8

3. Precise command-line compilation examples / instructions:

 javac JokeServer.java


4. Precise examples / instructions to run this program:

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
import java.net.ServerSocket;
import java.net.Socket;




class AdminLooper implements Runnable {

    // to spin off new admin thread, which will wait for admin client to connect

    public static boolean adminControlSwitch = true;

    public void run() { // to run listening loop

        int q_len = 6; //number of requests for Opsys at the same time
        int port = 5050; // admin thread works on different port
        Socket adminSock;

        System.out.println("Admin thread started at port: " + port);

        try {
            ServerSocket servsock = new ServerSocket(port, q_len);
            while (adminControlSwitch) {
                // wait for admin client to connect
                adminSock = servsock.accept();
                new AdminLooperWorker(adminSock).start();
            }
        }
        catch (IOException ioe) {
                System.out.println(ioe);
        }
    }
}






class AdminLooperWorker extends Thread { // process the data coming over the connection from client admin

    public static String jokeAdminClientInput; //initialize variable storing info received from client
    public static String serverMode = "J"; //initialize variable for storing server mode

    Socket adminsock = new Socket();   // initialize socket which is a connection
    AdminLooperWorker (Socket s) {
        adminsock = s;}

    public void run() {
        PrintStream out = null; // initialize out, prints stream
        BufferedReader in = null; //initialize in, reads inputed stream
        try {
            in = new BufferedReader(new InputStreamReader(adminsock.getInputStream())); // reads stream received
            out = new PrintStream(adminsock.getOutputStream()); // gets stream sent out

            try {
                while(true) {

                jokeAdminClientInput = in.readLine(); //stores data from client
                System.out.println("Server received  ....." + jokeAdminClientInput); //prints out jokeAdminClientInput in server terminal
                jokeAdminClientInput = jokeAdminClientInput.toUpperCase(); // change case to upper to avoid potential problems with lower/uppercase in stings

                    if (jokeAdminClientInput.equals("J")) { //shows current server mode on server and client
                        serverMode = "J";
                        System.out.println("Server is working in joke mode"); // prints out info on server terminal if on joke mode
                      out.println("Server is working in joke mode"); // prints out info on client terminal if on joke mode
                      out.flush();
                    } else if (jokeAdminClientInput.equals("P")) {
                        serverMode = "P";
                        System.out.println("Server is working in proverb mode");// prints out info on server terminal if on proverb mode
                      out.println("Server is working in proverb mode");// prints out info on client terminal if on proverb mode
                      out.flush();
                    } else {
                        System.out.println("Incorrect value"); //prints out a incorrect value message in server terminal
                        out.println("Incorrect value"); // prints out incorrect value message in client terminal
                      out.flush();
                    }
                }
            }

            catch (IOException x) { // throws exception in case of error
                System.out.println("Server read error");
                x.printStackTrace();
            }
        }

        catch (IOException ioe) // throws exception in case of error
        {
            System.out.println(ioe); // prints exception
        }
    }

}


class JokeWorker extends Thread { // implements threads, //prof: process the data coming over the connection




    Socket sock;   // initialize socket which is a connection
    JokeWorker(Socket s) {
        sock = s;}

    public void run() {
        PrintStream out = null; // initialize out, prints stream
        BufferedReader in = null; //initialize in, reads inputed stream
        try {
            in = new BufferedReader(new InputStreamReader(sock.getInputStream())); // reads stream received
            out = new PrintStream(sock.getOutputStream()); // send info to clients

         try {
             // get user name from joke client
             String uName = in.readLine(); // reads user name
             String servMd = AdminLooperWorker.serverMode; // assign server mode to local variable
             System.out.println("User name received by server is: " + uName); // prints user name on server for confirmation only


             String nMCommand; //initialize variable nMCommand tp get joke/proverb
             nMCommand = in.readLine(); // get joke/proverb identifier from client and puts it in variable
             //System.out.println("Server received  ....." + nMCommand); //prints out what was received
             System.out.println("Processing ..."); //prints out when sth was received
            out.println(servMd); //prints received server mode letter


             if (nMCommand.equals("NJ")) // returns appropriate joke or proverb base on joke/proverb identifier received from client
                 out.println("JA " + uName + " How does a network admin great people who come to his house? Welcome to 127.0.0.1");
             else if (nMCommand.equals("NJNJ"))
                 out.println("JB " + uName + " The box said: Requires Windows 95 or better. So I installed Linux." );
             else if (nMCommand.equals("NJNJNJ"))
                 out.println("JC " + uName + " What is another name for a computer virus? A terminal illness.");
             else if (nMCommand.equals("NJNJNJNJ"))
                 out.println("JD " + uName + " How many programmers does it take to change a light bulb? None, it is a hardware problem");
             else if (nMCommand.equals("NP"))
                 out.println("PA " + uName + " Manus manum lavat. One hand washes the other.");
             else if (nMCommand.equals("NPNP"))
                 out.println("PB " + uName + " Usus magister est optimus. Practice makes perfect");
             else if (nMCommand.equals("NPNPNP"))
                 out.println("PC " + uName + " Absens haeres non erit. Out of sight, out of mind");
             else if (nMCommand.equals("NPNPNPNP"))
                 out.println("PD " + uName + " Si fueris Romae, Romano vivito more, si fueris alibi, vivito sicut ibi. When in Rome, do as the Romans");
             else
                 out.println(" a problem..." + nMCommand);


         }
         catch (IOException x) { // throws exception in case of error
             System.out.println("Server read error");
             x.printStackTrace();
         }
         sock.close(); // closes the socket //prof: terminate the thread
        }
        catch (IOException ioe) // throws exception in case of error
        {
            System.out.println(ioe); // prints exception
        }
    }
}


class JokeServer {

    public static void main(String a[]) throws IOException {
        int q_len = 6; // max number of incoming connections
        int port = 4545; //port number
        Socket sock; //Initialize socket


        AdminLooper AL = new AdminLooper(); // create new thread for admin
        Thread t = new Thread(AL);
        t.start(); //starts new thread waits for admin client input


        System.out.println("Michal Chowaniak JokeServer");
        ServerSocket servsock = new ServerSocket(port, q_len); //creates server socket object

        System.out.println("Server thread started at port: " + port);

        boolean controlSwitch = true;

        while (controlSwitch) { // creates connection
            // while (true) { // creates connection
            sock = servsock.accept();
            new JokeWorker(sock).start();
        }
    }
} // end of joke server class
