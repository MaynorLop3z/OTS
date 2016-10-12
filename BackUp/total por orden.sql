SELECT "T0"."IdOrder",  "T0"."NumberClient",  "T0"."NameClient",  "T0"."Dscnt", "T0"."ChargeForService",
 CASE WHEN "T0"."NumRef" = '' OR "T0"."NumRef" IS NULL THEN "T0"."Total" + "T0"."ChargeForService" - "T0"."Dscnt" ELSE 0.00 END AS EFECTIVO,
 CASE WHEN "T0"."NumRef" = '' OR "T0"."NumRef" IS NULL THEN 0.00 ELSE "T0"."Total" + "T0"."ChargeForService" - "T0"."Dscnt" END AS TARJETA,
  0.00 AS CHEQUE
  FROM "Order" "T0"
  -- WHERE "T0"."CreationDate" >= '" + fechaInicio + "' AND  "T0"."CreationDate" < '" +
  ;