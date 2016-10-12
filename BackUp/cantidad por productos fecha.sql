SELECT "T1"."Quantity", "T1"."UnitPrice", "T3"."NameProduct", "T4"."NameCategory",
 CASE WHEN "T0"."NumRef" = '' OR "T0"."NumRef" IS NULL THEN "T1"."UnitPrice" * "T1"."Quantity" ELSE 0.00 END AS EFECTIVO,
 CASE WHEN "T0"."NumRef" = '' OR "T0"."NumRef" IS NULL THEN 0.00 ELSE "T1"."UnitPrice" * "T1"."Quantity" END AS TARJETA,
  0.00 AS CHEQUE
 FROM "Order" "T0",  "DetailOrder" "T1",  "Products" "T3", "Category" "T4"
WHERE "T3"."IdProduct" = "T1"."IdProduct" AND "T3"."IdCategory" = "T4"."IdCategory" AND "T1"."IdOrder" = "T0"."IdOrder"
--AND "T0"."CreationDate" >= '' AND  "T0"."CreationDate" < '';
;