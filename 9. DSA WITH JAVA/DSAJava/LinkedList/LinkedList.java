package com.wipro.DSAJava.LinkedList;

// Node class to represent each element in the LinkedList
class Node {
    int data;
    Node next;

    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

// LinkedList class
public class LinkedList {
    private Node head; // head of the LinkedList

    public LinkedList() {
        this.head = null;
    }

    // Method to add a new element at the end of the LinkedList
    public void add(int data) {
        Node newNode = new Node(data);
        
        if (head == null) {
            head = newNode;
        } else {
            Node current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    // Method to remove an element from the LinkedList by its value
    public void remove(int data) {
        if (head == null) {
            return;
        }
        
        if (head.data == data) {
            head = head.next;
            return;
        }
        
        Node current = head;
        while (current.next != null) {
            if (current.next.data == data) {
                current.next = current.next.next;
                return;
            }
            current = current.next;
        }
    }

    // Method to retrieve an element from the LinkedList by index
    public int get(int index) {
        if (head == null || index < 0) {
            throw new IndexOutOfBoundsException("Index out of bounds");
        }
        
        Node current = head;
        for (int i = 0; i < index; i++) {
            if (current.next == null) {
                throw new IndexOutOfBoundsException("Index out of bounds");
            }
            current = current.next;
        }
        
        return current.data;
    }

    // Method to display all elements in the LinkedList
    public void display() {
        Node current = head;
        while (current != null) {
            System.out.print(current.data + " ");
            current = current.next;
        }
        System.out.println();
    }

    public static void main(String[] args) {
        LinkedList list = new LinkedList();

        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);

        System.out.print("Initial list: ");
        list.display();

        list.remove(3);
        System.out.print("After removing 3: ");
        list.display();

        int elementAtIndex2 = list.get(2);
        System.out.println("Element at index 2: " + elementAtIndex2);
    }
}
