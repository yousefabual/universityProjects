package part1;

public class MainCarQueue {

	public static void main(String[] args) {
		CarQueue car = new CarQueue();
		car.insert (20, "KiaSport" );
		car.insert (2, "RollsRoyce");
		car.insert (17, "NissanPathfinder");
		car.insert (25, "Honda");
		car.insert (1, "Bugatti");
		car.insert (30, "Smart");
		System.out.println(car.getMin());
		car.removeMin();
	}

}
