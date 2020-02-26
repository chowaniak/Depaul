package shortestpath;

import java.util.ArrayList;



public class PrintShortestPath {

    private ArrayList<String> start;
    private ArrayList<String> finish;

    public PrintShortestPath() 
    {
        startfinish();
    }

    private void startfinish() 
    {
    	start = new ArrayList<>();
        start.add("Santa Fe, NM");
        start.add("Atlanta, GA"); 
        start.add("Seattle, WA"); 
        start.add("New York City, NY");
        start.add("Fargo, ND"); 
        start.add("Denver, CO");
        start.add("Austin, TX");
        start.add("Miami, FL");
        start.add("Los Angeles, CA");
        start.add("Detroit, MI");
        
        finish = new ArrayList<>();
        finish.add("Chicago, IL");
        finish.add("St. Louis, MO");
        finish.add("Nashville, TN");
        finish.add("Phoenix, AZ");
        finish.add("Austin, TX");
        finish.add("Miami, FL");
        finish.add("Norfolk, VA");
        finish.add("Seattle, WA");
        finish.add("Chicago, IL");
        finish.add("Nashville, TN");
    }

    public ArrayList<String> startCity()
    {
        return start;
    }

    public ArrayList<String> finishCity() 
    {
        return finish;
    }
}
