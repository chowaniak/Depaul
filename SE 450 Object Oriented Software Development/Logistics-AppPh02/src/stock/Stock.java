package stock;

import errors.IllegalParmPassedException;
import errors.IlligalDataException;

public interface Stock 
{
	void stockIn(String id, Integer qt) throws IllegalParmPassedException;
	void stockOut(String id, Integer qt) throws IllegalParmPassedException;	
    boolean exists(String id) throws IlligalDataException;
    int getStock(String id) throws IlligalDataException;
    void printStock();
}
