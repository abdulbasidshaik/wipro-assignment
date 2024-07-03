package com.wipro.DSAJava.JumpSearch;

public class JumpSearch {
	static int jumpSearch(int[] arr, int x) {
        int n = arr.length;
        int step = (int) Math.floor(Math.sqrt(n));
        int prev = 0;

        // Finding the block where the element may be present
        while (arr[Math.min(step, n) - 1] < x) {
            prev = step;
            step += (int) Math.floor(Math.sqrt(n));
            if (prev >= n) {
                return -1;
            }
        }

        // Linear search within the block
        while (arr[prev] < x) {
            prev++;
            if (prev == Math.min(step, n)) 
            {
                return -1;
            }
        }
        
        // If element is found
        if (arr[prev] == x) {
            return prev;
        }

        return -1;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int arr[] = { 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610 };
        int x = 55;
        int result = jumpSearch(arr, x);
        if (result != -1) 
        {
            System.out.println("Number " + x + " is at index: " + result);
        } 
        else 
        {
            System.out.println("Number " + x + " is not present in the array.");
        }

	}

}
