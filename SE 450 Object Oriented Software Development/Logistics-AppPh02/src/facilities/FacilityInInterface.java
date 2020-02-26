package facilities;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.TreeMap;
import org.w3c.dom.DOMException;
import org.xml.sax.SAXException;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;



public interface FacilityInInterface 
{
    TreeMap<String, Facility> data() throws DOMException, IlligalDataException, IOException,IllegalParmPassedException, ParserConfigurationException,SAXException;
}
