package stock;


import errors.IllegalParmPassedException;

public interface StockItems 
{
	void stockQtIn(Integer in) throws IllegalParmPassedException;
	void stockQtOut(Integer in) throws IllegalParmPassedException;
	String getId();
    int getQt();
}
