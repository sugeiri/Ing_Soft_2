
IF EXISTS (SELECT name FROM sysobjects 
         WHERE name = 'Busca_Tiempo_Total' AND type = 'P')
   DROP PROCEDURE Busca_Tiempo_Total
GO

CREATE PROCEDURE Busca_Tiempo_Total
   @ii_categoria	int

AS 
	select isnull(sum(tiempo_actividad_s),0) as tiempo_t
		from Categoria_Actividad inner join 
			  Actividad_Solucion on
						id_actividad_s=id_actividad_ca
	where id_categoria_ca=@ii_categoria

		
GO

grant all on Busca_Tiempo_Total to public