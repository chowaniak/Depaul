package items;

import java.io.File;
import java.io.IOException;
import java.util.TreeMap;
import org.w3c.dom.*;
import org.xml.sax.SAXException;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;


public class ItemsInXML implements ItemsInInterface 
{
    private String fileName;
    private TreeMap<String, Items> itemsMgr = new TreeMap<>();

    public ItemsInXML(String fileNameIn) throws IlligalDataException 
    {
        fileName(fileNameIn);
    }

    private void fileName(String fileIn) throws IlligalDataException 
    {
        if (fileIn == null)
        {
            throw new IlligalDataException("fileName, fileIn is null");
        }
        fileName = fileIn;
    }

    private String getFileName() 
    {
        return fileName;
    }

    public TreeMap<String, Items> loadData() throws DOMException, IllegalParmPassedException, IlligalDataException,
                                                          IOException, ParserConfigurationException, SAXException 
    {
            String fileName = getFileName();

            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();

            File xml = new File(fileName);
            if (!xml.exists()) 
            {
                System.err.println("**** XML File '" + fileName + "' cannot be found");
                System.exit(-1);
            }

            Document doc = db.parse(xml);
            doc.getDocumentElement().normalize();

            NodeList items = doc.getDocumentElement().getChildNodes();

            for (int i = 0; i < items.getLength(); i++) 
            {
                if (items.item(i).getNodeType() == Node.TEXT_NODE) 
                {
                    continue;
                }

                String name = items.item(i).getNodeName();
                if (!name.equals("Item")) 
                {
                    System.err.println("Unexpected node found: " + name);

                }

                NamedNodeMap aMap = items.item(i).getAttributes();
                String id = aMap.getNamedItem("Id").getNodeValue();
                Element elem = (Element) items.item(i);
                int cost = Integer.parseInt(elem.getElementsByTagName("Cost").item(0).getTextContent());

                Items item = new ItemsSt(id, cost);
                itemsMgr.put(item.getId(), item);
            }

        return itemsMgr;
    }
}

