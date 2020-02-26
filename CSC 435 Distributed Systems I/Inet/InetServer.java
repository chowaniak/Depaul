import java.io.*; //standard libraries

import java.net.*; //networking libraries



class Worker extends Thread { // implements threads
    Socket sock;   // initialize socket which is a connection
    Worker (Socket s) {
        sock = s;}

    public void run() {
        PrintStream out = null; // initialize out, prints stream
        BufferedReader in = null; //initialize in, reads inputed stream
        try {
            in = new BufferedReader(new InputStreamReader(sock.getInputStream())); // reads stream received

            out = new PrintStream(sock.getOutputStream()); // gets stream sent out

         try {
             String name; //initialize variable name
             name = in.readLine(); //takes a first line from variable in and saves it in variable name
             System.out.println("Looking up " + name); //prints out name
             printRemoteAddress(name, out); // calls below method
         }
         catch (IOException x) { // throws exception in case of error
             System.out.println("Server read error");
             x.printStackTrace();
         }
         sock.close(); // closes the socket
        }
        catch (IOException ioe) // throws exception in case of error
        {
            System.out.println(ioe); // prints exception
        }
    }

    static void printRemoteAddress (String name, PrintStream out) {
        try {
            out.println("Looking up " + name + "..."); // prints name
            InetAddress machine = InetAddress.getByName (name); // finds out IP address by host name
            out.println("Host name : " + machine.getHostName()); // prints name of a server for provided IP address
            out.println("Host IP : " + toText (machine.getAddress())); //prints IP address
        }
        catch(UnknownHostException ex) {
            out.println("Failed in attempt to look up " + name); // throws exception in case of error
        }
    }
// Not interesting
    static String toText (byte ip[]) {
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < ip.length; i++) {
            if (i > 0) result.append (".");
            result.append (0xff & ip[i]);
        }
        return result.toString();
    }
}


public class InetServer {

    public static void main(String a[]) throws IOException {
        int q_len = 6; // max number of incoming connections
        int port = 40000; //port number
        Socket sock; //Initialize socket

        ServerSocket servsock = new ServerSocket(port, q_len); //creates server socket object

        System.out.println("Clark Elliott's Inet server 1.8 starting up, listening at port 40000. \n");

        while (true) { // creates connection

            sock = servsock.accept();
            new Worker(sock).start();


        }


    }


}




























