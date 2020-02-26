package facilities;

import java.util.TreeMap;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;
import stock.StockItems;

public class FacilityFactory
{
    public static Facility newFacility(String name, int rate, int cost, TreeMap<String, Integer> links,TreeMap<String, StockItems> stock) throws IllegalParmPassedException,NullPointerException, IlligalDataException
    {
        return new FacilityImpl(name, rate, cost, links, stock);
    }
}
