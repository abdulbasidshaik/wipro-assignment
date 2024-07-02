package com.wipro.DSAJava.BubbleSort;

public class BubbleSort 
{
	
	static void bubbleSort(int arr[], int n) 
	{
		int i, j, temp;
		boolean swapped;
		for (i = 0; i < n - 1; i++) 
		{
			swapped = false;
			for (j = 0; j < n - i - 1; j++) 
			{
				if (arr[j] > arr[j + 1]) 
				{
					// Swap arr[j] and arr[j + 1]
					temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
					swapped = true;
				}
			}
			// If no elements were swapped, the array is already sorted
			if (!swapped) 
			{
				break;
			}
		}
	}
	
	static void printArray(int arr[], int size) {
		for (int i = 0; i < size; i++) {
			System.out.print(arr[i] + " "); // Use print instead of println to print in the same line
		}
		System.out.println(); // Print a new line after printing the array
	}

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		int arr[] = { 54, 34, 25, 12, 22, 11, 90 };
		int n = arr.length;
		
		System.out.println("Array before sorting:");
		printArray(arr, n);

		bubbleSort(arr, n);

		System.out.println("Sorted Array:");
		printArray(arr, n);
	}
}
