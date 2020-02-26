package orders;

import java.util.ArrayList;


public class OrderManager 
{

    private final String ordername = "files/Orders.xml";
    private static OrderManager instance;
    private ArrayList<Order> orders;

    private OrderManager(){}

    public static OrderManager getInstance(){
        if (instance == null) {
            instance = new OrderManager();
        }
        return instance;
    }

    public void orders()
    {
        OrderInInterface or = new OrdersInXML(ordername);
        orders = or.orders();
    }

    
    public ArrayList<OrderDTO> getDTOList(){

        ArrayList<OrderDTO> dtoList = new ArrayList<>();

        for (Order o : orders){
            OrderDTO dto = new OrderDTO(o.getOrdNum(), o.getId(), o.getFirst(),
                                        o.getLast(), o.ordItems());

            dtoList.add(dto);
        }
        return dtoList;
    }

    public void displayOrders()
    {
        for (Order o : orders)
        {
            o.printOrder();
        }
    }
}
