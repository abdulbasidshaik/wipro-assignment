package com.wipro.DSAJava.BinarySearch;

public class Binarysearch {
	
	public static int binarySearch(int[] arr, int target) {
        int left = 0;
        int right = arr.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            // Check if target is present at mid
            if (arr[mid] == target) {
                return mid;
            }

            // If target greater, ignore left half
            if (arr[mid] < target) {
                left = mid + 1;
            } else { // If target is smaller, ignore right half
                right = mid - 1;
            }
        }

        // Element not found
        return -1;
    }
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int[] sortedArray = { 2, 5, 8, 12, 16, 23, 38, 56, 72, 91 };
        int target = 23;
        int index = binarySearch(sortedArray, target);
        
        if (index != -1) {
            System.out.println("Target " + target + " found at index: " + index);
        } else {
            System.out.println("Target " + target + " not found in the array.");
        }


	}

}
