import DijkstraShortestPath.DSP;
import DijkstraShortestPath.StdIn;
import DijkstraShortestPath.StdOut;

public class Main {
	public static void main(String[] args) {
		StdIn.fromFile("Files/Case1.txt");
		int verticesCount = 0;
		while (!StdIn.isEmpty()) {
			StdIn.readLine();
			verticesCount++;
		}
		@SuppressWarnings("unused")
		int numberVer;
		StdIn.fromFile("Files/Case1.txt");
		numberVer = StdIn.readInt();
		DSP.Edge[] g = new DSP.Edge[verticesCount - 1];
		for (int i = 0; i < verticesCount - 1; i++) {
			g[i] = new DSP.Edge(StdIn.readString(), StdIn.readString(), StdIn.readInt());
		}
		DSP graph = new DSP(g);
		graph.dijkstrasAlg(DSP.getStartvertex());
		graph.displayPath(DSP.getFinishvertex());
		StdOut.println();
		StdIn.fromFile("Files/Case2.txt");
		verticesCount = 0;
		while (!StdIn.isEmpty()) {
			StdIn.readLine();
			verticesCount++;
		}
		StdIn.fromFile("Files/Case2.txt");
		numberVer = StdIn.readInt();
		g = new DSP.Edge[verticesCount - 1];
		for (int i = 0; i < verticesCount - 1; i++) {
			g[i] = new DSP.Edge(StdIn.readString(), StdIn.readString(), StdIn.readInt());
		}
		graph = new DSP(g);
		graph.dijkstrasAlg(DSP.getStartvertex());
		graph.displayPath(DSP.getFinishvertex());
		StdOut.println();
		StdIn.fromFile("Files/Case3.txt");
		verticesCount = 0;
		while (!StdIn.isEmpty()) {
			StdIn.readLine();
			verticesCount++;
		}
		StdIn.fromFile("Files/Case3.txt");
		numberVer = StdIn.readInt();
		g = new DSP.Edge[verticesCount - 1];
		for (int i = 0; i < verticesCount - 1; i++) {
			g[i] = new DSP.Edge(StdIn.readString(), StdIn.readString(), StdIn.readInt());
		}
		graph = new DSP(g);
		graph.dijkstrasAlg(DSP.getStartvertex());
		graph.displayPath(DSP.getFinishvertex());

		StdOut.println();
	}
}