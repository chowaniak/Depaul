import java.util.Comparator;

public class Points implements Comparable<Points> {

	public static final Comparator<Points> CompareX = new ComparePointsByX();

	public static final Comparator<Points> CompareY = new ComparePointsByY();

	public double x;

	public double y;

		
	private static class ComparePointsByX implements Comparator<Points>, CompareInterface {
	
		public int compare(Points p, Points q) {
			if (p.x < q.x) {
				return -1;
			}
			if (p.x > q.x) {
				return +1;
			}
			return 0;
		}
	}
	private static class ComparePointsByY implements Comparator<Points> {
		public int compare(Points p, Points q) {
			if (p.y < q.y) {
				return -1;
			}
			if (p.y > q.y) {
				return +1;
			}
			return 0;
		}
	}


	public Points(double x, double y) {
		this.x = x;
		this.y = y;
	}

	public int compareTo(Points that) {
		if (this.y < that.y) {
			return -1;
		}
		if (this.y > that.y) {
			return +1;
		}
		if (this.x < that.x) {
			return -1;
		}
		if (this.x > that.x) {
			return +1;
		}
		return 0;
	}

	public String toString() {
		return "(" + (int) x + "," + (int) y + ")";
	}

	public double x() {
		return x;
	}

	public double xydist(Points that) {
		double xDist = this.x - that.x;
		double yDist = this.y - that.y;
		return Math.sqrt(xDist * xDist + yDist * yDist);
	}

	public double y() {
		return y;
	}
}
