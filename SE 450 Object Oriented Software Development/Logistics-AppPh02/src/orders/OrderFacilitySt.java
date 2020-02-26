package orders;


public class OrderFacilitySt implements OrderFacRecInterface 
{
    private String city;
    private int qtAvail;
    private int end;
    private int time;
    private Integer receive;

    public OrderFacilitySt(String cityIn, int qtAvailIn, int endIn, int timeIn, int receiveIn) 
    {
        setCity(cityIn);
        setQtAvail(qtAvailIn);
        setEnd(endIn);
        setTime(timeIn);
        setReceive(receiveIn);
    }

    private void setCity(String cityIn) 
    {
        city = cityIn;
    }

    private void setQtAvail(int qtAvailIn) 
    {
        qtAvail = qtAvailIn;
    }

    private void setEnd(int endIn) 
    {
        end = endIn;
    }

    private void setTime(int timeIn) 
    {
        time = timeIn;
    }

    private void setReceive(Integer receiveIn) {
        receive = receiveIn;
    }

    public String getCity() 
    {
        return city;
    }

    public int getQtAvail() 
    {
        return qtAvail;
    }

    public int getEnd() 
    {
        return end;
    }

    public int getTime() 
    {
        return time;
    }

    public Integer getReceive() 
    {
        return receive;
    }

    @Override
    public int compareTo(OrderFacRecInterface rec) 
    {
        OrderFacilitySt stRec = (OrderFacilitySt) rec;
        int last = receive.compareTo(stRec.receive);
        return (last != 0 ? last : receive.compareTo(stRec.receive));
    }

    public void printFac()
    {
        System.out.println("Site name: " + city + "\nQuantity available: " + qtAvail  + "\nProcessing end day: " + end + "\nTravel Time: " + time + "\nArrival Day: " + receive + "\n");
    }
}



