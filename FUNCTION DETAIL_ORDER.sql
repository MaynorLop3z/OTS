CREATE FUNCTION getDetailOrder(codigo numeric) 
RETURNS TABLE(IdDetail integer, 
	NameProduct character varying, 
	Dscription character varying, 
	NameSauce character varying, 
	NameSpicy character varying, 
	Quantity integer, 
	UnitPrice double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
 RETURN QUERY SELECT  
  "T0"."IdDetail",
  (SELECT "T1"."NameProduct" FROM "Products" "T1" WHERE "T1"."IdProduct" = "T0"."IdProduct") AS "NameProduct",
  (SELECT "T1"."Dscription" FROM "Products" "T1" WHERE "T1"."IdProduct" = "T0"."IdProduct") AS "Dscription",
  (SELECT COALESCE("T2"."NameSauce",'') FROM "Sauce" "T2" WHERE "T2"."IdSauce" = "T0"."IdSauce") AS "NameSauce",
  (SELECT COALESCE("T3"."NameSpicy",'') FROM "Spicy" "T3" WHERE "T3"."IdSpicy" = "T0"."IdSpicy") AS "NameSpicy",
  "T0"."Quantity", 
  "T0"."UnitPrice"
FROM 
  "DetailOrder" "T0"
WHERE "T0"."IdOrder" = codigo;
END; $$;