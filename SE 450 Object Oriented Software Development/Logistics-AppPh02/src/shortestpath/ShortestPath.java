package shortestpath;

import java.util.Map;
import java.util.NavigableSet;
import java.util.TreeSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;
import java.util.TreeMap;

import errors.IlligalDataException;

public class ShortestPath 
{
    private static ArrayList route = new ArrayList();
    private static String startV;
    private static String endV;
    private static int len;
    private HashMap<String, Top> graph;
    private TreeMap<Integer, TransInterface> net;

    private void startCity(String startCityIn) throws IlligalDataException 
    {
        if (startCityIn == null) 
        {
            throw new IlligalDataException("startCity, startCityIn is null");
        }
        startV = startCityIn;
    }

    private void finishCity(String finishCityIn) throws IlligalDataException 
    {
        if (finishCityIn == null) 
        {
            throw new IlligalDataException("finishCity, finishCityIn is null");
        }
        endV = finishCityIn;
    }

    public ShortestPath(String startCityIn, String finishCityIn) throws IlligalDataException 
    {
        startCity(startCityIn);
        finishCity(finishCityIn);
        findShortestPath();
    }

    private class Top implements Comparable<Top>
    {
        private String thisTop;
        private int length = Integer.MAX_VALUE; 
        private Top thatTop = null;
        private HashMap<Top, Integer> neighborTops = new HashMap<>();

        private Top(String thisTopIn)
        {
            thisTop = thisTopIn;
        }

        private void route() throws IlligalDataException 
        {
            if (this == thatTop)
            {
                route.add(thisTop);
            }

            else if (thatTop == null)
            {
                throw new IlligalDataException("route, thatTop (current City) is null");
            }

            else{
                if (Objects.equals(thisTop, endV))
                {
                    len = length;
                }

                thatTop.route();
                route.add(thisTop);
            }
        }

        public int compareTo(Top vertex)
        {
            if (length == vertex.length) 
            {
                return thisTop.compareTo(vertex.thisTop);
            }

            return Integer.compare(length, vertex.length);
        }

        public String toString(){return thisTop;}
    }

    
    private ShortestPath(TreeMap<Integer, TransInterface> links)
    {

        graph = new HashMap<>();

        for (Map.Entry<Integer, TransInterface> entry : links.entrySet()) 
        {
            TransInterface value = entry.getValue();
            if (!graph.containsKey(value.getCityIn()))
                graph.put(value.getCityIn(), new Top(value.getCityIn()));
            if (!graph.containsKey(value.getConnection()))
                graph.put(value.getConnection(), new Top(value.getConnection()));
            graph.get(value.getCityIn()).neighborTops.put(graph.get(value.getConnection()), value.getConnDist());
        }
    }

    private void dijkstrasAlgorithm(String startTop) throws IlligalDataException 
    {
        if (!graph.containsKey(startTop))
        {
            throw new IlligalDataException("ShortestPath.dijkstrasAlgorithm; The network does not contain the start facility ");
        }

        Top start = graph.get(startTop);
        NavigableSet<Top> queue = new TreeSet<>();

        for (Top top : graph.values()){
            top.thatTop = top == start ? start : null;
            top.length = top == start ? 0 : Integer.MAX_VALUE;
            queue.add(top);
        }

        dijkstrasAlgorithm(queue);
    }

 
    private void dijkstrasAlgorithm(NavigableSet<Top> queue){

        Top a, b;

        while (!queue.isEmpty()){
            a = queue.pollFirst();

            for (HashMap.Entry<Top, Integer> h : a.neighborTops.entrySet()){
                b = h.getKey();

                int newLen = a.length + h.getValue();
                if (newLen < b.length){

                    queue.remove(b);
                    b.length = newLen;
                    b.thatTop = a;
                    queue.add(b);
                }
            }
        }
    }


    private void newRoute(String endVertex) throws IlligalDataException 
    {
        if (!graph.containsKey(endVertex)){
            throw new IlligalDataException("newRoute, no end");
        }

        graph.get(endVertex).route();
    }

    private void findShortestPath() throws IlligalDataException 
    {
        net = NetworkIn.getInstance().getNet();
        ShortestPath graph = new ShortestPath(net);
        graph.dijkstrasAlgorithm(startV);
        graph.newRoute(endV);
    }

    public ArrayList getRoute()
    {
        return route;
    }

    public static int getLength()
    {
        return len;
    }
}


