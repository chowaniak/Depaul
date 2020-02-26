package orders;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeMap;
import org.w3c.dom.*;
import org.xml.sax.SAXException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;



public class OrdersInXML implements OrderInInterface 
{
    private String file;
    private ArrayList<Order> ordersMgr = new ArrayList<>();

    public OrdersInXML(String fileIn) 
    {
        setFile(fileIn);
    }

    private void setFile(String fileIn) 
    {
        file = fileIn;
    }

    private String getFile() 
    {
        return file;
    }

    public ArrayList<Order> orders()
    {
        String name = getFile();

        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = null;
        try {
            db = dbf.newDocumentBuilder();
        } catch (ParserConfigurationException e) 
        {
            e.printStackTrace();
        }

        File xml = new File(name);
        if (!xml.exists()) 
        {
            System.err.println("**** XML File '" + name + "' cannot be found");
            System.exit(-1);
        }

        Document doc = null;
        try {
            doc = db.parse(xml);
        } catch (SAXException e) 
        {
            e.printStackTrace();
        } catch (IOException e) 
        {
            e.printStackTrace();
        }
        doc.getDocumentElement().normalize();

        NodeList orderNodes = doc.getDocumentElement().getChildNodes();

        int ordNum = 1;

        for (int i = 0; i < orderNodes.getLength(); i++) 
        {

            if (orderNodes.item(i).getNodeType() == Node.TEXT_NODE) 
            {
                continue;
            }

            String entryName = orderNodes.item(i).getNodeName();
            if (!entryName.equals("Order")) {
                System.err.println("Unexpected node found: " + entryName);
            }

            NamedNodeMap aMap = orderNodes.item(i).getAttributes();
            String ordId = aMap.getNamedItem("Id").getNodeValue();
            Element elem = (Element) orderNodes.item(i);
            int first = Integer.parseInt(elem.getElementsByTagName("First").item(0).getTextContent());
            String last = elem.getElementsByTagName("Last").item(0).getTextContent();

            TreeMap<String, Integer> ordItems = new TreeMap<>();
            NodeList items = elem.getElementsByTagName("Item");

            for (int j = 0; j < items.getLength(); j++) 
            {
                if (items.item(j).getNodeType() == Node.TEXT_NODE) 
                {
                    continue;
                }

                entryName = items.item(j).getNodeName();
                if (!entryName.equals("Item")) 
                {
                    System.err.println("Unexpected node found: " + entryName);
                }

                elem = (Element) items.item(j);
                String itemId = elem.getElementsByTagName("ItemId").item(0).getTextContent();
                Integer itemQt = Integer.parseInt(elem.getElementsByTagName("ItemQt").item(0).getTextContent());
                ordItems.put(itemId, itemQt);

            }

            Order o = OrderFactory.newOrder(ordNum, ordId, first, last, ordItems);
            ordersMgr.add(o);
            ordNum +=1;

        }

        return ordersMgr;


    }
}
