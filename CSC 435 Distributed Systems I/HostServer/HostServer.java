/* 2012-05-20 Version 2.0

Thanks John Reagan for this well-running code which repairs the original
obsolete code for Elliott's HostServer program. I've made a few additional
changes to John's code, so blame Elliott if something is not running.

-----------------------------------------------------------------------

Play with this code. Add your own comments to it before you turn it in.

-----------------------------------------------------------------------
NOTE: This is NOT a suggested implementation for your agent platform,
but rather a running example of something that might serve some of
your needs, or provide a way to start thinking about what YOU would like to do.
You may freely use this code as long as you improve it and write your own comments.

-----------------------------------------------------------------------

TO EXECUTE: 

1. Start the HostServer in some shell. >> java HostServer

1. start a web browser and point it to http://localhost:1565. Enter some text and press
the submit button to simulate a state-maintained conversation.

2. start a second web browser, also pointed to http://localhost:1565 and do the same. Note
that the two agents do not interfere with one another.

3. To suggest to an agent that it migrate, enter the string "migrate"
in the text box and submit. The agent will migrate to a new port, but keep its old state.

During migration, stop at each step and view the source of the web page to see how the
server informs the client where it will be going in this stateless environment.

-----------------------------------------------------------------------------------

COMMENTS:

This is a simple framework for hosting agents that can migrate from
one server and port, to another server and port. For the example, the
server is always localhost, but the code would work the same on
different, and multiple, hosts.

State is implemented simply as an integer that is incremented. This represents the state
of some arbitrary conversation.

The example uses a standard, default, HostListener port of 1565.

-----------------------------------------------------------------------------------

DESIGN OVERVIEW

Here is the high-level design, more or less:

HOST SERVER
  Runs on some machine
  Port counter is just a global integer incrememented after each assignment
  Loop:
    Accept connection with a request for hosting
    Spawn an Agent Looper/Listener with the new, unique, port

AGENT LOOPER/LISTENER
  Make an initial state, or accept an existing state if this is a migration
  Get an available port from this host server
  Set the port number back to the client which now knows IP address and port of its
         new home.
  Loop:
    Accept connections from web client(s)
    Spawn an agent worker, and pass it the state and the parent socket blocked in this loop
  
AGENT WORKER
  If normal interaction, just update the state, and pretend to play the animal game
  (Migration should be decided autonomously by the agent, but we instigate it here with client)
  If Migration:
    Select a new host
    Send server a request for hosting, along with its state
    Get back a new port where it is now already living in its next incarnation
    Send HTML FORM to web client pointing to the new host/port.
    Wake up and kill the Parent AgentLooper/Listener by closing the socket
    Die

WEB CLIENT
  Just a standard web browser pointing to http://localhost:1565 to start.

  -------------------------------------------------------------------------------*/


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;




class AgentWorker extends Thread {

	//initialize socket for web browser
	Socket sock;
	//initialize object to hold state information
	agentHolder parentAgentHolder;
	//initialize port number variable
	int localPort;
	
	//creates object for agent worker
	AgentWorker (Socket s, int prt, agentHolder ah) {
		sock = s;
		localPort = prt;
		parentAgentHolder = ah;
	}
	public void run() {

		//initialize print stream
		PrintStream out = null;
		// initialize inputed stream
		BufferedReader in = null;
		// initialize server address
		String NewHost = "localhost";
		//initialize port number of main worker
		int NewHostMainPort = 1565;
		//initialize buffer string
		String buf = "";
		// initialize port
		int newPort;
		// initialize socket
		Socket clientSock;
		// initialize stream received
		BufferedReader fromHostServer;
		// initialize stream sent out
		PrintStream toHostServer;
		
		try {
			// reads stream sent out
			out = new PrintStream(sock.getOutputStream());
			//reads stream received
			in = new BufferedReader(new InputStreamReader(sock.getInputStream()));
			//saves first line from stream received
			String inLine = in.readLine();
			//creates object to build html file
			StringBuilder htmlString = new StringBuilder();
			// prints new line
			System.out.println();
			//prints first line from received html
			System.out.println("Request line: " + inLine);
			// if user types migrate, browser is switched to new port
			if(inLine.indexOf("migrate") > -1) {
				// creates new connection
				clientSock = new Socket(NewHost, NewHostMainPort);
				fromHostServer = new BufferedReader(new InputStreamReader(clientSock.getInputStream()));

				//send a request to port 1565 to receive the next open port
				toHostServer = new PrintStream(clientSock.getOutputStream());
				toHostServer.println("Please host me. Send my port! [State=" + parentAgentHolder.agentState + "]");
				toHostServer.flush();

				// loops until port number is received
				for(;;) {
					buf = fromHostServer.readLine();
					if(buf.indexOf("[Port=") > -1) {
						break;
					}
				}
				
				// finds port number in sting received and assigns it to string variable
				String tempbuf = buf.substring( buf.indexOf("[Port=")+6, buf.indexOf("]", buf.indexOf("[Port=")) );
				// changes port number as string to number
				newPort = Integer.parseInt(tempbuf);
				//prints port in server terminal
				System.out.println("newPort is: " + newPort);
				
				// starts building html file for browser
				htmlString.append(AgentListener.sendHTMLheader(newPort, NewHost, inLine));
				//add info about new port number
				htmlString.append("<h3>We are migrating to host " + newPort + "</h3> \n");
				// add info about source  code
				htmlString.append("<h3>View the source of this page to see how the client is informed of the new location.</h3> \n");
				//sends html file
				htmlString.append(AgentListener.sendHTMLsubmit());

				// prints info about closing connection on server terminal
				System.out.println("Killing parent listening loop.");
				// finds old port
				ServerSocket ss = parentAgentHolder.sock;
				//close old port
				ss.close();



				// if text entered is not migrate
			} else if(inLine.indexOf("person") > -1) {
				// updates state
				parentAgentHolder.agentState++;
				//builds html file to send to browser
				htmlString.append(AgentListener.sendHTMLheader(localPort, NewHost, inLine));
				// adds information about state
				htmlString.append("<h3>We are having a conversation with state   " + parentAgentHolder.agentState + "</h3>\n");
				//finishes html file
				htmlString.append(AgentListener.sendHTMLsubmit());

			} else {
				//if not a text or migrate entered
				htmlString.append(AgentListener.sendHTMLheader(localPort, NewHost, inLine));
				htmlString.append("You have not entered a valid request!\n");
				htmlString.append(AgentListener.sendHTMLsubmit());		
				
		
			}
			//sends html
			AgentListener.sendHTMLtoStream(htmlString.toString(), out);
			
			//closes connection
			sock.close();
			
			// catches problems
		} catch (IOException ioe) {
			System.out.println(ioe);
		}
	}
	
}




// keeps state
class agentHolder {
	//initialize connection
	ServerSocket sock;
	//initialize variable for state
	int agentState;
	
	//creates object
	agentHolder(ServerSocket s) { sock = s;}
}






// check ports and responds
class AgentListener extends Thread {
	//initialize connection
	Socket sock;
	//initialize variable for port
	int localPort;
	
	//creates object for agent listener
	AgentListener(Socket As, int prt) {
		sock = As;
		localPort = prt;
	}
	// initialize state
	int agentState = 0;







	//called from start() when a request is made on the listening port
	public void run() {
		// initialize inputed stream
		BufferedReader in = null;
		//initialize print stream
		PrintStream out = null;
		// initialize server address
		String NewHost = "localhost";
		// prints to server terminal info
		System.out.println("In AgentListener Thread");		
		try {
			//initialize variable buf for keeping first line of stream received
			String buf;
			// reads stream sent out
			out = new PrintStream(sock.getOutputStream());
			//reads stream received
			in =  new BufferedReader(new InputStreamReader(sock.getInputStream()));
			//read first line
			buf = in.readLine();
			//finds state numbe
			if(buf != null && buf.indexOf("[State=") > -1) {
				//finds state number in stream and assigns it to variable
				String tempbuf = buf.substring(buf.indexOf("[State=")+7, buf.indexOf("]", buf.indexOf("[State=")));
				//changes string to number
				agentState = Integer.parseInt(tempbuf);
				//prints on server terminal what state is
				System.out.println("agentState is: " + agentState);
					
			}
			//prints buf on server terminal
			System.out.println(buf);
			//builds a html to send to browser
			StringBuilder htmlResponse = new StringBuilder();
			// adds to html file port, host and buffer
			htmlResponse.append(sendHTMLheader(localPort, NewHost, buf));
			//adds to html file information about agent
			htmlResponse.append("Now in Agent Looper starting Agent Listening Loop\n<br />\n");
			//adds to html file port number
			htmlResponse.append("[Port="+localPort+"]<br/>\n");
			//adds to html file submit button
			htmlResponse.append(sendHTMLsubmit());
			//sends html file including header
			sendHTMLtoStream(htmlResponse.toString(), out);
			
			//creates connection
			ServerSocket servsock = new ServerSocket(localPort,2);
			//creates agentholder object keeps socket info and state
			agentHolder agenthold = new agentHolder(servsock);
			agenthold.agentState = agentState;
			

			while(true) {
				//accepts connection from browser
				sock = servsock.accept();
				//pritns at server terminal info about connection and port
				System.out.println("Got a connection to agent at port " + localPort);
				//starts new worker using above port
				new AgentWorker(sock, localPort, agenthold).start();
			}
		
		} catch(IOException ioe) {
			//handles possible errors and prints them in server terminal
			System.out.println("Either connection failed, or just killed listener loop for agent at port " + localPort);
			System.out.println(ioe);
		}
	}

	//returns html header
	static String sendHTMLheader(int localPort, String NewHost, String inLine) {
		// using string buider object to create html
		StringBuilder htmlString = new StringBuilder();
		htmlString.append("<html><head> </head><body>\n");
		htmlString.append("<h2>This is for submission to PORT " + localPort + " on " + NewHost + "</h2>\n");
		htmlString.append("<h3>You sent: "+ inLine + "</h3>");
		htmlString.append("\n<form method=\"GET\" action=\"http://" + NewHost +":" + localPort + "\">\n");
		htmlString.append("Enter text or <i>migrate</i>:");
		htmlString.append("\n<input type=\"text\" name=\"person\" size=\"20\" value=\"YourTextInput\" /> <p>\n");
		
		return htmlString.toString();
	}



	//adds tp html file submit
	static String sendHTMLsubmit() {
		return "<input type=\"submit\" value=\"Submit\"" + "</p>\n</form></body></html>\n";
	}


	// creates html header
	static void sendHTMLtoStream(String html, PrintStream out) {
		
		out.println("HTTP/1.1 200 OK");
		out.println("Content-Length: " + html.length());
		out.println("Content-Type: text/html");
		out.println("");		
		out.println(html);
	}
	
}


// creates host server
public class HostServer {
	// initialize port
	public static int NextPort = 3000;
	
	public static void main(String[] a) throws IOException {
		//max number of incoming connections
		int q_len = 6;
		//port number
		int port = 1565;
		// initialize connection
		Socket sock;

		//creates server socket object
		ServerSocket servsock = new ServerSocket(port, q_len);
		//prints at server terminal info about port number
		System.out.println("John Reagan's DIA Master receiver started at port 1565.");
		// prints more info
		System.out.println("Connect from 1 to 3 browsers using \"http:\\\\localhost:1565\"\n");

		//creates connection
		while(true) {
			// increases port number
			NextPort = NextPort + 1;
			//opens socket
			sock = servsock.accept();
			//prints at server terminal what port number is open
			System.out.println("Starting AgentListener at port " + NextPort);
			//starts agent at port above and waits
			new AgentListener(sock, NextPort).start();
		}
		
	}
}
