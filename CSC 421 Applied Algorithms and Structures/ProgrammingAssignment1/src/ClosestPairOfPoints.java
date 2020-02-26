import java.util.Arrays;

public class ClosestPairOfPoints {

	
	private ClosestPairOfPointsData data = new ClosestPairOfPointsData(Double.POSITIVE_INFINITY);
	
	
	private static boolean less(Comparable a, Comparable b) {
		return (a.compareTo(b) < 0);
	}

	private static void merge(Comparable[] a, Comparable[] tempArray, int first, int mid, int last) {
		for (int k = first; k <= last; k++) {
			tempArray[k] = a[k];
		}

		int i = first, j = mid + 1;
		for (int k = first; k <= last; k++) {
			if (i > mid)
				a[k] = tempArray[j++];
			else if (j > last)
				a[k] = tempArray[i++];
			else if (less(tempArray[j], tempArray[i]))
				a[k] = tempArray[j++];
			else
				a[k] = tempArray[i++];
		}
	}

	

	public ClosestPairOfPoints(Points[] points) {
		int length = points.length;
		if (length <= 3)
			return;

		Points[] sortByX = new Points[length];
		for (int i = 0; i < length; i++) {
			sortByX[i] = points[i];
		}
		Arrays.sort(sortByX, Points.CompareX);

		for (int i = 0; i < length - 1; i++) {
			if (sortByX[i].equals(sortByX[i + 1])) {
				data.dist = 0.0;
				data.closestA = sortByX[i];
				data.closestB = sortByX[i + 1];
				return;
			}
		}

		Points[] sortByY = new Points[length];
		for (int i = 0; i < length; i++) {
			sortByY[i] = sortByX[i];
		}

		Points[] tempA = new Points[length];

		closest(sortByX, sortByY, tempA, 0, length - 1);
	}

	private double closest(Points[] sortByX, Points[] sortByY, Points[] tempB, int first, int last) {
		if (last <= first) {
			return Double.POSITIVE_INFINITY;
		}

		int middle = first + (last - first) / 2;
		Points median = sortByX[middle];

		double dist1 = closest(sortByX, sortByY, tempB, first, middle);

		double dist2 = closest(sortByX, sortByY, tempB, middle + 1, last);

		double delta = Math.min(dist1, dist2);

		merge(sortByY, tempB, first, middle, last);

		int N = 0;
		for (int i = first; i <= last; i++) {
			if (Math.abs(sortByY[i].x() - median.x()) < delta)
				tempB[N++] = sortByY[i];
		}

		for (int i = 0; i < N; i++) {
			for (int j = i + 1; (j < N) && (tempB[j].y() - tempB[i].y() < delta); j++) {
				double distance = tempB[i].xydist(tempB[j]);
				if (distance < delta) {
					delta = distance;
					if (distance < data.dist) {
						data.dist = delta;
						data.closestA = tempB[i];
						data.closestB = tempB[j];
					}
				}
			}
		}
		return delta;
	}

	public double dist() {
		return data.dist;
	}

	public Points either() {
		return data.closestA;
	}

	public Points other() {
		return data.closestB;
	}
}
