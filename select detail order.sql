SELECT 
  "Order"."IdOrder", 
  "DetailOrder"."IdDetail", 
  "Products"."NameProduct", 
  "DetailOrder"."Quantity", 
  "Sauce"."NameSauce", 
  "Spicy"."NameSpicy", 
  "DetailOrder"."UnitPrice"
FROM 
  public."Order", 
  public."DetailOrder", 
  public."DetailSauces", 
  public."Sauce", 
  public."Spicy", 
  public."Products"
WHERE 
  "DetailOrder"."IdOrder" = "Order"."IdOrder" AND
  "DetailSauces"."IdDetail" = "DetailOrder"."IdDetail" AND
  "Sauce"."IdSauce" = "DetailSauces"."IdSauce" AND
  "Spicy"."IdSpicy" = "DetailSauces"."IdSpicy" AND
  "Products"."IdProduct" = "DetailOrder"."IdProduct" AND
  "Order"."IdOrder" = 31;
