SELECT 
  "T2"."Name" AS "Agencia", 
  "T3"."NameProduct" AS "Producto", 
  SUM("T1"."Quantity") AS "Cantidad"
FROM 
  public."Order" "T0", 
  public."DetailOrder" "T1", 
  public."Agency" "T2", 
  public."Products" "T3"
WHERE 
  "T0"."IdAgency" = "T2"."IdAgency" AND
  "T1"."IdOrder" = "T0"."IdOrder" AND
  "T1"."IdProduct" = "T3"."IdProduct" AND
"T0"."CreationDate" = '08/09/2016' 
  GROUP BY "T2"."Name","T3"."NameProduct";
