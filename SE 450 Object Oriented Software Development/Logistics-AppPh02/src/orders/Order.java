package orders;

import java.util.TreeMap;


public interface Order 
{
    void placeHolder();
    int getFirst();
    String getLast();
    void printOrder();
    String getId();
    int getOrdNum();
    TreeMap<String, Integer> ordItems();
}
