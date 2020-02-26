package shortestpath;

import errors.IlligalDataException;

public class LinksFactory 
{
    public static TransInterface buildLinks(String facIn, String connIn, int connDistIn) throws IlligalDataException {

        return new LinkImpl(facIn, connIn, connDistIn);
    }
}
