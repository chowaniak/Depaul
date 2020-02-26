package stock;

import errors.IllegalParmPassedException;
import errors.IlligalDataException;

public class StockItemSt implements StockItems
{
    private String id;
    private Integer qt;

    public StockItemSt(String id, Integer qt) throws IlligalDataException, IllegalParmPassedException
    {
        setId(id);
        setQt(qt);
    }

    
    private void setQt(Integer qtIn) throws IllegalParmPassedException 
    {
        if (qtIn < 0)
        {
            throw new IllegalParmPassedException("setQt, qtIn should be more O");
        }
        qt = qtIn;
    }
    
    private void setId(String idIn) throws IlligalDataException 
    {
        if (idIn == null)
        {
            throw new IlligalDataException("setId, idIn is null");
        }
        id = idIn;
    }

    
    public int getQt() 
    {
        return qt;
    }


    public String getId() 
    {
    	return id;
    }

    public void stockQtOut(Integer qtIn) throws IllegalParmPassedException
    {
        if (qtIn < 0)
        {
            throw new IllegalParmPassedException("stockOut, qtIn should be more than 0");
        }
        qt -= qtIn;
    } 
    
    public void stockQtIn(Integer qtIn) throws IllegalParmPassedException
    {
        if (qtIn <= 0)
        {
            throw new IllegalParmPassedException("stockQtIn, qtIn shoould be more than 0");
        }
        qt += qtIn;
    }

   



}
