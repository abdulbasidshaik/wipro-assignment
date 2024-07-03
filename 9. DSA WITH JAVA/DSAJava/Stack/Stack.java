package com.wipro.DSAJava.Stack;

import java.util.EmptyStackException;

public class Stack {
    private int[] stackArray;
    private int top;
    private int capacity;

    // Constructor to initialize the stack with an initial capacity
    public Stack(int initialCapacity) {
        if (initialCapacity <= 0) {
            throw new IllegalArgumentException("Capacity should be greater than 0");
        }
        stackArray = new int[initialCapacity];
        top = -1;
        capacity = initialCapacity;
    }

    // Method to add an element to the top of the stack
    public void push(int element) {
        if (top == capacity - 1) {
            resize();
        }
        stackArray[++top] = element;
    }

    // Method to remove and return the top element of the stack
    public int pop() {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        return stackArray[top--];
    }

    // Method to return the top element of the stack without removing it
    public int peek() {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        return stackArray[top];
    }

    // Method to check if the stack is empty
    public boolean isEmpty() {
        return top == -1;
    }

    // Method to return the number of elements in the stack
    public int size() {
        return top + 1;
    }

    // Method to resize the stack when capacity is reached
    private void resize() {
        capacity *= 2;
        int[] newStackArray = new int[capacity];
        System.arraycopy(stackArray, 0, newStackArray, 0, top + 1);
        stackArray = newStackArray;
    }

    // Main method for testing
    public static void main(String[] args) {
    	// TODO Auto-generated method stub
        Stack stack = new Stack(2);

        // Pushing elements
        stack.push(1);
        stack.push(2);
        stack.push(3);
        System.out.println("Size after pushes: " + stack.size()); // Output: 3

        // Peeking the top element
        System.out.println("Top element: " + stack.peek()); // Output: 3

        // Popping elements
        System.out.println("Popped element: " + stack.pop()); // Output: 3
        System.out.println("Popped element: " + stack.pop()); // Output: 2
        System.out.println("Size after pops: " + stack.size()); // Output: 1

        // Checking if stack is empty
        System.out.println("Is stack empty? " + stack.isEmpty()); // Output: false

        // Popping the last element
        System.out.println("Popped element: " + stack.pop()); // Output: 1

        // Checking if stack is empty
        System.out.println("Is stack empty? " + stack.isEmpty()); // Output: true
    }
}
