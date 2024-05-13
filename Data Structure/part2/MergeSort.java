package part2;

public class MergeSort {

	public static void main(String[] args) {
		  int []arrSort1 = new int[5000]; // array of integers with size 5000
		  int []arrSort2 = new int[50000]; // array of integers with size 50000
		  int []arrSort3 = new int[500000]; // array of integers with size 500000
		  long t1,t2;
	//..............................................
	// Sorting the lists Ascending	
		  
			for (int i=0;i<arrSort1.length;i++)
			{
				arrSort1[i]=i;
			}
			t1=System.nanoTime();  //starting time
			mergeSort(arrSort1);   //sorting the array
			t2=System.nanoTime();  //finishing time
			System.out.println("the time for 5000 sorted asc is:"+ (t2-t1)); //calculating the time difference
			
			for (int i=0;i<arrSort2.length;i++)
			{
				arrSort2[i]=i;
			}
			t1=System.nanoTime();
			mergeSort(arrSort2);
			t2=System.nanoTime();
			System.out.println("the time for 50000 sorted asc is:"+ (t2-t1));
			
			for (int i=0;i<arrSort3.length;i++)
			{
				arrSort3[i]=i;
			}
			t1=System.nanoTime();
			mergeSort(arrSort3);
			t2=System.nanoTime();
			System.out.println("the time for 500000 sorted asc is:"+ (t2-t1));
	//...............................................
	// Sorting the lists descending	
			
			for (int i=0;i<arrSort1.length;i++)
			{
				arrSort1[i]=arrSort1.length-i;
			}
			t1=System.nanoTime();
			mergeSort(arrSort1);
			t2=System.nanoTime();
			System.out.println("the time for 5000 sorted des is:"+ (t2-t1));
			
			for (int i=0;i<arrSort2.length;i++)
			{
				arrSort2[i]=arrSort2.length-i;
			}
			t1=System.nanoTime();
			mergeSort(arrSort2);
			t2=System.nanoTime();
			System.out.println("the time for 50000 sorted des is:"+ (t2-t1));
			
			for (int i=0;i<arrSort3.length;i++)
			{
				arrSort3[i]=arrSort3.length-i;
			}
			t1=System.nanoTime();
			mergeSort(arrSort3);
			t2=System.nanoTime();
			System.out.println("the time for 500000 sorted des is:"+ (t2-t1));
	}
		
	static void mergeSort(int []arr)
	{
		int length=arr.length;
		if (length<=1) // make sure that we haven't reached a 
		{
			return;
		}
		int mid=length/2;
		int left[]=new int [mid];
		int right[]=new int [length - mid];
		
		for(int i=0; i<mid ;i++)
		{
			left[i]=arr[i];	
			//right[i]=arr[i+mid]; instead of two for loops
		}
		for(int i=mid; i<length;i++)
		{
			right[i-mid]=arr[i];
		}
		
		
		mergeSort(left);
		mergeSort(right);
		
		merge(left,right,arr);
		
		}
	
	 static void merge(int [] left,int [] right,int[] arr) // connecting the divided arrays into a one array
	 {
		 // we will use these as pointers to fill the array in the correct order
		 int i=0;
		 int j=0;
		 int k=0;
		 
		 while(i<left.length && j< right.length)
			 //as long as we haven't looked into each element in any of the arrays
			 //the following searching keeps going:
		 {
			 if(left[i]<right[j]) // if the element in the left array
				                  //is smaller than the element in the right array
			 {
				 arr[k]=left[i]; //fill the k position in the big array with that element
				 i++; //update pointers
				 k++;//update pointers
			 }
			 else // if the element in the right array 
				 //is smaller than the element in the left array
			 {
				 arr[k]=right[j];//fill the k position in the big array with that element 'smaller'
				 k++;//update pointers
				 j++;//update pointers
			 }
		 }
		 // after we have finished looking through one of the arrays:
		 
		 while (i<left.length)
			 //if we haven't finished the left array
		 {
			 arr[k]=left[i]; // fill the big array with the elements in the left array
			 i++;//update pointers
			 k++;//update pointers
		 }
		 
		 while(j<right.length)
			//if we haven't finished the right array
		 {
			 arr[k]=right[j];// fill the big array with the elements in the right array
			 j++;//update pointers
			 k++;//update pointers
		 }

	}

}
