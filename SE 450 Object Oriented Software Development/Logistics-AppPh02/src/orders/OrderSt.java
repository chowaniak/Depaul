package orders;

import java.util.TreeMap;


public class OrderSt implements Order 
{
    private int ordNum;
    private String id;
    private int first;
    private String last;
    private TreeMap<String, Integer> ordItems;


    public OrderSt(int ordNumbIn, String idIn, int firstIn, String lastIn, TreeMap<String, Integer> ordItemsIn) 
    {
        setOrdNumb(ordNumbIn);
        setId(idIn);
        setFirst(firstIn);
        setLast(lastIn);
        setOrdItems(ordItemsIn);
    }

    private void setOrdNumb(int ordNumIn) 
    {
        ordNum = ordNumIn;
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

    private void setOrdItems(TreeMap<String, Integer> ordItemsIn) {
        ordItems = ordItemsIn;
    }

    public String getId() 
    {
        return id;
    }

    public int getOrdNum() 
    {
        return ordNum;
    }

    public int getFirst() 
    {
        return first;
    }

    public String getLast() 
    {
        return last;
    }

    private TreeMap<String, Integer> getOrdItems() 
    {
        return ordItems;
    }

    public TreeMap<String, Integer> ordItems()
    {
        TreeMap<String, Integer> prevOrd = getOrdItems();
        TreeMap<String, Integer> newOrd = new TreeMap<>();

        for (String id : prevOrd.keySet())
        {
            newOrd.put(id, prevOrd.get(id));
        }
        return newOrd;
    }

    public void placeHolder() 
    {
        System.out.println("StandardOrder.placeHolder()");
    }

       public void printOrder()
       {
        System.out.println("Order #" + ordNum);
        System.out.println("\tOrder Id:\t" + id);
        System.out.println("\tOrder Time:\tDay " + first);
        System.out.println("\tDestination:\t" + last);
        System.out.println("\tList of Order Items:");
        int counter = 1;
        for (String id: ordItems.keySet()){
            Integer quantity = ordItems.get(id);
            System.out.print("\t\t" + counter + ") Item ID:\t" + id + "\tQuantity: " + quantity + "\n");
            counter += 1;
        }
        System.out.println("\n");
    }
}
