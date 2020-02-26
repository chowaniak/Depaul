package stock;


import java.io.StringWriter;
import java.util.TreeMap;

import errors.IllegalParmPassedException;
import errors.IlligalDataException;

public class StockImpl implements Stock{

    private TreeMap<String, StockItems> stockTree;

    public StockImpl(TreeMap<String, StockItems> stock) throws IlligalDataException 
    {
        setStock(stock);
    }


    
    public boolean exists(String id) throws IlligalDataException
    {
        if (id == null)
        {
            throw new IlligalDataException("exists, id is null");
        }
        return stockTree.containsKey(id);
    }
    
    private void setStock(TreeMap<String, StockItems> stock) throws IlligalDataException 
    {
        if (stock == null)
        {
            throw new IlligalDataException("setStock, stock is null");
        } 
        stockTree = stock;
    }



    public int getStock(String id) throws IlligalDataException 
    {
        if (id == null)
        {
            throw new IlligalDataException("getStock, id is null");
        }
        return stockTree.get(id).getQt();
    }



    public void stockOut(String id, Integer qt) throws IllegalParmPassedException 
    {
        stockTree.get(id).stockQtOut(qt);
    }

    public void stockIn(String id, Integer qt) throws IllegalParmPassedException 
    {
        stockTree.get(id).stockQtIn(qt);
    }

 

    
    
    
    public void printStock()
    {
    	StringWriter string = new StringWriter();
    	System.out.printf("\n\nActive Inventory:\n");
        System.out.printf("\tItem ID\t\tQuantity\n");

        
        for (String id: stockTree.keySet())
        {
            Integer value = stockTree.get(id).getQt();
            System.out.println(String.format("\t%-12s\t%s", id, value));
            if (value.equals(0))
            {
                string.append(" ").append(id);
            }
        }

        if (string.toString().equals(""))
        {
            System.out.println("\nDepleted (Used-Up) Inventory: None");
        } 
        else 
        {
            System.out.println("\nDepleted (Used-Up) Inventory:" + string);
        }
    }
}
