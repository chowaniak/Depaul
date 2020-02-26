import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.Socket;


public class InetClient {
    public static void main (String args[]) {
        String serverName; // initialize variable for server
        if (args.length < 1) serverName = "localhost"; // if no arguments are given than localhost is passed
        else serverName = args[0]; // if an argument is entered it is passed as is

        System.out.println("Clark Elliott's Inet Client, 1.8. \n");
        System.out.println("Using server: " + serverName + ", Port 40000");
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in)); // text from keyboard

        try {
            String name; // initialize variable name
            do {
                System.out.print("Enter a hostname or an IP address, (quit) to end: ");
                System.out.flush(); //to remove output
                name = in.readLine(); // puts entered text in name
                if (name.indexOf("quit") < 0)
                    getRemoteAddress(name, serverName); //if entered text is not quit then than getRemoteAddress runs
            }
            while (name.indexOf("quit") < 0);
            System.out.println("Cancelled by user request."); //if quit exists than prints this line
        } catch (IOException x) { // throws exception in case of error
            x.printStackTrace(); // to diagnose exception
        }
    }

// Not interesting ?
        static String toText ( byte ip[]){
            StringBuffer result = new StringBuffer();
            for (int i = 0; i < ip.length; ++i) {
                if (i > 0) result.append(".");
                result.append(0xff & ip[i]);
            }
            return result.toString();
        }

static void getRemoteAddress (String name, String serverName) {
        Socket sock; // initialize  socket
        BufferedReader fromServer; //initialize variable, reads from streams
        PrintStream toServer; //print streams
        String textFromServer; //initialize variable

        try {

            sock = new Socket(serverName,40000); //creates object socket
            fromServer = new BufferedReader(new InputStreamReader(sock.getInputStream())); //takes byte stream and changes to characters
            toServer = new PrintStream(sock.getOutputStream()); // takes output stream and puts it to object

            toServer.println(name); //prints name
            toServer.flush();

            for (int i = 1; i <=3; i ++ ) { // reads from stream 3 times a line and outputs it if not null
                textFromServer = fromServer.readLine();
                if (textFromServer != null)
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


