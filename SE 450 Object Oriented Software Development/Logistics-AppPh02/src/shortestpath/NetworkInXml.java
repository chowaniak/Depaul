package shortestpath;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.TreeMap;
import org.w3c.dom.*;
import org.xml.sax.SAXException;
import errors.IlligalDataException;


public class NetworkInXml implements NetworkInInterface 
{
    private String file;
    private TreeMap<Integer, TransInterface> links = new TreeMap<>();
    public NetworkInXml(String fileIn) throws IlligalDataException 
    {
        if (fileIn == null)
        {
            throw new IlligalDataException("NetworkXml, fileIn is null");
        }
        setName(fileIn);
    }

    private void setName(String fileIn) 
    {
        file = fileIn;
    }

    public TreeMap<Integer, TransInterface> loadAndReturnData() throws IOException, SAXException, ParserConfigurationException, IlligalDataException 
    {
        setLinks();
        return getLinks();
    }
    
    
    private void setLinks() throws IOException, SAXException, ParserConfigurationException, IlligalDataException 
    {
        loadData(file);
    }

  

    public TreeMap<Integer, TransInterface> getLinks() 
    {
        return links;
    }

    private void loadData(String fileName) throws ParserConfigurationException, IOException, SAXException, IlligalDataException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();

        File xml = new File(fileName);
        if (!xml.exists()) {
            throw new IlligalDataException ("NetworkXmlReader.loadData(string); **** XML File '" + fileName + "' cannot be found");
        }

        Document doc = db.parse(xml);
        doc.getDocumentElement().normalize();

        NodeList networkNodes = doc.getDocumentElement().getChildNodes();

        int count = 0;
        for (int i = 0; i < networkNodes.getLength(); i++) {
            if (networkNodes.item(i).getNodeType() == Node.TEXT_NODE) 
            {
                continue;
            }
            String entryName = networkNodes.item(i).getNodeName();
            if (!entryName.equals("Facility")) 
            {
            	System.err.println("Unexpected node found: " + entryName);
            }

            NamedNodeMap aMap = networkNodes.item(i).getAttributes();
            String facility = aMap.getNamedItem("Id").getNodeValue();

            Element elem = (Element) networkNodes.item(i);

            NodeList connections = elem.getElementsByTagName("Connection");

            for (int j = 0; j < connections.getLength(); j++) 
            {
                entryName = connections.item(j).getNodeName();
                if (!entryName.equals("Connection")) 
                {
                    throw new IlligalDataException("NetworkInXml, wrong entryName");
                }

                elem = (Element) connections.item(j);
                String connId = elem.getElementsByTagName("ConId").item(0).getTextContent();
                int connDist = Integer.parseInt(elem.getElementsByTagName("ConDist").item(0).getTextContent());

                TransInterface facconnections = new LinkSt(facility, connId, connDist);
                links.put(count, facconnections);
                count++;
            }
        }
    }
}
