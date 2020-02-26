package orders;

import java.util.TreeMap;

public class OrderFactory 
{
    public static Order newOrder(int ordNum, String id, int first, String last, TreeMap<String, Integer> ordItems)
    {
        return new OrderSt(ordNum, id, first, last, ordItems);
    }
}



