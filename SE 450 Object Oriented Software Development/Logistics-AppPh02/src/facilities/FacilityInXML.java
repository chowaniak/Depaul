package facilities;

import org.w3c.dom.*;
import org.xml.sax.SAXException;

import errors.IllegalParmPassedException;
import errors.IlligalDataException;
import items.ItemsManager;
import stock.StockItems;
import stock.StockItemSt;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.TreeMap;

public class FacilityInXML implements FacilityInInterface
{
    private String name;
    private TreeMap<String, Facility> facilityManager = new TreeMap<>();

    public FacilityInXML(String nameIn) 
    {
        setName(nameIn);
    }

    private void setName(String nameIn) 
    {
        name = nameIn;
    }

    private String getName() 
    {
        return name;
    }

    public TreeMap<String, Facility> data() throws DOMException, IlligalDataException, IOException,IllegalParmPassedException, ParserConfigurationException,SAXException 
    {
            String file = getName();

            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();

            File xml = new File(file);
            if (!xml.exists()) {
                System.err.println("**** XML File '" + file + "' cannot be found");
                System.exit(-1);
            }

            Document doc = db.parse(xml);
            doc.getDocumentElement().normalize();

            NodeList facilityNodes = doc.getDocumentElement().getChildNodes();

            for (int i = 0; i < facilityNodes.getLength(); i++) 
            {
                if (facilityNodes.item(i).getNodeType() == Node.TEXT_NODE) 
                {
                    continue;
                }

                String facNode = facilityNodes.item(i).getNodeName();
                if (!facNode.equals("Facility")) 
                {
                    System.err.println("Unexpected node found: " + facNode);
                }

                
                NamedNodeMap aMap = facilityNodes.item(i).getAttributes();
                String name = aMap.getNamedItem("Id").getNodeValue();
                Element elem = (Element) facilityNodes.item(i);
                Integer rate = Integer.parseInt(elem.getElementsByTagName("Rate").item(0).getTextContent());
                int cost = Integer.parseInt(elem.getElementsByTagName("Cost").item(0).getTextContent());

                TreeMap<String, Integer> connection = new TreeMap<>();
                TreeMap<String, StockItems> stock = new TreeMap<>();
                NodeList connections = elem.getElementsByTagName("Link");
                NodeList items = elem.getElementsByTagName("Item");

              
                for (int j = 0; j < connections.getLength(); j++) 
                {
                    if (connections.item(j).getNodeType() == Node.TEXT_NODE) 
                    {
                        continue;
                    }

                    facNode = connections.item(j).getNodeName();
                    if (!facNode.equals("Link")) 
                    {
                        System.err.println("Unexpected node found: " + facNode);
                    }

                    elem = (Element) connections.item(j);
                    String facilityconnections = elem.getElementsByTagName("City").item(0).getTextContent();
                    Integer facilitydistance = Integer.parseInt(elem.getElementsByTagName("Dist").item(0).getTextContent());
                    connection.put(facilityconnections, facilitydistance);
                }

                
                for (int j = 0; j < items.getLength(); j++) 
                {

                    if (items.item(j).getNodeType() == Node.TEXT_NODE) 
                    {
                        continue;
                    }

                    facNode = items.item(j).getNodeName();
                    if (!facNode.equals("Item")) 
                    {
                        System.err.println("Unexpected node found: " + facNode);
                    }

                    elem = (Element) items.item(j);
                    String eItem = elem.getElementsByTagName("ItemName").item(0).getTextContent();
                    Integer eQuant = Integer.parseInt(elem.getElementsByTagName("Quantity").item(0).getTextContent());

                    if (ItemsManager.getInstance().existItem(eItem))
                    {
                        StockItems item = new StockItemSt(eItem, eQuant);
                        stock.put(item.getId(), item);
                    } 
                    else 
                    {
                        throw new IllegalParmPassedException("StockItems incorrect Item.");
                    }

                }

                Facility facility = new FacilitySt(name, rate, cost, connection, stock);
                facilityManager.put(facility.getFName(), facility);

            }

        return facilityManager;
    }

}


