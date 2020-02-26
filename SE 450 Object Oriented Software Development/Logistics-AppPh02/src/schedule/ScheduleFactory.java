package schedule;

import errors.IlligalDataException;


public class ScheduleFactory 
{

    public static Schedule newSchedule(Integer facRate) throws IllegalArgumentException, IlligalDataException
    {
        return new ScheduleImpl(facRate);
    }

}
