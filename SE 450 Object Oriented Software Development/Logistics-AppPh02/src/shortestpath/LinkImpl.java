package shortestpath;


import errors.IlligalDataException;

public class LinkImpl implements TransInterface 
{

    private String connFac;
    private String conn;
    private int connDist;

    public LinkImpl(String facIn, String connIn, int connDistIn) throws IlligalDataException 
    {
        setFac(facIn);
        setConn(connIn);
        setConnDist(connDistIn);
    }

    private void setFac(String facIn) throws IlligalDataException 
    {
        if (facIn == null) 
        {
            throw new IlligalDataException("setFac, facIn is null");
        }
        connFac = facIn;
    }

    private void setConn(String connIn) throws IlligalDataException 
    {
        if (connIn == null) 
        {
            throw new IlligalDataException("setConn, connIn is null");
        }
        conn = connIn;
    }

    private void setConnDist(int connDistIn) throws IlligalDataException 
    {
        if (connDistIn <= 0) 
        {
            throw new IlligalDataException("setConnDist, connDist should be more than O");
        }
        connDist = connDistIn;
    }

    public String getCityIn() {
        return connFac;
    }

    public String getConnection(){
        return conn;
    }

    public int getConnDist(){
        return connDist;
    }

}
