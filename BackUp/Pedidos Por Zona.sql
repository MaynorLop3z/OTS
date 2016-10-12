SELECT 
  "T2"."Name" AS "Agencia", 
  "T1"."Name" AS "Zona", 
  SUM("T0"."Total") AS "Total", 
  "T0"."CreationDate" AS "Fecha"
FROM 
  public."Order" "T0", 
  public."Coverage" "T1", 
  public."Agency" "T2"
WHERE 
  "T0"."Zona" = "T1"."IdCoverage" AND
  "T0"."IdAgency" = "T2"."IdAgency"
  GROUP BY "T1"."Name","T0"."CreationDate","T2"."Name"
ORDER BY
  "T0"."CreationDate" DESC;
