package io.rohan.model;

import java.util.*;

//Singleton pattern

public class Route{
    private static Route instance;
    private int n;
    private int[] distances;
    private int[] nearestSources;
    
    private Route() {
        n = 9;
        distances = new int[n];
        nearestSources = new int[n];
    }
    
    
    //this method is the only method exposed to outside world, hence made public, and then 
    public static Route getInstance() {
        if (instance == null) {
            instance = new Route();
        }
        return instance;
    }
    public int[] getDistances() {
        return distances;
    }
    public int[] getNearestSource() {
        return nearestSources;
    }

    
    public void getRoute() {
        int[][] edges = {{1,2}, {1,6}, {2,3}, {2,6}, {3,6}, {5,4}, {6,5},{3,4},{5,3},{4,7},{7,8}}; // edges of the graph
        
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
        
        int[] sources = {1,5,7}; // the sources
        
        bfsMultiSource(graph, sources);
        
        // print the distances and nearest sources
        for (int i = 1; i < n; i++) {
            System.out.println("Distance from sources to " + i + " is " + distances[i] + ", nearest source is " + nearestSources[i]);
        }
    }
    
    private void bfsMultiSource(List<Integer>[] graph, int[] sources) {
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
                }
            }
        }
    }
}
