package com.wipro.DSAJava.LinearSearch;

public class LinearSearch {

    public static int linearSearch(int[] arr, int target) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target) {
                return i;  // Return the index if the target is found
            }
        }
        return -1;  // Return -1 if the target is not found
    }

    public static void main(String[] args) {
    	// TODO Auto-generated method stub
        int[] arr = { 2, 4, 6, 8, 10, 12 };
        int target = 8;
        int index = linearSearch(arr, target);
        
        if (index != -1) {
            System.out.println("Target " + target + " found at index: " + index);
        } else {
            System.out.println("Target " + target + " not found in the array.");
        }
    }
}
