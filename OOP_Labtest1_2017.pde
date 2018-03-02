void setup()
{
  size(800, 600);
  loadProducts();
}

void loadProducts()
{
  Table table = loadTable("cafe.csv", "header");
  for(TableRow row:table.rows())
  {
    products.add(new Product(row));
  }
}

ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

void drawProducts()
{ 
  // Draw the list of products
  float border = height * 0.1f;
  float start = width * 0.05f;
  float w = width * 0.3f;
  float h = height * 0.1f;
  textAlign(LEFT, CENTER);
  textSize(16);
  for(int i = 0 ; i < products.size() ; i ++)
  {
    Product p = products.get(i);
    float y = map(i, 0, products.size(), border, height - border);
    fill(255);
    rect(start, y, w, h);
    fill(0);
    textAlign(LEFT, CENTER);
    text(p.name, start + 10, y + (h / 2));
    textAlign(RIGHT, CENTER);
    text(nf(p.price, 0, 2), start + w - 10, y + (h / 2));
  } 
}

void drawBill()
{
  float border = height * 0.1f;
  float start = (width / 2) + width * 0.05f;
  float w = width * 0.4f;
  float h = height * 0.8f;
  
  stroke(0);
  fill(255);
  rect(start, border, w, h);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Your Bill", width * 0.75, border + 20);
  float total = 0;
  float y = border + 50;
  float x = start + 10;
  float gap = 30;
  for(int i = 0 ; i < bill.size() ; i ++)
  {
    Product p = bill.get(i);    
    textAlign(LEFT, CENTER);
    text(p.name, start + 10, y);
    textAlign(RIGHT, CENTER);
    text(nf(p.price, 0, 2), start + w - 10, y);
    y += gap;
    total += p.price;
  }
  textAlign(LEFT, CENTER);
  text("Total:", x, y);
  textAlign(RIGHT, CENTER);
  text(nf(total, 0, 2), x + w - 20, y);  
}

void mousePressed()
{
  float start = width * 0.05f;
  float w = width * 0.3f;
  float h = height * 0.1f;
  
  float border = height * 0.1f;
  for(int i = 0 ; i < products.size() ; i ++)
  {
    float y = map(i, 0, products.size(), border, height - border);
    if (mouseX > start && mouseX < start + w 
      && mouseY > y && mouseY < y + h)
      {
        bill.add(products.get(i));
      }
  }
}

void draw()
{
  // Draw the 
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(26);
  text("Cafe Rubis Till System", width / 2, height * 0.05f);
  line(width / 2, height * 0.1, width / 2, height * 0.9);
  
  drawProducts();
  drawBill();
  
}