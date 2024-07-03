package com.wipro.DSAJava.QuickSort;

public class QuickSort {
	
	public static void quickSort(int[] arr, int low, int high) {
        if (low < high) {
            // Partitioning index
            int pi = partition(arr, low, high);

            // Recursively sort elements before and after partition
            quickSort(arr, low, pi - 1);
            quickSort(arr, pi + 1, high);
        }
    }
	
	// Helper method to partition the array and return the partitioning index
    private static int partition(int[] arr, int low, int high) {
        // Pivot element (last element of the array)
        int pivot = arr[high];

        // Index of smaller element
        int i = low - 1;

        for (int j = low; j < high; j++) {
            // If current element is smaller than the pivot
            if (arr[j] < pivot) {
                i++;

                // Swap arr[i] and arr[j]
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        
     // Swap arr[i+1] and arr[high] (or pivot)
        int temp = arr[i + 1];
        arr[i + 1] = arr[high];
        arr[high] = temp;

        return i + 1;
    }
	
	// Helper method to print an array
    public static void printArray(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] arr = { 64, 34, 25, 12, 22, 11, 90 };

        System.out.println("Array before sorting:");
        printArray(arr);

        quickSort(arr, 0, arr.length - 1);

        System.out.println("Array after Quick Sort:");
        printArray(arr);
	}

}
