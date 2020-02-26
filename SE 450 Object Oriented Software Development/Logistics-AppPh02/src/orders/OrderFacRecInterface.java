package orders;

public interface OrderFacRecInterface extends Comparable<OrderFacRecInterface> 
{
    String getCity();
    int getQtAvail();
    int getEnd();
    int getTime();
    Integer getReceive();
    void printFac();
}


