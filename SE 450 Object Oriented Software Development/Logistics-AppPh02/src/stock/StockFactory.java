package stock;

import java.util.TreeMap;

import errors.IlligalDataException;

public class StockFactory 
{
    public static Stock newStock(TreeMap<String, StockItems> stock) throws NullPointerException,IlligalDataException
    {
        return new StockImpl(stock);
    }
}



