package part3;

public class NamePalindrom {
	char [] arr;
	char []arr2;
	int top;
	int MaxSize;
	
	//constructor
	NamePalindrom()
	{
		top=-1;
		MaxSize=10;
		arr=new char[MaxSize];
		arr2=new char[MaxSize];
	}
	
	void push(char data)//insert at top
	{
		//push
		top++;
		arr[top]=data;
	}
	void pop()
	{
		//pop
		for(int i=0;top>-1;i++)
		{
		arr2[i]=arr[top];
		top--;
		}
	}
	
	void palindrom()
	{
		boolean ispalindrom = true;
		for (int i=0;i<arr.length;i++)
		{
			if (arr[i]!=arr2[i])
			{
				ispalindrom=false;
				break;
			}
		}
		
		//check if palindrom
		if (ispalindrom)
		{
			System.out.println("It is palindrom");
		}
		else
		{
			System.out.println("It is not palindrom");
		}
	}
	
	char Mylowercase(char data)
	{
		if (data=='A')
		{
			return 'a';
		}
		else if (data=='B')
		{
			return 'b';
		}
		else if (data=='C')
		{
			return 'c';
		}
		else if (data=='D')
		{
			return 'd';
		}
		else if (data=='E')
		{
			return 'e';
		}
		else if (data=='F')
		{
			return 'f';
		}
		else if (data=='G')
		{
			return 'g';
		}
		else if (data=='H')
		{
			return 'h';
		}
		else if (data=='I')
		{
			return 'i';
		}
		else if (data=='J')
		{
			return 'j';
		}
		else if (data=='K')
		{
			return 'k';
		}
		else if (data=='L')
		{
			return 'l';
		}
		else if (data=='M')
		{
			return 'm';
		}
		else if (data=='N')
		{
			return 'n';
		}
		else if (data=='O')
		{
			return 'o';
		}
		else if (data=='P')
		{
			return 'p';
		}
		else if (data=='Q')
		{
			return 'q';
		}
		else if (data=='R')
		{
			return 'r';
		}
		else if (data=='S')
		{
			return 's';
		}
		else if (data=='T')
		{
			return 't';
		}
		else if (data=='U')
		{
			return 'u';
		}
		else if (data=='V')
		{
			return 'v';
		}
		else if (data=='W')
		{
			return 'w';
		}
		else if (data=='X')
		{
			return 'x';
		}
		else if (data=='Y')
		{
			return 'y';
		}
		else if (data=='Z')
		{
			return 'z';
		}
		else
			return data;
	}
	
}
