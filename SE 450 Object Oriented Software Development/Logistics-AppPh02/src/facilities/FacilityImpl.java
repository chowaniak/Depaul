package facilities;

import schedule.Schedule;
import schedule.ScheduleFactory;
import stock.StockItems;
import stock.Stock;
import stock.StockFactory;
import java.io.StringWriter;
import java.text.NumberFormat;
import java.util.TreeMap;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;


public class FacilityImpl implements Facility 
{
    private String name;
    private int cost;
    private Integer rate;
    private Stock stock;
    private Schedule schedule;
    private TreeMap<String, Integer> links;
    
    

    public FacilityImpl(String nameIn, Integer rateIn, int costIn, TreeMap<String, Integer> links,
                        TreeMap<String, StockItems> invIn) throws IllegalParmPassedException, IlligalDataException
    {
        setName(nameIn);
        setRate(rateIn);
        setMyInv(invIn);
        setLinks(links);
        setSchedule(rateIn);
        setProdCost(costIn);
    }

    private void setName(String nameIn) throws IlligalDataException 
    {
        if (nameIn == null)
        {
            throw new IlligalDataException("setName, nameIn is null");
        }
        name = nameIn;
    }

    
    private void setRate(Integer rateIn) throws IllegalParmPassedException 
    {
        if (rateIn <= 0)
        {
            throw new IllegalParmPassedException("setRate, rateIn should be more than 0");
        }
        rate = rateIn;
    }

    
    private void setMyInv(TreeMap<String, StockItems> invIn) throws IlligalDataException 
    {
        stock = StockFactory.newStock(invIn);
    }
  
    
    private void setLinks(TreeMap<String, Integer> linksIn) throws IlligalDataException 
    {
        if (linksIn == null)
        {
            throw new IlligalDataException("setLinks, linkIn is null");
        } 
        links = linksIn;
    } 
    
    
    
    private void setProdCost(int costIn) throws IllegalParmPassedException 
    {
        if (costIn <= 0)
        {
            throw new IllegalParmPassedException("setProdCost, costIn should be more that 0");
        }
        cost = costIn;
    }

    private void setSchedule(Integer rateIn) throws IllegalParmPassedException, IlligalDataException 
    {
        schedule = ScheduleFactory.newSchedule(rateIn);
    }

    public String getFName() 
    {
        return name;
    }

    public int getRate() 
    {
        return rate;
    }

    public int getCost() 
    {
        return cost;
    }

    public void downAvail(Integer in, Integer entry)
    {
        schedule.downAvail(in, entry);
    }
    
    public Integer checkAvail(Integer in)
    {
        return schedule.checkAvail(in);
    }
    
    public boolean existsEntry(Integer in)
    {
        return schedule.existsEntry(in);
    }

    public void newEntry(Integer in)
    {
        schedule.newEntry(in);
    }

    
    public void stockIn(String id, Integer qt) throws IllegalParmPassedException 
    {
        stock.stockIn(id, qt);
    }
    
    public void stockOut(String id, Integer qt) throws IllegalParmPassedException 
    {
        stock.stockOut(id, qt);
    }
    
    public boolean exists(String id) throws IlligalDataException 
    {
        return stock.exists(id);
    }

    public int getStock(String id) throws IlligalDataException 
    {
        return stock.getStock(id);
    }

    
    private void printLinks()
    {
        StringWriter string = new StringWriter();
        for (String city: links.keySet())
        {
            double value = links.get(city);
            String days = Double.toString(Math.round((value/400)*10d)/10d);
            string.append(city).append(" (").append(days).append("d); ");
        }
        System.out.println("Direct Links:\n" + string);
    }
    
    
    private void printLine() 
    {
		int i =1;
        for (i=1; i<90;i++)
        	System.out.printf("-");
	}
    
    
    public void printReport() 
    {
		printLine();
        System.out.printf("\n" + getFName());
        System.out.printf("\n-------");
        System.out.printf("\nRate per day: " + getRate());
        NumberFormat n = NumberFormat.getNumberInstance();
        System.out.printf("\nCost per Day: $" + n.format(getCost()) + "\n");
        printLinks();
        stock.printStock();
        schedule.printSchedule();
        printLine();
        System.out.printf("\n");
    }  
}
