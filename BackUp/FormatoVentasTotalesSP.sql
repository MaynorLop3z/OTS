DROP FUNCTION getDetalleVentas(numeric);
CREATE OR REPLACE FUNCTION getDetalleVentas (agencia NUMERIC)
RETURNS TABLE (
Fecha DATE,
Venta_Total DOUBLE PRECISION,
Venta_Neta DOUBLE PRECISION,
IVA DOUBLE PRECISION,
Propina DOUBLE PRECISION,
Cantidad BIGINT,
Efectivo DOUBLE PRECISION,
Tarjeta DOUBLE PRECISION,
Descuento DOUBLE PRECISION
)
AS $$
BEGIN
RETURN QUERY SELECT 
  "T0"."CreationDate", 
  "T0"."Total", 
  ("T0"."Total" - "T0"."Dscnt")/1.13 AS NETA,
   (("T0"."Total" - "T0"."Dscnt")/1.13)*0.13 AS NETA,
   "T0"."ChargeForService",
  SUM("T1"."Quantity") AS "Cantidad",
  CASE WHEN "T0"."NumRef" = '' OR "T0"."NumRef" IS NULL THEN "T0"."Total" + "T0"."ChargeForService" - "T0"."Dscnt" ELSE 0.00 END AS EFECTIVO,
  CASE WHEN "T0"."NumRef" = '' OR "T0"."NumRef" IS NULL THEN 0.00 ELSE "T0"."Total" + "T0"."ChargeForService" - "T0"."Dscnt" END AS TARJETA,
  "T0"."Dscnt"
FROM 
  "Order" "T0", 
  "DetailOrder" "T1"
WHERE 
  "T1"."IdOrder" = "T0"."IdOrder" AND
  "T0"."IdAgency" = agencia
  GROUP BY
  "T0"."CreationDate", 
  "T0"."Total",
  "T0"."NumRef",
  "T0"."ChargeForService",
  "T0"."Dscnt"
  ORDER BY "T0"."CreationDate";
END; $$

LANGUAGE 'plpgsql';