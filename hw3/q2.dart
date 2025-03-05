// 2. Grocery List Manager:
// Implement a program that uses a List to store grocery items. It should allow adding, removing, and
// displaying items. Use functions with return types and optional/named parameters. Make sure to
// handle possible null values

void main() {
  List<String> groceryList = [];

  // Function to add an item
  String addItem({required String item}) {
    if (item.isEmpty) {
      return 'Item cannot be empty.';
    }
    groceryList.add(item);
    return 'Item "$item" added to the grocery list.';
  }

  // Function to remove an item
  String removeItem({required String item}) {
    if (groceryList.contains(item)) {
      groceryList.remove(item);
      return 'Item "$item" removed from the grocery list.';
    }
    return 'Item "$item" not found in the grocery list.';
  }

  // Function to display items
  String displayItems() {
    if (groceryList.isEmpty) {
      return 'The grocery list is empty.';
    }
    return 'Grocery List: ${groceryList.join(", ")}';
  }

  // Example usage
  print(addItem(item: 'Apples'));
  print(addItem(item: 'Bread'));
  print(displayItems());

  print(removeItem(item: 'Apples'));
  print(displayItems());

  print(removeItem(item: 'Milk'));
}
