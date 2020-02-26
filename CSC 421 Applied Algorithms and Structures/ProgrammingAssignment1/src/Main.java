import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Main {
	@SuppressWarnings("resource")
	public static void main(String[] args) throws FileNotFoundException {
		
		int limit10 = 10;
		Scanner read10 = new Scanner(new File("10points.txt"));

		Points[] points10 = new Points[limit10];
		for (int i = 0; i < limit10; i++) {
			double x = read10.nextDouble();
			double y = read10.nextDouble();
			points10[i] = new Points(x, y);
		}

		ClosestPairOfPoints closestPair10 = new ClosestPairOfPoints(points10);
		System.out.printf("%d points test file:\n\n", limit10);
		System.out.printf("The Minimum Distance is:\n");
		System.out.printf("%.9f: ", closestPair10.dist());
		System.out.printf((closestPair10.either() + " <---> " + closestPair10.other()) + "\n\n\n");

		int limit100 = 100;
		Scanner read100 = new Scanner(new File("100points.txt"));

		Points[] points100 = new Points[limit100];
		for (int i = 0; i < limit100; i++) {
			double x = read100.nextDouble();
			double y = read100.nextDouble();
			points100[i] = new Points(x, y);
		}

		ClosestPairOfPoints closestPair100 = new ClosestPairOfPoints(points100);
		System.out.printf("%d points test file:\n\n", limit100);
		System.out.printf("The Minimum Distance is:\n");
		System.out.printf("%.10f: ", closestPair100.dist());
		System.out.printf(closestPair100.either() + " <---> " + closestPair100.other() + "\n\n\n");

		int limit1000 = 1000;
		Scanner read1000 = new Scanner(new File("1000points.txt"));

		Points[] points1000 = new Points[limit1000];
		for (int i = 0; i < limit1000; i++) {
			double x = read1000.nextDouble();
			double y = read1000.nextDouble();
			points1000[i] = new Points(x, y);
		}

		ClosestPairOfPoints closestPair1000 = new ClosestPairOfPoints(points1000);
		System.out.printf("%d points test file:\n\n", limit1000);
		System.out.printf("The Minimum Distance is:\n");
		System.out.printf("%.9f: ", closestPair1000.dist());
		System.out.printf(closestPair1000.other() + " <---> " + closestPair1000.either());

	}
}
