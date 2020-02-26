package facilities;

import java.util.TreeMap;
import org.w3c.dom.DOMException;
import org.xml.sax.SAXException;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.ArrayList;


public class FacilityManager 
{
    private final String facilityname = "files/Facilities.xml";
    private static FacilityManager instance;
    private TreeMap<String, Facility> facilityMgr;
    private FacilityManager()
    {
    	
    }

    public static FacilityManager getInstance()
    {
        if (instance == null)
        {
            instance = new FacilityManager();
        }
        return instance;
    }

    public void facilities() throws DOMException, IlligalDataException, IOException, IllegalParmPassedException,ParserConfigurationException, SAXException 
    {
        FacilityInInterface facilityin = new FacilityInXML(facilityname);
        facilityMgr = facilityin.data();
    }


    public int getRate(String nameIn)
    {
        return facilityMgr.get(nameIn).getRate();
    }

    public int getCost(String nameIn)
    {
        return facilityMgr.get(nameIn).getCost();
    }

    public void printReports() 
    {
        for (String name: facilityMgr.keySet())
        {
            facilityMgr.get(name).printReport();
        }
    }

    public void printfacReport(String nameIn)
    {
        facilityMgr.get(nameIn).printReport();
    }


    public void downAvail(String fac, Integer in, Integer entry)
    {
        facilityMgr.get(fac).downAvail(in, entry);
    }
    
    public Integer checkAvail(String fac, Integer in)
    {
        return facilityMgr.get(fac).checkAvail(in);
    } 
    
    public boolean existsEntry(String fac, Integer in)
    {
        return facilityMgr.get(fac).existsEntry(in);
    }

    public void newEntry(String fac, Integer in){
        facilityMgr.get(fac).newEntry(in);
    }


    public boolean exists(String readFac, String readItem) throws IlligalDataException 
    {
        if (readFac == null)
        {
            throw new IlligalDataException("exists,readFac is null");
        }
        return facilityMgr.get(readFac).exists(readItem);
    }

    public int getItemQuantity(String facilityIn, String itemIn) throws IlligalDataException 
    {
        if (facilityIn == null)
        {
            throw new IlligalDataException("getItemQuantity, facilityIn is null");
        }

        return facilityMgr.get(facilityIn).getStock(itemIn);
    }

    public ArrayList<String> getFacilities()
    {
        ArrayList<String> facilities = new ArrayList<>();

        for (String key : facilityMgr.keySet())
        {
            facilities.add(key);
        }
        return facilities;
    }

    
    public void inventoryIn(String nameIn, String itemIn, Integer valueIn) throws IllegalParmPassedException
    {
        facilityMgr.get(nameIn).stockIn(itemIn, valueIn);
    }  


    public void inventoryOut(String nameIn, String itemIn, Integer valueIn) throws IllegalParmPassedException 
    {

        facilityMgr.get(nameIn).stockOut(itemIn, valueIn);
    }

    public TreeMap<String, Facility> getFacilites() 
    {
        return facilityMgr;
    }
}




