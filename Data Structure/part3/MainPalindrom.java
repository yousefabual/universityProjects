package part3;

public class MainPalindrom {

	public static void main(String[] args) {
		
		
		NamePalindrom nameList = new NamePalindrom();
		
		String name="AAOnOaa";
		
		
	     for (int i=0;i<name.length();i++)
	     {
	    	 nameList.push(nameList.Mylowercase(name.charAt(i)));
	     }
         
	     nameList.pop();
	     nameList.palindrom();
	}

	
}

/*
char[] name = {'n', 'o', 'o', 'n'};

for (int i=0;i<name.length;i++)
{
	 nameList.push(name[i]);
}*/
