package com.wipro.DSAJava.Graph;

import java.util.*;

public class Graph {
    private Map<Integer, List<Integer>> adjList;

    public Graph() {
        adjList = new HashMap<>();
    }

    // Add a vertex to the graph
    public void addVertex(int v) {
        adjList.putIfAbsent(v, new ArrayList<>());
    }

    // Add an undirected edge between vertices u and v
    public void addEdge(int u, int v) {
        adjList.get(u).add(v);
        adjList.get(v).add(u);
    }

    // Remove an edge between vertices u and v
    public void removeEdge(int u, int v) {
        if (adjList.containsKey(u) && adjList.containsKey(v)) {
            adjList.get(u).remove(Integer.valueOf(v));
            adjList.get(v).remove(Integer.valueOf(u));
        }
    }

    // Remove a vertex from the graph
    public void removeVertex(int v) {
        if (!adjList.containsKey(v)) return;

        // Remove edges associated with vertex v
        List<Integer> neighbors = adjList.get(v);
        for (Integer neighbor : neighbors) {
            adjList.get(neighbor).remove(Integer.valueOf(v));
        }

        // Remove vertex v itself
        adjList.remove(v);
    }

    // Check if an edge exists between vertices u and v
    public boolean hasEdge(int u, int v) {
        return adjList.containsKey(u) && adjList.get(u).contains(v);
    }

    // Check if a vertex exists in the graph
    public boolean hasVertex(int v) {
        return adjList.containsKey(v);
    }

    // Perform Depth-First Search (DFS) traversal starting from vertex v
    public void dfs(int v) {
        Set<Integer> visited = new HashSet<>();
        dfsRecursive(v, visited);
        System.out.println();
    }

    private void dfsRecursive(int v, Set<Integer> visited) {
        visited.add(v);
        System.out.print(v + " ");

        for (int neighbor : adjList.getOrDefault(v, Collections.emptyList())) {
            if (!visited.contains(neighbor)) {
                dfsRecursive(neighbor, visited);
            }
        }
    }

    // Perform Breadth-First Search (BFS) traversal starting from vertex v
    public void bfs(int v) {
        Set<Integer> visited = new HashSet<>();
        Queue<Integer> queue = new LinkedList<>();
        visited.add(v);
        queue.offer(v);

        while (!queue.isEmpty()) {
            int current = queue.poll();
            System.out.print(current + " ");

            for (int neighbor : adjList.getOrDefault(current, Collections.emptyList())) {
                if (!visited.contains(neighbor)) {
                    visited.add(neighbor);
                    queue.offer(neighbor);
                }
            }
        }
        System.out.println();
    }

    public static void main(String[] args) {
        Graph graph = new Graph();

        // Adding vertices
        graph.addVertex(0);
        graph.addVertex(1);
        graph.addVertex(2);
        graph.addVertex(3);
        graph.addVertex(4);
        graph.addVertex(5);

        // Adding edges
        graph.addEdge(0, 1);
        graph.addEdge(0, 2);
        graph.addEdge(1, 3);
        graph.addEdge(1, 4);
        graph.addEdge(2, 4);
        graph.addEdge(3, 5);
        graph.addEdge(4, 5);

        // Checking if vertices and edges exist
        System.out.println("Graph has vertex 2: " + graph.hasVertex(2));
        System.out.println("Graph has edge between 1 and 3: " + graph.hasEdge(1, 3));

        // Performing DFS and BFS traversals
        System.out.println("DFS traversal starting from vertex 0:");
        graph.dfs(0);

        System.out.println("BFS traversal starting from vertex 0:");
        graph.bfs(0);

        // Removing vertex and edge
        graph.removeEdge(0, 1);
        System.out.println("Removed edge between 0 and 1");
        System.out.println("Graph has edge between 0 and 1: " + graph.hasEdge(0, 1));

        graph.removeVertex(2);
        System.out.println("Removed vertex 2");
        System.out.println("Graph has vertex 2: " + graph.hasVertex(2));
    }
}
