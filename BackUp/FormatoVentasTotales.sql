CREATE TEMP TABLE DetalleVentas AS SELECT 
  "T0"."CreationDate", 
  "T0"."Total", 
  SUM("T1"."Quantity") AS "Cantidad"
FROM 
  "Order" "T0", 
  "DetailOrder" "T1"
WHERE 
  "T1"."IdOrder" = "T0"."IdOrder" AND
  "T0"."IdAgency" = 1
  GROUP BY
  "T0"."CreationDate", 
  "T0"."Total" 
  ORDER BY "T0"."CreationDate";

  SELECT  'MASFERRER' AS "Sucursal",
	"T0"."CreationDate",
	SUM("T0"."Total") AS Total,
	SUM("T0"."Cantidad") AS Cantidad
   FROM DetalleVentas "T0"
   GROUP BY "T0"."CreationDate" ;

   

  --DROP TABLE DetalleVentas;