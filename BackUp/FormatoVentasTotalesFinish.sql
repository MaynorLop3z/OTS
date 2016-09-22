--select * from getDetalleVentas(1);

SELECT 'Multiplaza' AS Sucursal
		, "T0"."fecha"
		, SUM("T0"."venta_neta") AS "Venta Neta"
		,SUM("T0"."iva") AS IVA
		,SUM("T0"."propina") AS Propina
		,SUM("T0"."descuento") AS Descuento
		, SUM("T0"."venta_total") AS "Venta Total"
		, SUM("T0"."tarjeta") AS Tarjeta
		, SUM("T0"."efectivo") AS Efectivo
		, 0.0 AS "Forma de pago3"
		, 0.0 AS "Forma de pago4"
		, 0.0 AS "Forma de pago5"
		, 0.0 AS "Forma de pago6"
		, 0.0 AS "Forma de pago7"
		, 0.0 AS "Forma de pago8"
		, 0.0 AS "Forma de pago9"
		, 0.0 AS "Forma de pago10"
		, SUM("T0"."cantidad") AS Alimentos
		, 0 AS Bedidas
		, 0 As Cigarros
		, 0 AS Otros
		, SUM("T0"."cantidad") AS "Total Grupos"
FROM getDetalleVentas(1) "T0"
GROUP BY "T0"."fecha" ;