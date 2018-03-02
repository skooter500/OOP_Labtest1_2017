class Product
{
  String name;
  float price;
  int quantity;
  
  Product(TableRow row)
  {
    name = row.getString("Name");
    price = row.getFloat("Price");
    quantity = 0;
  }
}