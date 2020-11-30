
IF EXISTS (SELECT name FROM sysobjects 
         WHERE name = 'Consulta_Material_Produccion' AND type = 'P')
   DROP PROCEDURE Consulta_Material_Produccion
GO

CREATE PROCEDURE Consulta_Material_Produccion
   @ii_producto	int

AS 
	select id_material_pm,descr_material,cant_pm 
		from producto_material inner join material
				on id_material=id_material_pm
		where id_producto_pm=@ii_producto and 
			  estado_material='A'and 
			  estado_pm='A'

		
GO

grant all on Consulta_Material_Produccion to public



IF EXISTS (SELECT name FROM sysobjects 
         WHERE name = 'Consulta_Equipo_Produccion' AND type = 'P')
   DROP PROCEDURE Consulta_Equipo_Produccion
GO

CREATE PROCEDURE Consulta_Equipo_Produccion
   @ii_producto	int

AS 
	select id_equipo,descr_equipo 
		from producto_t_equipo inner join equipo
				on id_tequipo=id_t_equipo_pte
		where id_producto_pte=@ii_producto and 
			  estado_equipo='A'and 
			  estado_pte='A' and
			  en_uso_equipo=''

		
GO

grant all on Consulta_Equipo_Produccion to public