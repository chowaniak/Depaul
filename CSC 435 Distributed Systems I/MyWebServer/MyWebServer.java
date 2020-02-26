/*--------------------------------------------------------

1. Name / Date: Michal Chowaniak 02/04/2018

2. Java version used: 1.8

3. Precise command-line compilation examples / instructions:

 javac MyWebServer.java


4. Precise examples / instructions to run this program:


5. List of files needed for running the program.


6. Notes:

addnums is work in progress, web browser shows text instead of html


----------------------------------------------------------*/


import java.io.*;
import java.net.*;
import java.net.Socket;



class MyWebServerWorker extends Thread { // implements threads, //prof: process the data coming over the connection


    Socket sock;   // initialize socket which is a connection

    MyWebServerWorker(Socket s) {
        sock = s;
    }

    public void run() {
        PrintStream out = null; // initialize out, prints stream
        BufferedReader in = null; //initialize in, reads inputed stream
        String requests = ""; //requests from browser
        String requestsArray[] = new String[10];
        String requestType;


        try {
            in = new BufferedReader(new InputStreamReader(sock.getInputStream())); // reads stream received
            out = new PrintStream(sock.getOutputStream()); // send info to clients

                for (int i = 0; i <= 5; i++) { //save first lines of a request to array
                    //  if (in.readLine() != null)
                    {
                        requestsArray[i] = in.readLine();
                        //System.out.println("array " + i + " :::: " + requestsArray[i]);
                    }
                }

            //process GET /cat.html HTTP/1.1 and extract GET, file name
            if (requestsArray[0] != null) {
                requests = requestsArray[0]; }

           System.out.println(requests + "\n");
            String[] firstRequest = requests.split("\\s"); //
            String requestCategory = firstRequest[0];

        if (requestCategory.equals("GET")) { // in case something else then GET is sent

            String requestFile = firstRequest[1];


            // filters file extentions and calls appropiate methods, finds type of browser request
            if ((requestFile.endsWith(".txt")) || (requestFile.endsWith(".java"))) {
                requestType = "text/plain";
                System.out.println(requestType+"\n");
                getFile(out, requestFile, requestType);}
            else if (requestFile.endsWith(".html")) {
                requestType = "text/html";
                System.out.println(requestType+"\n");
                getFile(out, requestFile, requestType); }
            else if(requestFile.contains("/cgi/addnums.fake-cgi")){
                requestType = "text/html";
                System.out.println(requestType+"\n");
                addNums(out, requestFile,requestType); }
            else if (requestFile.endsWith("/")) {
                requestType = "text/html";
                System.out.println(requestType+"\n");
                directory(out, requestFile, requestType); }
            else {
                requestType = "text/html";
                System.out.println(requestType+"\n");
                out.println("File or Directory Not Found");
                System.out.println("File or Directory Not Found");
                System.out.println(requestType);
                directory(out, requestFile, requestType); }
        }

            sock.close(); // close this connection, but not the server;
        } catch (IOException x) { // throws exception in case of error
            System.out.println("Server read error");
            x.printStackTrace(); }
    }

        //find file and send to browser
    public void getFile (PrintStream out, String requestFile, String requestType) throws IOException {

        System.out.println("file name is " + requestFile);
        requestFile = requestFile.substring(1);
        InputStream in = new FileInputStream(requestFile);
        File file = new File(requestFile);

        header(out, requestType, file); // get header info
        sendData(in, out); // send file to browser
        in.close(); }

    // creates a directpry list in html and sends to browser
    public void directory(PrintStream out, String requestFile , String requestType) throws IOException {

        BufferedWriter dir = new BufferedWriter(new FileWriter("dir.html")); // file

        dir.write("<html>"); // beginning of html
        dir.write("Directory\n");

        File dir1 = new File("./" + requestFile + "/");
        back(requestFile, dir); // call go back link method

        File[] files = dir1.listFiles();

        for(File name: files) { // checks for files and folders and sends links to browser
            String file = name.getName();
            if (name.isFile()) { // for files
                dir.write("<p style=\"margin-left: 40px\"><a href=\"" + file + "\" >" + file + "</a href> <br></p> ");
                System.out.println("File: " + file);
            }

            if (name.isDirectory()) { // for folders
                dir.write("<a href=\"" + file + "/\">/" + file + "</a href> <br>");
                System.out.println("Folder: " + file);
            }
            dir.flush(); }
        dir.write("</html>"); // end html

        File fileName = new File("dir.html");
        InputStream in = new FileInputStream("dir.html");


        header(out, requestType, fileName); // get header info

        sendData(in, out); //send data to browser

        dir.close();
        out.flush();
        in.close();
    }
    // creates header for html file
    private void header(PrintStream out, String requestType, File fileName) {
        out.append("HTTP/1.1 200 OK\n");
        out.append("Content-Length: "+ fileName.length());
        out.append("Content-Type: "+requestType);
        out.append("\n\n"); }

        // creates go back link
    private void back(String requestFile, BufferedWriter dir) throws IOException {
        // go back button
        if(requestFile.endsWith("/") && !requestFile.equals("/")) {
       // if(requestFile.endsWith("/") ) {
            File back = new File(requestFile + "/..");
            dir.write("<a href=\"" +
                    "http://localhost:2540" + back + "\">" + "Go Back" + "</a>"); }
    }

        // sends data to browser
    private static void sendData(InputStream in, PrintStream out) {

        try {
            byte[] buffer = new byte[2000];
            while (in.available() > 0)
                out.write(buffer, 0, in.read(buffer));
        } catch (IOException e) {
            System.err.println(e); }
    }


    // process form, get info from string, sends it to browser - needs more work
    public void addNums(PrintStream out, String fileName, String requestType)
    {

        int numb1 = fileName.indexOf("num1"); // finds frist number
        int numb2 = fileName.indexOf("num2"); // finds 2nd number
        int person = fileName.indexOf("person"); // finds name

        String name = fileName.substring(person+7,numb1-1);

        int int1 = Integer.parseInt(fileName.substring(numb1+5,numb2-1));
        int int2 = Integer.parseInt(fileName.substring(numb2+5));
        int sum = int1 + int2;

        StringBuilder result = new StringBuilder(); // for result file send to browser

        result.append("<html>\n<body>\n"); // begining of html file
        result.append("<H2>Name: "+person+", sum of "+int1+" and "+int2 +" is "+sum+"</H2>\n");
        result.append("</body></html>"); // end

        String sendFile = result.toString();
        //System.out.println(sendFile);

        int sendLength = sendFile.getBytes().length; // gets length


        // work in progress, header should be processed by header method.....
       out.println("HTTP/1.1 200 OK\n");
       out.println("Content-Length: " + sendLength);
        out.println("Content-Type: " + requestType);
        out.println("\n\n");
        out.println(sendFile);


    }
}


public class MyWebServer {

    public static boolean controlSwitch = true;

    public static void main(String a[]) throws IOException {
        int q_len = 6; // max number of incoming connections
        int port = 2540; //port number
        Socket sock; //Initialize socket

        ServerSocket servsock = new ServerSocket(port, q_len); //creates server socket object
        System.out.println("MyWebServer thread started at port: " + port);

        while (controlSwitch) { // creates connection
            // while (true) { // creates connection
            sock = servsock.accept();
            new MyWebServerWorker(sock).start();
        }}}
