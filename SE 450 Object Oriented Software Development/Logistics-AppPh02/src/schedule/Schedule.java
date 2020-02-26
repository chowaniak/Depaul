package schedule;


public interface Schedule 
{
     void printSchedule();
     public void downAvail(Integer in, Integer entry);
     public Integer checkAvail(Integer in);
     boolean existsEntry(Integer in);
     public void newEntry(Integer in);
}


