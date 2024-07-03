package com.wipro.DSAJava.Arrays;

public class DynamicArray {
	private int[] array;
    private int size;
    private int capacity;
    
// Constructor to initialize the dynamic array with an initial capacity
    public DynamicArray(int initialCapacity) {
        if (initialCapacity <= 0) {
            throw new IllegalArgumentException("Capacity should be greater than 0");
        }
        array = new int[initialCapacity];
        size = 0;
        capacity = initialCapacity;
    }

// Method to insert an element at the end
    public void add(int element) {
        if (size == capacity) {
            resize();
        }
        array[size++] = element;
    }
    
// Method to delete an element at a specific index
    public void delete(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index out of bounds");
        }
        for (int i = index; i < size - 1; i++) {
            array[i] = array[i + 1];
        }
        size--;
    }

// Method to update an element at a specific index
    public void update(int index, int element) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index out of bounds");
        }
        array[index] = element;
    }
    
// Method to get an element at a specific index
    public int get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index out of bounds");
        }
        return array[index];
    }
    
// Method to resize the array when capacity is reached
    private void resize() {
        capacity *= 2;
        int[] newArray = new int[capacity];
        for (int i = 0; i < size; i++) {
            newArray[i] = array[i];
        }
        array = newArray;
    }
    
// Method to get the current size of the array
    public int size() {
        return size;
    }
    
// Method to check if the array is empty
    public boolean isEmpty() {
        return size == 0;
    }
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DynamicArray dynamicArray = new DynamicArray(2);

        // Adding elements
        dynamicArray.add(1);
        dynamicArray.add(2);
        dynamicArray.add(3);
        dynamicArray.add(4);
        dynamicArray.add(5);
        System.out.println("Size after additions: " + dynamicArray.size()); // Output: 5
        
     // Display all elements
        System.out.print("Elements in the dynamic array: ");
        for (int i = 0; i < dynamicArray.size(); i++) {
            System.out.print(dynamicArray.get(i) + " ");
        }
        
        System.out.println();
        // Getting elements
        System.out.println("Element at index 1: " + dynamicArray.get(1)); // Output: 2

        // Updating elements
        dynamicArray.update(1, 20);
        System.out.println("Updated element at index 1: " + dynamicArray.get(1)); // Output: 20

        // Deleting elements
        dynamicArray.delete(1);
        System.out.println("Size after deletion: " + dynamicArray.size()); // Output: 4

        // Checking if array is empty
        System.out.println("Is array empty? " + dynamicArray.isEmpty()); // Output: false

        // Adding more elements to test resizing
        dynamicArray.add(6);
        dynamicArray.add(7);
        dynamicArray.add(8);
        dynamicArray.add(9);
        dynamicArray.add(10);
        System.out.println("Size after more additions: " + dynamicArray.size()); // Output: 9

        // Display all elements
        System.out.print("Elements in the dynamic array: ");
        for (int i = 0; i < dynamicArray.size(); i++) {
            System.out.print(dynamicArray.get(i) + " ");
        }
        // Output: Elements in the dynamic array: 1 3 4 5 6 7 8 9 10 
    }
}
