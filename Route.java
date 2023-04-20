import java.util.*;

public class Route {
    
    public static void main(String[] args) {
        int n = 7; // number of vertices in the graph
        int[][] edges = {{1,2}, {1,6}, {2,3}, {2,6}, {3,6}, {5,4}, {6,5},{3,4},{5,3}}; // edges of the graph
        
        // create the graph as an adjacency list
        List<Integer>[] graph = new List[n];
        for (int i = 1; i < n; i++) {
            graph[i] = new ArrayList<>();
        }
        for (int[] edge : edges) {
            int u = edge[0];
            int v = edge[1];
            graph[u].add(v);
            graph[v].add(u);
        }
        
        // find the shortest paths from multiple sources and the nearest source for each node
        int[] sources = {1,5}; // the sources
        int[] distances = new int[n];
        int[] nearestSources = new int[n];
        bfsMultiSource(graph, sources, distances, nearestSources);
        
        // print the distances and nearest sources
        for (int i = 1; i < n; i++) {
            System.out.println("Distance from sources to " + i + " is " + distances[i] + ", nearest source is " + nearestSources[i]);
        }
    }
    
    public static void bfsMultiSource(List<Integer>[] graph, int[] sources, int[] distances, int[] nearestSources) {
        int n = graph.length;
        Arrays.fill(distances, -1); // initialize all distances to -1
        Arrays.fill(nearestSources, -1); // initialize all nearest sources to -1
        Queue<Integer> queue = new LinkedList<>();
        for (int source : sources) {
            distances[source] = 0;
            nearestSources[source] = source;
            queue.offer(source);
        }
        while (!queue.isEmpty()) {
            int u = queue.poll();
            for (int v : graph[u]) {
                if (distances[v] == -1) {
                    distances[v] = distances[u] + 1;
                    nearestSources[v] = nearestSources[u];
                    queue.offer(v);
                } else if (distances[v] == distances[u] + 1 && nearestSources[v] > nearestSources[u]) {
                    nearestSources[v] = nearestSources[u];
                }
            }
        }
    }
}