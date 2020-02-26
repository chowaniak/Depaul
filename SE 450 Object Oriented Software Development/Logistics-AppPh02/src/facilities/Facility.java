package facilities;

import errors.IllegalParmPassedException;
import errors.IlligalDataException;

public interface Facility 
{
	int getRate();
    int getCost();
    void printReport();
    String getFName();
    void stockOut(String id, Integer qt) throws IllegalParmPassedException;
    void stockIn(String id, Integer qt) throws IllegalParmPassedException;
    boolean exists(String id) throws IlligalDataException;
    int getStock(String id) throws IlligalDataException;
    public void downAvail(Integer in, Integer entry);
    public Integer checkAvail(Integer in);
    boolean existsEntry(Integer in);
    public void newEntry(Integer in);
    

}
