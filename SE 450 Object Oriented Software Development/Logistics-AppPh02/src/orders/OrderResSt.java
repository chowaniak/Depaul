package orders;

import java.util.Locale;
import java.text.NumberFormat;


public class OrderResSt implements OrderResInterface 
{
    private String city;
    private int day;
    private int qt;
    private double cost;
    

    public OrderResSt(String cityIn, int qtIn, double costIn, int dayIn) 
    {
        setCity(cityIn);
        setDay(dayIn);
        setQt(qtIn);
        setCost(costIn);
    }

    private void setCity(String cityIn) 
    {
        city = cityIn;
    }

    private void setQt(int qtIn) 
    {
        qt = qtIn;
    }

    private void setCost(double costIn) 
    {
        cost = costIn;
    }

    private void setDay(int dayIn) 
    {
        day = dayIn;
    }

    public void printOrderRes()
    {
        System.out.println(city + "\t" + qt + "\t" + "\t$" + String.format("%.2f", cost) + "\t" + day);
    }

    @Override
    public String toString()
    {
        NumberFormat f = NumberFormat.getCurrencyInstance(Locale.US);
        return String.format("%-18s\t\t\t%d\t\t\t\t%s\t\t\t\t\t%d", getFac(), getQt(), f.format(getCost()), getDay());
    }

    public String getFac() 
    {
        return city;
    }

    public int getQt() 
    {
        return qt;
    }

    public double getCost() 
    {
        return cost;
    }

    public int getDay() 
    {
        return day;
    }
}
