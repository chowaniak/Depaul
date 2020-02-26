package orders;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;
import java.util.TreeMap;
import shortestpath.SPManager;
import facilities.FacilityManager;
import items.ItemsManager;
import errors.IllegalParmPassedException;
import errors.IlligalDataException;

public class OrderProcessing 
{
    private static OrderProcessing instance;
    
    private final double trancost = 500.00;

    public void ordersPro() throws IlligalDataException, IllegalParmPassedException 
    {
        ArrayList<OrderDTO> orders = OrderManager.getInstance().getDTOList();
          
        for (OrderDTO order : orders)
        {
            order.displayDTO();
            TreeMap<String, Integer> tree = order.getOrdItems();
            double ordcost = 0.0;
            System.out.println("Processing Solution:\n");
          
            for (String items : tree.keySet())
            {
                ArrayList<OrderResInterface> outcome = new ArrayList<>();
                ArrayList<String> cities = FacilityManager.getInstance().getFacilities();

                if (ItemsManager.getInstance().existItem(items))
                {
                    int quantity = tree.get(items);
                    ArrayList<OrderFacRecInterface> sort = generateSolutions(quantity, order, items, tree, cities);
                    outcome = processRecords(outcome, sort, cities, quantity, order, items);

                    System.out.println(items + ":");
                    System.out.println("\t\tFacility\t\t\t\tQuantity\t\t\tCost\t\t\t\t\t\tArrival Day");
                    int i = 1;
                    for (OrderResInterface solOrd : outcome)
                    {
                        System.out.println("\t\t" + i + ") " + solOrd.toString());
                        i += 1;
                    }

                    ordcost += printOut(outcome);

                } else {System.out.println("Item not available: " + items);}
            }

            NumberFormat numb = NumberFormat.getCurrencyInstance(Locale.US);
            System.out.println("\n\t\tTotal Cost:\t\t" + numb.format(ordcost));
            System.out.println("---------------------------------------------------------------------------------------");
        }
    }
    
    private OrderProcessing()
    {}
    
    public static OrderProcessing getInstance()
    {
        if (instance == null) 
        {
            instance = new OrderProcessing();
        }
        return instance;
    }

    private ArrayList<OrderFacRecInterface> generateSolutions(int quantNeeded, OrderDTO order, String item, TreeMap<String, Integer> itemsTree, ArrayList<String> cities) throws IlligalDataException 
    {
        ArrayList<OrderFacRecInterface> outcome = new ArrayList<>();
        for (String city : cities)
        {
            if (FacilityManager.getInstance().exists(city, item) && !order.getLast().equals(city))
            {
                int quantity = FacilityManager.getInstance().getItemQuantity(city, item);

                int available = Math.min(quantity, quantNeeded);

                int routetime = (int) Math.ceil(getRouteTime(city, order.getLast()));

                int last = lastDay(order, available, city);

                int recday = last + routetime;

                if (available != 0) {
                    outcome.add(new OrderFacilitySt(city, available, last, routetime, recday));
                }
            }
        }

        Collections.sort(outcome);

        return outcome;
    }

    private ArrayList<OrderResInterface> processRecords(ArrayList<OrderResInterface> solutionList, ArrayList<OrderFacRecInterface> facilityRecords, ArrayList<String> facilityList, int quantNeeded, OrderDTO order, String item) throws IllegalParmPassedException {

        for (OrderFacRecInterface record : facilityRecords)
        {
            if (quantNeeded > 0) 
            { 
                String facilityName = record.getCity();
                int reductionQuant = stockOut(record, quantNeeded, item, facilityName);
                quantNeeded -= reductionQuant;
                int endDay = scheduleNew(order, reductionQuant, facilityName);
                double totalCost = findCost(item, facilityName, record, reductionQuant);
                int arrivalDay = endDay + record.getTime();
                solutionList.add(new OrderResSt(facilityName, reductionQuant, totalCost, arrivalDay));
            }
        }

        if (quantNeeded > 0) 
        {
            System.out.println(quantNeeded + " of " + item + " has/have been back ordered.\n");
        }
        return solutionList;
    }

    private float getRouteTime(String start, String finish) throws IlligalDataException 
    {
        SPManager.getInstance().getSP(start, finish);
        return SPManager.getInstance().getDays();
    }

    private int stockOut(OrderFacRecInterface record, int quantNeeded, String item, String city) throws IllegalParmPassedException 
    {	
        int quantOut = Math.min(quantNeeded, record.getQtAvail());
        FacilityManager.getInstance().inventoryOut(city, item, quantOut);
        return quantOut;
    }

    private int lastDay(OrderDTO order, int availQt, String city)
    {
        int present = order.getFirst();

        while (availQt != 0)
        {
            if (FacilityManager.getInstance().existsEntry(city, present))
            {
                int available = FacilityManager.getInstance().checkAvail(city, present);
                int scheduled = Math.min(available, availQt);
                availQt -= scheduled;
                present += 1;
            } 
            else 
            {
                FacilityManager.getInstance().newEntry(city, present);
                int available = FacilityManager.getInstance().checkAvail(city, present);
                int scheduled = Math.min(available, availQt);
                availQt -= scheduled;
                present += 1;
            }
        }
        return present - 1;
    }

    private int scheduleNew(OrderDTO order, int quantOut, String city)
    {
        int day = order.getFirst();
        while (quantOut != 0) 
        {
            int available = FacilityManager.getInstance().checkAvail(city, day);
            int toSchedule = Math.min(available, quantOut);
            if (available > 0) 
            {
                FacilityManager.getInstance().downAvail(city, day, toSchedule);
            }
            quantOut -= toSchedule;
            day += 1;
        }
        return day - 1;
    }

    private double findCost(String item, String city, OrderFacRecInterface record, int quantOut)
    {
    	double dayUpd = (double) quantOut / FacilityManager.getInstance().getRate(city);
    	double costExp = (double) ItemsManager.getInstance().getCost(item) * quantOut;
    	double dayExp = FacilityManager.getInstance().getCost(city);
    	double prodExp = dayUpd * dayExp;
        double pathExp = (double) record.getTime() * trancost;
        double allExp = costExp + prodExp + pathExp;
        return allExp;
    }

    private double printOut(ArrayList<OrderResInterface> result)
    {
        int firstDay = Integer.MAX_VALUE;
        int lastDay = Integer.MIN_VALUE;
    	int resQt = 0;
        double resExp = 0.0;

        for (OrderResInterface res : result)
        {
            resQt += res.getQt();
            resExp += res.getCost();
            	if (res.getDay() < firstDay)
            	{
            		firstDay = res.getDay();
            	}
            	if (res.getDay() > lastDay)
            	{
            		lastDay = res.getDay();
            	}
        }
        NumberFormat num = NumberFormat.getCurrencyInstance(Locale.US);
        System.out.println(String.format("%23s\t\t\t\t\t%d\t\t\t\t%s\t\t\t\t\t[%d - %d]\n", "TOTAL", resQt, num.format(resExp), firstDay, lastDay));
        return resExp;
    }
}


