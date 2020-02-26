package orders;

import java.util.TreeMap;


public class OrderDTO 
{
    private int ordNum;
    private String id;
    private int first;
    private String last;
    private TreeMap<String, Integer> ordItems;

    public OrderDTO(int ordNumIn, String idIn, int firstIn, String lastIn, TreeMap<String, Integer> ordItemsIn) 
    {
        setOrdNumb(ordNumIn);
        setId(idIn);
        setFirst(firstIn);
        setLast(lastIn);
        setOrdItems(ordItemsIn);
    }

    private void setOrdNumb(int ordNumbIn) 
    {
        ordNum = ordNumbIn;
    }

    private void setId(String idIn) 
    {
        id = idIn;
    }

    private void setFirst(int firstIn) 
    {
        first = firstIn;
    }

    private void setLast(String lastIn) 
    {
        last = lastIn;
    }

    private void setOrdItems(TreeMap<String, Integer> ordItemsIn) 
    {
        ordItems = ordItemsIn;
    }

    public int getOrdNumb() 
    {
        return ordNum;
    }

    public String getId() 
    {
        return id;
    }

    public int getFirst() 
    {
        return first;
    }

    public String getLast() 
    {
        return last;
    }

    public TreeMap<String, Integer> getOrdItems() 
    {
        return ordItems;
    }

    public void displayDTO()
    {
        System.out.println("Order #" + ordNum);
        System.out.println("\tOrder Id:\t\t" + id);
        System.out.println("\tOrder Time:\t\tDay " + first);
        System.out.println("\tDestination:\t" + last);
        System.out.println("\n\tList of Order Items:");
        int counter = 1;
        for (String id: ordItems.keySet()){
            Integer quantity = ordItems.get(id);
            System.out.print("\t\t" + counter + ") Item ID:\t\t" + id + ",\t\tQuantity: " + quantity + "\n");
            counter += 1;
        }
        System.out.println("\n");
    }
}


