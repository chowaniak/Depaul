package shortestpath;

import errors.IlligalDataException;

public class LinkSt implements TransInterface 
{

    private TransInterface links;

    public LinkSt(String facility, String connection, int connDist) throws IlligalDataException 
    {
        links = LinksFactory.buildLinks(facility, connection, connDist);
    }

    public int getConnDist() 
    {
        return links.getConnDist();
    }
    
    public String getConnection() 
    {
        return links.getConnection();
    }
    
    public String getCityIn() 
    {
        return links.getCityIn();
    }

    

    
}
