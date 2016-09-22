SELECT 
  "T1"."Name" AS "Sucursal", 
  "T0"."CreationDate" AS "Fecha", 
  "T0"."CreationTime" AS "Hora", 
  "T2"."CodeBW" AS "Codigo Producto", 
  "T2"."NameProduct" AS "Nombre Producto", 
  "T3"."Quantity" AS "Cantidad", 
  "T3"."UnitPrice" AS "Precio Unitario",
  ("T3"."UnitPrice"* "T3"."Quantity") AS "Total"
FROM 
  "Agency" "T1", 
  "Order" "T0", 
  "Products" "T2", 
  "DetailOrder" "T3"
WHERE 
  "T1"."IdAgency" = "T0"."IdAgency" AND
  "T2"."IdProduct" = "T3"."IdProduct" AND
  "T3"."IdOrder" = "T0"."IdOrder" AND
  "T0"."IdAgency" = 2 AND
  "T0"."CreationDate" = '2016-06-16';
