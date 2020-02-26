package errors;

public class IlligalDataException extends Exception 
{
	private static final long serialVersionUID = 1L;
	public IlligalDataException(String errortext)
	{
		super(errortext);
	}
}
