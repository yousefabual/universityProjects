package part2;

public class DijkstraAlgorithm {

    public static void main(String[] args) {
        int[][] Graph = {
        		{0, 24, 5, 10, 0, 0},
        	    {0, 0, 0, 0, 0, 0},
        	    {1, 0, 0, 1, 30, 10},
        	    {0, 0, 0, 0, 0, 8},
        	    {0, 0, 0, 0, 0, 0},
        	    {0, 0, 2, 8, 0, 0}
        };

        for(int i=0;i<Graph.length;i++) // making sure Graph has no negative values
        {
        	for(int j=0;j<Graph.length;j++)
        	{
        		if (Graph[i][j]<0)
        		{
        			throw new IllegalArgumentException("the graph has negative values");
        		}
        	}
        }
        
        int startNode = 0; // we will use this to start from the node 0
        Dijkstra(Graph, startNode);
    }

    static void Dijkstra(int[][] graph, int startNode) {
        int TotalnumberOFNodes = graph.length;
        
        if (TotalnumberOFNodes==0)
        {
        	throw new IllegalArgumentException("the graph is empty");
        }
        int[] distance = new int[TotalnumberOFNodes]; // array to keep track of distances from the startNode
        boolean[] visited = new boolean[TotalnumberOFNodes]; // a boolean array to keep track of the nodes
                                                        //wither they were visited or not
                                                        //where true -->visited and false-->not visited

        // this loop fills the distance array with a number like infinity:  
        for (int i = 0; i < TotalnumberOFNodes; i++) {
            distance[i] = Integer.MAX_VALUE;
        }
        distance[startNode] = 0; // this line sets the distance of node 0 to 0
                                 // as it is the first Node 

        
        // This loop finds the distance from the first node to all the other nodes it is the main loop:
        
        for (int count = 0; count < TotalnumberOFNodes; count++) 
        {
            int minimumDistanceNode = findMinDistanceNode(distance, visited); //this line sends both arrays
                                                                          // and find minimum distance
                                                                          //for nodes that are not visited yet
            
          visited[minimumDistanceNode] = true; // this line makes sure that we don't visit
                                               // the nodes more than once
            
          for (int i = 0; i < TotalnumberOFNodes; i++) //used to Alter distances
          {
                if (!visited[i] && graph[minimumDistanceNode][i] != 0 // not visited and there is a path
                    && distance[minimumDistanceNode] != Integer.MAX_VALUE // Not infinity in case of error
                    && distance[minimumDistanceNode] + graph[minimumDistanceNode][i] < distance[i]) 
                	// the sum of new distances is less than the previous distance
                {
                    distance[i] = distance[minimumDistanceNode] + graph[minimumDistanceNode][i];
                    // change the previous distance to the new distance
                }
            }
        }

        printTheShortestDistances(startNode, distance); // this method prints the distances for all nodes
                                                     // starting from the startNode
    }
//...........................................................................
    static int findMinDistanceNode(int[] distance, boolean[] visited) {
        int minimumDistance = Integer.MAX_VALUE; //used to compare distances
        int minimumDistanceNode = -1; // we keep updating this to contain the minimum distance node, 
        //when we find the minimum distance node we move to it

        for (int i = 0; i < distance.length; i++) {
            if (!visited[i] && distance[i] <= minimumDistance) {
            	minimumDistance = distance[i];
            	minimumDistanceNode = i;
            }
        }

        return minimumDistanceNode;
    }
//.............................................................................
    static void printTheShortestDistances(int startNode, int[] distance) 
    {
        for (int i = 0; i < distance.length; i++) //currently the data in distance array
        	                                     //shows the distances for each node from'
        	                                     // startNode which is 0
        {
            System.out.println("The Shortest distance from node " + startNode + " to node " + i + " is: " + distance[i]);
        }
    }
}
	


