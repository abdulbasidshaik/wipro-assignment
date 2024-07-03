package com.wipro.DSAJava.Tree;

class Node {
    int key;
    Node left, right;

    public Node(int item) {
        key = item;
        left = right = null;
    }
}

public class BinaryTree {
	Node root;
	
	public BinaryTree() {
        root = null;
    }
	
	 // Insert a key into the binary tree
    public void insert(int key) {
        root = insertRecursive(root, key);
    }
    
    // Recursive function to insert a key into BST
    private Node insertRecursive(Node root, int key) {
        // If the tree is empty, return a new node
        if (root == null) {
            root = new Node(key);
            return root;
        }

        // Otherwise, recur down the tree
        if (key < root.key) {
            root.left = insertRecursive(root.left, key);
        } else if (key > root.key) {
            root.right = insertRecursive(root.right, key);
        }

        // return the unchanged node pointer
        return root;
    }
    
    // Delete a key from the binary tree
    public void delete(int key) {
        root = deleteRecursive(root, key);
    }
    
 // Recursive function to delete a key from BST
    private Node deleteRecursive(Node root, int key) {
        // Base case: If the tree is empty
        if (root == null) return root;

        // Otherwise, recur down the tree
        if (key < root.key) {
            root.left = deleteRecursive(root.left, key);
        } else if (key > root.key) {
            root.right = deleteRecursive(root.right, key);
        } else {
            // Node with only one child or no child
            if (root.left == null) {
                return root.right;
            } else if (root.right == null) {
                return root.left;
            }

            // Node with two children: Get the inorder successor (smallest in the right subtree)
            root.key = minValue(root.right);

            // Delete the inorder successor
            root.right = deleteRecursive(root.right, root.key);
        }

        return root;
    }
    
    // Helper method to find the minimum value node in a given BST
    private int minValue(Node root) {
        int minValue = root.key;
        while (root.left != null) {
            minValue = root.left.key;
            root = root.left;
        }
        return minValue;
    }
    
    // Perform inorder traversal of the binary tree
    public void inorder() {
        inorderRecursive(root);
        System.out.println();
    }

    private void inorderRecursive(Node root) {
        if (root != null) {
            inorderRecursive(root.left);
            System.out.print(root.key + " ");
            inorderRecursive(root.right);
        }
    }
    
 // Perform preorder traversal of the binary tree
    public void preorder() {
        preorderRecursive(root);
        System.out.println();
    }
    
    private void preorderRecursive(Node root) {
        if (root != null) {
            System.out.print(root.key + " ");
            preorderRecursive(root.left);
            preorderRecursive(root.right);
        }
    }
    
    // Perform postorder traversal of the binary tree
    public void postorder() {
        postorderRecursive(root);
        System.out.println();
    }

    private void postorderRecursive(Node root) {
        if (root != null) {
            postorderRecursive(root.left);
            postorderRecursive(root.right);
            System.out.print(root.key + " ");
        }
    }
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BinaryTree tree = new BinaryTree();

        // Inserting elements into the tree
        tree.insert(50);
        tree.insert(30);
        tree.insert(20);
        tree.insert(40);
        tree.insert(70);
        tree.insert(60);
        tree.insert(80);

        System.out.println("Inorder traversal:");
        tree.inorder();

        System.out.println("Preorder traversal:");
        tree.preorder();

        System.out.println("Postorder traversal:");
        tree.postorder();

        // Deleting an element from the tree
        System.out.println("Delete 20 from the tree:");
        tree.delete(20);
        System.out.println("Inorder traversal after deletion:");
        tree.inorder();
	}

}
