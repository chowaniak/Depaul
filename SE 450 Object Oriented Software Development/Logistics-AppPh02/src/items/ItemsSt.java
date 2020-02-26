package items;

import errors.IllegalParmPassedException;
import errors.IlligalDataException;

public class ItemsSt implements Items
{
    private String id;
    private int cost;

    public ItemsSt(String id, int cost) throws IllegalParmPassedException, IlligalDataException 
    {
        setId(id);
        setCost(cost);
    }


    private void setId(String idRead) throws IlligalDataException 
    {
        if (idRead == null)
        		{
            throw new IlligalDataException("setId, IdRead is null");
        }
        id = idRead;
    }

    private void setCost(int costRead) throws IllegalParmPassedException 
    {
        if (costRead <= 0)
        {
            throw new IllegalParmPassedException("setCost, costRead should be more than 0");
        }
        cost = costRead;
    }

    
    
    public String getId() 
    {
        return id;
    }

    public int getCost() 
    {
        return cost;
    }

    
    public String printItem()
    {
       return String.format("%-8s : $%s", getId(), getCost());
    }






}
