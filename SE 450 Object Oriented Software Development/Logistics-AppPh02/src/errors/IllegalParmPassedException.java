package errors;

public class IllegalParmPassedException extends Exception 
{
	private static final long serialVersionUID = 1L;
	public IllegalParmPassedException(String errortext)
    {
    	super(errortext);
    }
}
