
import facilities.FacilityManager;
import items.ItemsManager;
import orders.OrderManager;
import orders.OrderProcessing;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import org.w3c.dom.DOMException;
import org.xml.sax.SAXException;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;

public class Main 
{
    public static void main(String[] args) throws DOMException, IllegalParmPassedException, IlligalDataException, IOException, ParserConfigurationException, SAXException 
    {
		ItemsManager.getInstance().items();
		FacilityManager.getInstance().facilities();
        FacilityManager.getInstance().printReports(); 
        OrderManager.getInstance().orders();
        OrderProcessing.getInstance().ordersPro();
        FacilityManager.getInstance().printReports(); 
    }
}