package items;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.TreeMap;
import org.w3c.dom.DOMException;
import org.xml.sax.SAXException;

import errors.IllegalParmPassedException;
import errors.IlligalDataException;


public interface ItemsInInterface 
{
    TreeMap<String, Items> loadData() throws DOMException, IllegalParmPassedException,
                                                   IlligalDataException, IOException,
                                                   ParserConfigurationException, SAXException;
}
