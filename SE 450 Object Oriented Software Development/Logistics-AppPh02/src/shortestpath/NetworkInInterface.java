package shortestpath;

import java.io.IOException;
import java.util.TreeMap;
import org.xml.sax.SAXException;
import errors.IlligalDataException;

import javax.xml.parsers.ParserConfigurationException;

public interface NetworkInInterface 
{
    TreeMap<Integer, TransInterface> loadAndReturnData() throws IOException, SAXException, ParserConfigurationException, IlligalDataException;
    TreeMap<Integer, TransInterface> getLinks();
}
