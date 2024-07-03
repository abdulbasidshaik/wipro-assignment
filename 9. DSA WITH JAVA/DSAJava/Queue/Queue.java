package com.wipro.DSAJava.Queue;

//Node class for the linked list
class Node {
 int data;
 Node next;
 
 public Node(int data) {
     this.data = data;
     this.next = null;
 }
}

//Queue class using linked list
public class Queue {
 private Node front, rear;
 private int size;
 
 public Queue() {
     this.front = this.rear = null;
     this.size = 0;
 }
 
 // Method to add an element to the queue
 public void enqueue(int data) {
     Node newNode = new Node(data);
     
     if (this.rear == null) {
         this.front = this.rear = newNode;
     } else {
         this.rear.next = newNode;
         this.rear = newNode;
     }
     size++;
 }
 
 // Method to remove an element from the queue
 public int dequeue() {
     if (this.front == null) {
         throw new IllegalStateException("Queue is empty");
     }
     
     int data = this.front.data;
     this.front = this.front.next;
     
     if (this.front == null) {
         this.rear = null;
     }
     size--;
     return data;
 }
 
 // Method to get the front element of the queue
 public int peek() {
     if (this.front == null) {
         throw new IllegalStateException("Queue is empty");
     }
     return this.front.data;
 }
 
 // Method to check if the queue is empty
 public boolean isEmpty() {
     return this.front == null;
 }
 
 // Method to get the size of the queue
 public int getSize() {
     return size;
 }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Queue queue = new Queue();
        
        // Enqueue elements
        queue.enqueue(1);
        queue.enqueue(2);
        queue.enqueue(3);
        queue.enqueue(4);
        queue.enqueue(5);
        
        // Peek front element
        System.out.println("Front element is: " + queue.peek());
        
        // Dequeue elements
        System.out.println("Removed element is: " + queue.dequeue());
        System.out.println("Front element is: " + queue.peek());
        
        // Enqueue more elements
        queue.enqueue(6);
        queue.enqueue(7);
        queue.enqueue(8);
        
        // Peek front element
        System.out.println("Front element is: " + queue.peek());
        
        // Display queue size
        System.out.println("Queue size is: " + queue.getSize());
        
        // Check if queue is empty
        System.out.println("Is queue empty? " + queue.isEmpty());
        
        // Dequeue all elements
        while (!queue.isEmpty()) {
            System.out.println("Removed element is: " + queue.dequeue());
        }
        
        // Check if queue is empty
        System.out.println("Is queue empty? " + queue.isEmpty());
    }
}
