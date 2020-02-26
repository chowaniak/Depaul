package schedule;


import java.util.TreeMap;

import errors.IlligalDataException;
import java.io.StringWriter;

public class ScheduleImpl implements Schedule
{
    private Integer schRate;
    private TreeMap<Integer, Integer> schTree;

    
    
    public ScheduleImpl(Integer in) throws IlligalDataException 
    {
        setSchRate(in);
        schTree = new TreeMap<>();
        newSch();
    }


    private void setSchRate(Integer in) throws IllegalArgumentException 
    {
        if (in <= 0)
        {
           throw new IllegalArgumentException("setSchRate, in should be more that 0");
        }
        schRate = in;
    }


    private void newSch() throws IlligalDataException 
    { 
        if (schTree.isEmpty()) 
        {
            for (int i = 1; i < 21; i++)
            {
                schTree.put(i, schRate);
            }
        }
    }
    public void newEntry(Integer in)
    {
    	schTree.put(in, schRate);            
    }
    
    
    public Integer checkAvail(Integer in)
    {
        return schTree.get(in);
    }

    public boolean existsEntry(Integer in) 
    {
        return schTree.containsKey(in);
    }

    public void downAvail(Integer in, Integer entry)
    {
        schTree.put(in, schTree.get(in) - entry);
    }

    
    
    public void printSchedule() 
    {
        System.out.printf("\nSchedule:\n");

        StringWriter string1 = new StringWriter();
        StringWriter string2 = new StringWriter();

        for (Integer key: schTree.keySet())
        {
            String stDay = key.toString();
            string1.append("\t").append(stDay);

            String value = schTree.get(key).toString();
            string2.append("\t").append(value);
        }
        System.out.println("Day:\t\t" + string1);
        System.out.println("Available:\t" + string2);
    }
}
