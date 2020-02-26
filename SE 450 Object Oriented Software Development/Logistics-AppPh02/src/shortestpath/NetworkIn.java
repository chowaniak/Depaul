package shortestpath;

import java.io.IOException;
import java.util.TreeMap;
import org.xml.sax.SAXException;
import errors.IlligalDataException;

import javax.xml.parsers.ParserConfigurationException;


public final class NetworkIn 
{
    private final String networkname = "files/Networks.xml";
    private TreeMap<Integer, TransInterface> net = new TreeMap<>();
    private static NetworkIn inst = new NetworkIn();

    public static NetworkIn getInstance() 
    {
        if (inst == null)
        {
            inst = new NetworkIn();
        }
        return inst;
    }

    private NetworkIn(){
        setNet();
    }

    private void setNet()
    {
        try 
        {
            net = new NetworkInXml(networkname).loadAndReturnData();
        } 
        catch (IOException | SAXException | ParserConfigurationException |IlligalDataException e) 
        {
            e.printStackTrace();
        }
    }

    public TreeMap<Integer, TransInterface> getNet()
    {
        return net;
    }
}
