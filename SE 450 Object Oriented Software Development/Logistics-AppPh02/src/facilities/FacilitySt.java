package facilities;

import java.util.TreeMap;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;
import stock.StockItems;

public class FacilitySt implements Facility 
{

    private Facility facilityExm;



   
    public FacilitySt(String name, int rate, int cost, TreeMap<String, Integer> links,TreeMap<String, StockItems> inventory) throws IllegalParmPassedException, NullPointerException,IlligalDataException 
    {
        facilityExm = FacilityFactory.newFacility(name, rate, cost, links, inventory);
    }

    public void printReport() 
    {
        facilityExm.printReport();
    }

    public String getFName() 
    {
        return facilityExm.getFName();
    }

    public int getRate() 
    {
        return facilityExm.getRate();
    }

    public int getCost() 
    {
        return facilityExm.getCost();
    }

  
    public boolean exists(String idIn) throws IlligalDataException
    {
        return facilityExm.exists(idIn);
    }

    public int getStock(String idIn) throws IlligalDataException 
    {
        return facilityExm.getStock(idIn);
    }

    public void stockIn(String id, Integer quantity) throws IllegalParmPassedException 
    {
        facilityExm.stockIn(id, quantity);
    }
    
    public void stockOut(String id, Integer quantity) throws IllegalParmPassedException 
    {
        facilityExm.stockOut(id, quantity);
    }

    public void downAvail(Integer dayIn, Integer valueIn)
    {
        facilityExm.downAvail(dayIn, valueIn);
    }

    public Integer checkAvail(Integer dayIn){
        return facilityExm.checkAvail(dayIn);
    }
    
    public boolean existsEntry(Integer dayIn){
        return facilityExm.existsEntry(dayIn);
    }

    public void newEntry(Integer dayIn){
        facilityExm.newEntry(dayIn);
    }

}
