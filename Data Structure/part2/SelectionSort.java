package part2;

public class SelectionSort {

	public static void main(String[] args) 
	{
	  int []arrSort1 = new int[5000];
	  int []arrSort2 = new int[50000];
	  int []arrSort3 = new int[500000];
	  long t1,t2;
//..............................................
// Sorting the lists Ascending	
	  
		for (int i=0;i<arrSort1.length;i++)
		{
			arrSort1[i]=i;
		}
		t1=System.nanoTime();// time when starting
		selectionSort(arrSort1);
		t2=System.nanoTime();//time when finishing
		System.out.println("the time for 5000 sorted asc is:"+ (t2-t1)); //print the time difference
		
		for (int i=0;i<arrSort2.length;i++)
		{
			arrSort2[i]=i;
		}
		t1=System.nanoTime();
		selectionSort(arrSort2);
		t2=System.nanoTime();
		System.out.println("the time for 50000 sorted asc is:"+ (t2-t1));
		
		for (int i=0;i<arrSort3.length;i++)
		{
			arrSort3[i]=i;
		}
		t1=System.nanoTime();
		selectionSort(arrSort3);
		t2=System.nanoTime();
		System.out.println("the time for 500000 sorted asc is:"+ (t2-t1));
//...............................................
// Sorting the lists descending	
		
		for (int i=0;i<arrSort1.length;i++)
		{
			arrSort1[i]=arrSort1.length-i;
		}
		t1=System.nanoTime();
		selectionSort(arrSort1);
		t2=System.nanoTime();
		System.out.println("the time for 5000 sorted des is:"+ (t2-t1));
		
		for (int i=0;i<arrSort2.length;i++)
		{
			arrSort2[i]=arrSort2.length-i;
		}
		t1=System.nanoTime();
		selectionSort(arrSort2);
		t2=System.nanoTime();
		System.out.println("the time for 50000 sorted des is:"+ (t2-t1));
		
		for (int i=0;i<arrSort3.length;i++)
		{
			arrSort3[i]=arrSort3.length-i;
		}
		t1=System.nanoTime();
		selectionSort(arrSort3);
		t2=System.nanoTime();
		System.out.println("the time for 500000 sorted des is:"+ (t2-t1));
}
	
	static void selectionSort(int arr[])
	{
		for(int i=1;i<arr.length;i++) //first pointer
		{			
			for(int j=i-1;j>-1;j--) //second pointer
			{
			  if (arr[j]>arr[j+1]) // if the element on the left is bigger than 
				                   //the element on the right
			  {// switch them
				  int temp; // hold the element permanently
				  temp=arr[j];
				  arr[j]=arr[j+1]; // change the element at the position
				  arr[j+1]=temp;  // change the element at position with element in temp
			  }
			  
			}
		}
	}
	
}
