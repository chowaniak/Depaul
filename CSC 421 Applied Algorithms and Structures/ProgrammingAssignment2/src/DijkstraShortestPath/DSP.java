package DijkstraShortestPath;

import java.util.*;

public class DSP {
	private static final String startVertex = "A";
	private static final String finishVertex = "B";
	private final Map<String, Vertex> graph;

	public static String getStartvertex() {
		return startVertex;
	}

	public static String getFinishvertex() {
		return finishVertex;
	}

	public static class Edge {
		public final String vertex0, vertex1;
		public final int dist;

		public Edge(String vertex1, String vertex2, int distance) {
			this.vertex0 = vertex1;
			this.vertex1 = vertex2;
			this.dist = distance;
		}
	}

	public static class Vertex implements Comparable<Vertex> {
		public final String curVertex;
		public int dist = Integer.MAX_VALUE;
		public Vertex prevVertex = null;
		public final Map<Vertex, Integer> adjVertices = new HashMap<>();

		public Vertex(String curVertex) {
			this.curVertex = curVertex;
		}

		private void printPath() {
			if (this == this.prevVertex) {
				StdOut.print(this.curVertex);
			} else if (this.prevVertex == null) {
				StdOut.print("vertex " + this.curVertex + " could not be find");
			} else {
				if (Objects.equals(this.curVertex, getFinishvertex())) {
					StdOut.println(dist);
				}
				this.prevVertex.printPath();
				StdOut.print(" " + this.curVertex);
			}
		}

		public int compareTo(Vertex vertex) {
			if (dist == vertex.dist) {
				return curVertex.compareTo(vertex.curVertex);
			}
			return Integer.compare(dist, vertex.dist);
		}

		public String toString() {
			return curVertex;
		}
	}

	public DSP(Edge[] edges) {
		graph = new HashMap<>(edges.length);

		for (Edge edge : edges) {
			if (!graph.containsKey(edge.vertex0))
				graph.put(edge.vertex0, new Vertex(edge.vertex0));

			if (!graph.containsKey(edge.vertex1))
				graph.put(edge.vertex1, new Vertex(edge.vertex1));

			graph.get(edge.vertex0).adjVertices.put(graph.get(edge.vertex1), edge.dist);
		}
	}

	public void dijkstrasAlg(String startVertex) {
		if (!graph.containsKey(startVertex)) {
			StdOut.println("No start vertex " + startVertex);
			return;
		}

		Vertex start = graph.get(startVertex);
		NavigableSet<Vertex> queue = new TreeSet<>();

		for (Vertex vertex : graph.values()) {
			vertex.prevVertex = vertex == start ? start : null;
			vertex.dist = vertex == start ? 0 : Integer.MAX_VALUE;
			queue.add(vertex);
		}

		dijkstrasAlgorithm(queue);
	}

	private void dijkstrasAlgorithm(final NavigableSet<Vertex> queue) {
		Vertex u, v;

		while (!queue.isEmpty()) {
			u = queue.pollFirst();

			for (Map.Entry<Vertex, Integer> a : u.adjVertices.entrySet()) {
				v = a.getKey();

				int newDistance = u.dist + a.getValue();
				if (newDistance < v.dist) {
					queue.remove(v);
					v.dist = newDistance;
					v.prevVertex = u;
					queue.add(v);
				}
			}
		}
	}

	public void displayPath(String finishVertex) {
		if (!graph.containsKey(finishVertex)) {
			StdOut.println("No finish vertex " + finishVertex);
			return;
		}
		graph.get(finishVertex).printPath();
		StdOut.println();
	}
}
