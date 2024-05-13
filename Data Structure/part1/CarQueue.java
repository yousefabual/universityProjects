package part1;

public class CarQueue

{
	Car head;
	//Car rear;
	private class Car
	{
		private String data;
		private Car NextCarPlate;
		private int priority;	
		
	}
	
	public void insert(int priority, String data)
	{
		Car newCar = new Car(); // creating a New Node
		
		newCar.data=data; // give the node the data
		newCar.priority=priority; // set it's priority
		
		if (head==null) // Queue is empty
		{
			head=newCar; // assign the newCar as the head
		}
		
		else if(newCar.priority<head.priority) // if the priority number for 
			//new node is less than the priority number for the head node
		{
			newCar.NextCarPlate=head; //set the previous head as the next node to the new node
			head=newCar; // set the new node as the head
		}
		
		else
		{
			Car PriorityGuard=head;
			
			while ((PriorityGuard.NextCarPlate != null && newCar.priority>PriorityGuard.NextCarPlate.priority)) 
			{
				PriorityGuard = PriorityGuard.NextCarPlate;
			}
			// link the newCar with the counter next
			newCar.NextCarPlate = PriorityGuard.NextCarPlate;
			// link the counter with the new Car
			PriorityGuard.NextCarPlate = newCar;
		}
	}
		
		public String getMin()
		{			
			return head.data;
		}
		
		public void removeMin()
		{
			if (head!=null)
			{
			Car oldNode = head; // to remove the head node 
			head = head.NextCarPlate; // change the head to be the second car node
			oldNode.NextCarPlate = null; // remove the head node-- garbage collector :)
			}
			else // if the queue is empty
			{
				System.out.println("the car queue is empty");	
			}
		}	
}
