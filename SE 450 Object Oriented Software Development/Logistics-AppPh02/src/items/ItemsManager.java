package items;

import java.io.IOException;
import java.io.StringWriter;
import java.util.TreeMap;
import org.w3c.dom.DOMException;
import org.xml.sax.SAXException;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;
import javax.xml.parsers.ParserConfigurationException;


public class ItemsManager 
{
    private final String itemsxml = "files/Items.xml";
    private static ItemsManager inst;
    private TreeMap<String, Items> itemManager;

    private ItemsManager()
    {
    	
    }

    public static ItemsManager getInstance()
    {
        if (inst == null)
        {
            inst = new ItemsManager();
        }
        return inst;
    }

    public void items() throws DOMException, IllegalParmPassedException,IlligalDataException, IOException,ParserConfigurationException, SAXException 
    {
        ItemsInInterface ld = new ItemsInXML(itemsxml);
        itemManager = ld.loadData();
    }

   
    public int getCost(String itemId)
    {
        return itemManager.get(itemId).getCost();
    }

    public boolean existItem(String idIn) throws IlligalDataException 
    {
        if (idIn == null)
        {
            throw new IlligalDataException("existItem, idIn is null");
        }
        return itemManager.containsKey(idIn);
    }

    public void printItems() 
    {
        StringWriter printItems = new StringWriter();
        
        for (String string: itemManager.keySet())
        {
            printItems.append(String.format("%-30s", itemManager.get(string).printItem())).append("\n");
        }
        System.out.println(printItems);
    }
}
