package shortestpath;

import java.util.ArrayList;
import java.io.StringWriter;
import java.text.NumberFormat;
import errors.IlligalDataException;


public final class SPManager 
{

    private static String startCity;
    private static String finishCity;
    private static int startFinish;
    private final float maxRoute = 400;
    private static ArrayList route = new ArrayList();
    private static SPManager inst = new SPManager();
    private static float totalTravel;
    
    

    public static SPManager getInstance() 
    {
        if (inst == null)
        {
            inst = new SPManager();
        }
        return inst;
    }

    private SPManager() 
    {
    }

   
    public void printSP() throws IlligalDataException 
    {
        PrintShortestPath printSP = new PrintShortestPath();
        ArrayList<String> start = printSP.startCity();
        ArrayList<String> finish = printSP.finishCity();

        for (int i = 0; i < start.size(); i++) {
            getSP(start.get(i), finish.get(i));
            printRouteInfo();
        }
    }

    public void getSP(String startCityIn, String finishCityIn) throws IlligalDataException 
    {
        if (startCityIn == null) 
        {
            throw new IlligalDataException("getSP, startCityIn is null");
        }
        if (finishCityIn == null) 
        {
            throw new IlligalDataException("getSP, finishCity is null");
        }
        startCity = startCityIn;
        finishCity = finishCityIn;
        shortestPath();
        totalTravel();
    }

    private void shortestPath() throws IlligalDataException 
    {
        route = new ShortestPath(startCity, finishCity).getRoute();
        startFinish = ShortestPath.getLength();
    }

    public int getstartFinish()
    {
        return startFinish;
    }

    public float getDays()
    {
        return totalTravel;
    }

    public ArrayList route()
    {
        return route;
    }

    public String getStartCity()
    {
        return startCity;
    }

    public String getfinishCity()
    {
        return finishCity;
    }

    private String formatDistance(){
        int pathDistance = getstartFinish();
        String formattedDistance = NumberFormat.getIntegerInstance().format(pathDistance);
        return formattedDistance;
    }

    private float totalTravel()
    {
        totalTravel = (startFinish / maxRoute);
        return totalTravel;
    }

 
    private StringWriter printRoute()
    {
        ArrayList printRoute = route;
        StringWriter shortestPath = new StringWriter();

        for (int i = 0; i < printRoute.size(); i++)
        {
            String city = printRoute.get(i).toString();
            if (i < printRoute.size()-1)
            {
                shortestPath.append(city + " >>> ");
            }
            else 
            {
                shortestPath.append(city + " =" + " " + formatDistance() + " mi");
            }
        }

        printRoute.clear(); 
        return shortestPath;
    }

    public void printRouteInfo() 
    {
        System.out.println(startCity + " " + "to " + finishCity + ":");
        System.out.println(printRoute());
        System.out.printf(formatDistance() + " mi / (8 hours per day * 50 mph) = " + "%.2f days", totalTravel());
        System.out.println("\n");
    }
}
