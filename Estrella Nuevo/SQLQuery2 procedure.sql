SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarGrupo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[agregarGrupo] @nombre nvarchar(80),
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		
		insert into Grupos values(@nombre)

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarGrupos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[cargarGrupos]
as
	BEGIN TRY

		BEGIN TRAN 
		

		COMMIT
		select * from grupos

	END TRY

	BEGIN CATCH

		ROLLBACK

		select NULL;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paginasHistorialClientes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[paginasHistorialClientes]      
	 @PaginaNumero INT              --Número de página
	,@id_cliente INT
	,@id_razon INT
as
	
	BEGIN TRY
		BEGIN TRAN 
		DECLARE @PaginaTamanio INT,@PaginaCantidad INT,
				@PaginaInicio INT,@PaginaFin INT
		set @PaginaTamanio = 20
		
		--Ajuste de cantidad de páginas

		DECLARE @RecordCnt INT
		if @id_razon = 0
		begin
			SELECT @RecordCnt = COUNT(*)
			FROM historialClientes h 
			where id_cliente = @id_cliente
		end
		else
		begin
			SELECT @RecordCnt = COUNT(*)
			FROM historialClientes h 
			where id_cliente = @id_cliente and id_razon = @id_razon
		end

		IF @RecordCnt = 0

		   set @paginaCantidad = 0

		ELSE IF @RecordCnt % @PaginaTamanio = 0

			SET @PaginaCantidad = @RecordCnt / @PaginaTamanio

		ELSE

			SET @PaginaCantidad = (@RecordCnt / @PaginaTamanio) + 1
		
		set @paginainicio = (@PaginaTamanio ) * (@PaginaNumero - 1)
		set @paginafin = (@PaginaTamanio * @PaginaNumero) 
		
		if @id_razon = 0
		begin
			SELECT  *,@paginaCantidad as ''PaginaCantidad''
			FROM    ( 
					  SELECT    ROW_NUMBER() OVER ( ORDER BY v.dia ) AS RowNum,
					   v.dia,v.hora,v.ciudad,u.nombre,r.descripcion,h.observacion from historialclientes h 
                        join viajes v on h.id_viaje = v.id 
                        join razones r on h.id_Razon = r.id 
						join usuarios u on h.id_empleado = u.id
                        Where h.id_cliente =  @id_cliente
					) AS RowConstrainedResult
			WHERE   RowNum >= @paginainicio
				AND RowNum < @paginafin
			ORDER BY RowNum
		end
		else
		begin
			SELECT  *,@paginaCantidad as ''PaginaCantidad''
			FROM    ( 
					  SELECT    ROW_NUMBER() OVER ( ORDER BY v.dia ) AS RowNum,
					  v.dia,v.hora,v.ciudad,u.nombre,r.descripcion,h.observacion from historialclientes h
                      join viajes v on h.id_viaje = v.id 
                      join razones r on h.id_Razon = r.id 
					  join usuarios u on h.id_empleado = u.id
                      Where h.id_cliente = @id_cliente and id_razon = @id_razon
					) AS RowConstrainedResult
			WHERE   RowNum >= @paginainicio
				AND RowNum < @paginafin
			ORDER BY RowNum
		end
		COMMIT

	END TRY

	BEGIN CATCH

		ROLLBACK

	END CATCH






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarViajesFijos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[cargarViajesFijos]
					@ciudad int,
					@dia int

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		If @dia > 0
			select v.id,v.hora,d.descripcion,c.patente,c.asientos from viajesfijos v, combis c, dias d 
			Where v.eliminado <> 1 and d.id = v.dia and v.id_combi = c.Id and v.dia = @dia and v.ciudad = @ciudad
		Else
			select v.id,v.hora,d.descripcion,c.patente,c.asientos from viajesfijos v, combis c, dias d
			Where v.eliminado <> 1 and d.id = v.dia and v.id_combi = c.Id and v.ciudad = @ciudad
		
	END TRY

	BEGIN CATCH

		ROLLBACK
		select 0;

	END CATCH
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarViajesFijosClientes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[cargarViajesFijosClientes]
					@ciudad int,
					@dia int

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		If @dia = 0 
			select v.id,v.hora,d.descripcion,c.patente,c.asientos from viajesfijos v, combis c , dias d 
			Where v.eliminado <> 1 and d.id = v.dia and v.id_combi = c.Id and v.ciudad = @ciudad
		Else
			select v.id,v.hora,d.descripcion,c.patente,c.asientos from viajesfijos v, combis c, dias d 
			Where v.eliminado <> 1 and d.id = v.dia and v.id_combi = c.Id and v.ciudad = @Ciudad and v.dia = @dia
	END TRY

	BEGIN CATCH

		ROLLBACK
		select 0;

	END CATCH
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarFeriados]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[cargarFeriados]
as
	BEGIN TRY

		BEGIN TRAN 
		COMMIT
		select * from feriados order by dia desc
		

	END TRY

	BEGIN CATCH

		ROLLBACK

		select NULL;

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarFeriado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarFeriado] @dia datetime,
										@descripcion nvarchar(80),
										@result int OUTPUT
as
	declare @idViaje bigint
	declare cViajes cursor for
		select id from viajes
		where dia = @dia
	BEGIN TRY

		BEGIN TRAN 
		
		open cViajes
		fetch cViajes into @idViaje
		
		while(@@FETCH_STATUS = 0)
		begin
			update pasajes set eliminado = 1 where id_viaje = @idViaje
			update viajes set eliminado = 1 where id = @idViaje
			fetch cViajes into @idViaje
		end
		insert into Feriados values(@dia,@descripcion)
		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH

	close cViajes
	deallocate cViajes





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[verificarViajesCreadosMercedes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[verificarViajesCreadosMercedes] @dia datetime,
										@diaSemana int,
									  @result int OUTPUT
as
	declare @idAux int,@horaAux nvarchar(5),@diaAux int,
		@id_combiAux int,@ciudadAux int , @esta int, @esFeriado int
	
	select @esFeriado = count(*) from feriados
	where dia = @dia

	if @esFeriado > 0 
		set @diaSemana = 8
	
	declare cViajesFijosMercedes cursor for
		select id,hora,dia,id_combi,ciudad from viajesfijos
		where dia = @diasemana and ciudad = 0 and eliminado = 0
	BEGIN TRY
		BEGIN TRAN 
		open cViajesFijosMercedes
		
		fetch cViajesFijosMercedes into @idAux,@horaAux,@diaAux,
										@id_combiAux,@ciudadaux
		
		while(@@FETCH_STATUS = 0)
		begin
			select @esta = count(*) from viajes where dia = @dia and hora = @horaaux and ciudad = 0 and id_viaje_Fijo = @idAux
			if (@esta = 0)
			begin
				insert into viajes values(@dia,@horaaux,@id_combiaux,0,0,@idAux)
				exec venderPasajesFijos @idAux,@@IDENTITY
			end

			fetch cViajesFijosMercedes into @idAux,@horaAux,@diaAux,
											@id_combiAux,@ciudadAux
		end
		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH
	close cViajesFijosMercedes
	deallocate cViajesFijosMercedes








' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[verificarViajesCreadosBsAs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[verificarViajesCreadosBsAs] @dia datetime,
										@diaSemana int,
									  @result int OUTPUT
as
	declare @idAux int,@horaAux nvarchar(5),@diaAux int,
		@id_combiAux int,@ciudadAux int , @esta int, @esFeriado int
	
	select @esFeriado = count(*) from feriados
	where dia = @dia

	if @esFeriado > 0 
		set @diaSemana = 8
	
	declare cViajesFijosBsAs cursor for
		select id,hora,dia,id_combi,ciudad from viajesfijos
		where dia = @diasemana and ciudad = 1 and eliminado = 0
	BEGIN TRY
		BEGIN TRAN 
		open cViajesFijosBsAs
		
		fetch cViajesFijosBsAs into @idAux,@horaAux,@diaAux,
										@id_combiAux,@ciudadaux
		
		while(@@FETCH_STATUS = 0)
		begin
			select @esta = count(*) from viajes where dia = @dia and hora = @horaaux and ciudad = 1 and id_viaje_Fijo = @idAux
			if (@esta = 0)
			begin
				insert into viajes values(@dia,@horaaux,@id_combiaux,1,0,@idAux)
				exec venderPasajesFijos @idAux,@@IDENTITY
			end

			fetch cViajesFijosBsAs into @idAux,@horaAux,@diaAux,
											@id_combiAux,@ciudadAux
		end
		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH
	close cViajesFijosBsAs
	deallocate cViajesFijosBsAs








' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarChoferes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[cargarChoferes]
as
	BEGIN TRY

		BEGIN TRAN 
		

		COMMIT
		select * from choferes

	END TRY

	BEGIN CATCH

		ROLLBACK

		select NULL;

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarChofer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[agregarChofer] @nombre nvarchar(80),
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		
		insert into Choferes values(@nombre)

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarViajes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cargarViajes]
					@ciudad int,
					@dia datetime

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		select v.id,v.hora,c.patente,c.asientos, 
		(select count(*) from pasajes p where p.id_viaje = v.id and en_espera = 0 and p.eliminado = 0) as pasajes_ocupados , 
		(select count(*) from pasajes p where p.id_viaje = v.id and en_espera = 1 and p.eliminado = 0) as pasajes_espera 
		from viajes v
		join combis c on v.id_combi = c.id 
	    where v.dia = @dia and ciudad = @ciudad and v.eliminado = 0
		order by v.hora asc
		
	END TRY

	BEGIN CATCH

		ROLLBACK
		select 0;

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarCombis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cargarCombis]
as
	BEGIN TRY

		BEGIN TRAN 
		COMMIT
		select * from combis where eliminado = 0
		

	END TRY

	BEGIN CATCH

		ROLLBACK

		select NULL;

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarCombi]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarCombi] @patente nvarchar(6),
									  @descripcion nvarchar(80),
									  @asientos int,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		
		insert into Combis values(@patente,@descripcion,@asientos,0)

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[modificarCombiViaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[modificarCombiViaje] @idViaje bigint,
											 @patente nvarchar(6),
											 @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		declare @id_combi int
		select @id_combi = id from combis where patente  = @patente and eliminado = 0
		update viajes set id_combi = @id_combi where id = @idViaje

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarViaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarViaje] @hora nvarchar(5),
									  @dia datetime,
									  @patente nvarchar(6),
									  @ciudad int,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		declare @id_combi int
		select @id_combi = id from combis where patente  = @patente and eliminado = 0
		insert into Viajes values(@dia,@hora,@id_combi,@ciudad,0,null)

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarViajeFijo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarViajeFijo] @hora nvarchar(5),
										   @dia_semana int,
											@patente nvarchar(6),
											 @ciudad int,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		declare @id_combi int
		select @id_combi = id from combis where patente  = @patente and eliminado = 0
		insert into ViajesFijos values(@hora,@dia_semana,@id_combi,@ciudad,0)

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cambiarPasaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cambiarPasaje] @id_cliente int,
											  @id_viaje bigint,
											  @precio money,
											  @id_parada int,
											  @id_usuario int,
											  @result int OUTPUT

as
	BEGIN TRY

		BEGIN TRAN
		declare @idPasaje bigint, @maximo int, @cantidad int, @viajeAnt bigint
		
		select @idPasaje = p.id from pasajes p 
		join viajes v on p.id_viaje = v.id
		where v.dia = (select dbo.fecha_viaje(@id_viaje))
		and v.ciudad = (select dbo.ciudad_viaje(@id_viaje))
		and p.id_cliente =  @id_cliente
		and p.en_espera = 0 and p.eliminado = 0

		select @maximo = c.asientos from viajes v, combis c
		where v.id = @id_viaje and v.id_combi = c.id
		select @cantidad = count(*) from pasajes where id_viaje = @id_viaje and eliminado = 0
		
		if @idpasaje is not null
		begin
			if @cantidad < @maximo
			begin
				select @viajeant = id_viaje from pasajes where id = @idpasaje
				update pasajes set id_viaje = @id_viaje , precio = @precio, id_parada = @id_parada where id =  @idPasaje
				insert into historialclientes values(@id_cliente,@viajeant,@id_usuario,2,''CAMBIO DE HORARIO'',GETDATE(),@idpasaje)
				insert into historialclientes values(@id_cliente,@id_viaje,@id_usuario,5,''PASAJE VENDIDO MANUALMENTE'',GETDATE(),@idpasaje)
				set @result = 1
			end
			else
			begin
				set @result = -1
			end
		end
		else
			set @result = 0
		COMMIT
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK
		set @result=0;
		select @result;

	END CATCH
















' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[venderPasaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[venderPasaje] @id_cliente int,
											  @id_viaje bigint,
											  @precio money,
											  @id_parada int,
											  @enEspera bit,
											  @id_usuario int,
											  @result int OUTPUT

as
	BEGIN TRY

		BEGIN TRAN
		declare @cantidad int, @maximo int ,@yaCompro int
		
		select @yaCompro = count(*) from pasajes p 
		join viajes v on p.id_viaje = v.id
		where v.dia = (select dbo.fecha_viaje(@id_viaje))
		and v.ciudad = (select dbo.ciudad_viaje(@id_viaje))
		and p.id_cliente =  @id_cliente
		and p.en_espera = 0 and p.eliminado = 0

		select @maximo = c.asientos from viajes v, combis c
		where v.id = @id_viaje and v.id_combi = c.id
		select @cantidad = count(*) from pasajes where id_viaje = @id_viaje and eliminado = 0
		
		if @cantidad < @maximo and @enEspera = 0
		begin
			if @yaCompro = 0
			begin
				insert into pasajes values(@id_cliente,@id_viaje,@precio,@id_parada,0,0,0,@id_usuario,getDATE())
				insert into historialclientes values(@id_cliente,@id_viaje,@id_usuario,5,''PASAJE VENDIDO MANUALMENTE'',GETDATE(),@@IDENTITY)
				set @result = 1
			end
			else
				set @result = -1
		end
		else
		begin
			insert into pasajes values(@id_cliente,@id_viaje,@precio,null,1,0,0,@id_usuario,getDATE())
			insert into historialclientes values(@id_cliente,@id_viaje,@id_usuario,5,''PASAJE VENDIDO MANUALMENTE'',GETDATE(),@@IDENTITY)
			set @result = 1
		end
		COMMIT
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK
		set @result=0;
		select @result;

	END CATCH












' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cambiarContra]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[cambiarContra] @id_user int,
									  @contra_vieja nvarchar(50),
									  @contra_nueva nvarchar(50),
									  @resultado int output
as
	BEGIN TRY

		BEGIN TRAN 
		
		select @resultado = id from usuarios 
		where id = @id_user and contraseña = @contra_vieja

		COMMIT
		if @resultado is null
			set @resultado  = 0;
		else
		begin
			update usuarios set contraseña = @contra_nueva
			set @resultado = 1;
		end
		select @resultado;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @resultado=0;
		select @resultado;

	END CATCH





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarUsuario]
		@contraseña nvarchar(50),
		@usuario nvarchar(50),
		@result int OUTPUT

as
	BEGIN TRY

		BEGIN TRAN 

		select @result = count(*) from usuarios
		where nombre = @usuario
		
		if (@result = 0)	
			insert into usuarios values(@usuario,
										@contraseña,
										2)
		

		COMMIT
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK
		set @result=1;
		select @result;

	END CATCH




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iniciarSesion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[iniciarSesion] @nombre nvarchar(50),
									   @contraseña nvarchar(50),
									  @permisos int OUTPUT,
									  @id int output
as
	BEGIN TRY

		BEGIN TRAN 
		
		select @permisos = permisos,@id = id from usuarios 
		where nombre = @nombre and contraseña = @contraseña

		COMMIT
		if @permisos is null
		begin
			set @permisos=0;
			set @id = 0;
		end
		select @permisos,@id;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @permisos=0;
		set @id = 0;
		select @permisos,@id;

	END CATCH





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[altasViaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[altasViaje] @id_viaje bigint
as
	BEGIN TRY

		BEGIN TRAN 
		declare @maxFecha smalldatetime
		select @maxFecha = dbo.fecha_ultima_impresion(@id_viaje)
		
		select c.nombre , c.dni , p.precio, pa.descripcion from historialclientes h 
		join clientes c on c.id = h.id_cliente
		join pasajes p on p.id = h.id_pasaje
		join paradas pa on pa.id = p.id_parada
		where h.id_viaje = @id_viaje and
			  (id_razon = 4 or
			  id_razon = 5) and
			  hora >= @maxFecha

		COMMIT
	END TRY

	BEGIN CATCH

		ROLLBACK

	END CATCH





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bajasViaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[bajasViaje] @id_viaje bigint
as
	BEGIN TRY

		BEGIN TRAN 
		declare @maxFecha smalldatetime
		select @maxFecha = dbo.fecha_ultima_impresion(@id_viaje)
		select c.nombre , c.dni,p.precio,pa.descripcion from historialclientes h 
		join clientes c on c.id = h.id_cliente
		join pasajes p on p.id = h.id_pasaje
		join paradas pa on pa.id = p.id_parada
		where h.id_viaje = @id_viaje and
			  (id_razon = 1 or
			  id_razon = 2 or
			  id_razon = 3 ) and
			  hora >= @maxFecha

		COMMIT
	END TRY

	BEGIN CATCH

		ROLLBACK

	END CATCH





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarDatosVentaPasajero]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cargarDatosVentaPasajero]
						@nombre_cliente nvarchar(80),
						@id_viaje bigint
as
	BEGIN TRY

		BEGIN TRAN 
		declare @ciudad int
		select @ciudad = dbo.ciudad_viaje(@id_viaje)
		COMMIT
		if @ciudad = 0
		select celular,dni,preciomercedes,descripcion from clientes c
                      left join paradas m on m.id = c.paradamercedes 
                      where c.eliminado = 0 and nombre = @nombre_Cliente
		else
		select celular,dni,preciobsas, descripcion from clientes c
                      left join paradas b on b.id = c.paradabsas
                      where c.eliminado = 0 and nombre = @nombre_Cliente
		

	END TRY

	BEGIN CATCH

		ROLLBACK

		select NULL;

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paginasClientes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[paginasClientes]      
	 @PaginaNumero INT              --Número de página
	,@NombreFiltro nvarchar(40)
as
	
	BEGIN TRY
		BEGIN TRAN 
		DECLARE @PaginaTamanio INT,@PaginaCantidad INT,
				@PaginaInicio INT,@PaginaFin INT
		set @PaginaTamanio = 20
		
		--Ajuste de cantidad de páginas

		DECLARE @RecordCnt INT

		SELECT @RecordCnt = COUNT(*)
		FROM clientes c 
		where c.nombre like ''%'' + @NombreFiltro + ''%'' and
			  c.eliminado = 0

		IF @RecordCnt = 0

		   set @paginaCantidad = 0

		ELSE IF @RecordCnt % @PaginaTamanio = 0

			SET @PaginaCantidad = @RecordCnt / @PaginaTamanio

		ELSE

			SET @PaginaCantidad = (@RecordCnt / @PaginaTamanio) + 1
		
		set @paginainicio = (@PaginaTamanio ) * (@PaginaNumero - 1)
		set @paginafin = (@PaginaTamanio * @PaginaNumero) 

		SELECT  *,@paginaCantidad as ''PaginaCantidad''
		FROM    ( 
				  SELECT    ROW_NUMBER() OVER ( ORDER BY c.id ) AS RowNum,
				  c.id,c.nombre,c.dni,pm.descripcion as ''pm'',pb.descripcion as ''pb''
				  FROM clientes c
				  left join paradas pm on pm.id = c.paradamercedes 
				  left join paradas pb on pb.id = c.paradabsas
				  where c.nombre like ''%'' + @NombreFiltro + ''%'' and
						c.eliminado = 0
				) AS RowConstrainedResult
		WHERE   RowNum >= @paginainicio
			AND RowNum < @paginafin
		ORDER BY RowNum
		COMMIT

	END TRY

	BEGIN CATCH

		ROLLBACK

	END CATCH




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eliminarParada]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[eliminarParada] @id int,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		declare @orden int
		declare @ciudad int
		select @orden = orden from paradas where id = @id
		select @ciudad = ciudad from paradas where id = @id
		
		update clientes set paradamercedes = NULL where paradamercedes = @id
		update clientes set paradabsas = NULL where paradabsas = @id
		delete paradas where id = @id
		IF @orden is not null
		BEGIN
			update paradas set orden = orden -1 where orden > @orden and ciudad = @ciudad		
		END

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarPasajesImprimir]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cargarPasajesImprimir]
					@idViaje bigint

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		select pm.descripcion descripcionB,c.nombre nombreB,c.dni dniB,p.precio precioB from pasajes p
                     join viajes v on p.id_viaje = v.id 
                     join clientes c on p.id_cliente = c.id 
                     left join paradas pm on p.id_parada = pm.id 
                     Where id_viaje = @IdViaje and en_espera = 0 and p.eliminado = 0
                     order by pm.orden
	END TRY

	BEGIN CATCH

		ROLLBACK
		select NULL;
	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarPasajesViaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cargarPasajesViaje]
					@idViaje bigint

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		select c.celular,p.en_espera,p.id,pm.descripcion,c.nombre,c.dni,v.ciudad,p.precio,p.color from pasajes p 
                     join viajes v on p.id_viaje = v.id 
                     join clientes c on p.id_cliente = c.id 
                     left join paradas pm on p.id_parada = pm.id 
                     Where id_viaje = @IdViaje and p.eliminado = 0
                      order by p.id
		
	END TRY

	BEGIN CATCH

		ROLLBACK
		select 0;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[verificarExistenciaClienteMercedes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[verificarExistenciaClienteMercedes] @nombre_cliente nvarchar(80),
											  @descripcion_parada nvarchar(50),
											  @precio money,
											  @dni nvarchar(16),
											  @celular nvarchar(18),
											  @result int OUTPUT,
											  @nuevo int OUTPUT

as
		BEGIN TRY

		BEGIN TRAN 
		declare @dniAux nvarchar(16), @existe int,@id_parada int,@paradaaux int,@precioaux money,@celularaux nvarchar(18)
		
		select @id_parada = id from paradas 
		where descripcion = @descripcion_parada and eliminado = 0
		select @existe = id from clientes
		where nombre = @nombre_cliente
		and eliminado = 0
		set @nuevo = 0;
		if (@existe is null)
		begin
			insert into clientes(nombre,dni,paradamercedes,preciomercedes,celular,eliminado)
						values(@nombre_cliente,@dni,@id_parada,@precio,@celular,0)
			set @result=@@IDENTITY;
			set @nuevo = 1;
		end
		else
		begin
			select @dniAux = dni, @paradaaux = paradamercedes,@precioaux = preciomercedes, @celularaux = celular
			from clientes
			where id = @existe
			if (@dniaux is null or @dniaux = '''')
				update clientes set dni = @dni where id = @existe
			if (@paradaaux is null or @paradaaux = '''')
				update clientes set paradamercedes = @id_parada where id = @existe
			if (@precioaux is null or @precioaux = '''')
				update clientes set preciomercedes = @precio where id = @existe
			if (@celularaux is null or @celularaux = '''')
				update clientes set celular = @celular where id = @existe
			set @result = @existe
		end
		COMMIT
		
		select @result,@nuevo;

	END TRY

	BEGIN CATCH

		ROLLBACK
		set @result=0;
		set @nuevo = 0;
		select @result,@nuevo;

	END CATCH






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[verificarExistenciaClienteBuenosAires]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[verificarExistenciaClienteBuenosAires] @nombre_cliente nvarchar(80),
											  @descripcion_parada nvarchar(50),
											  @precio money,
											  @dni nvarchar(50),
											  @celular nvarchar(18),
											  @result int OUTPUT,
											  @nuevo int OUTPUT

as
		BEGIN TRY

		BEGIN TRAN 
		declare @dniAux nvarchar(16), @existe int,@id_parada int,@paradaaux int,@precioaux money,@celularaux nvarchar(18)
		
		select @id_parada = id from paradas
		where descripcion = @descripcion_parada and eliminado = 0
		
		select @existe = id from clientes
		where nombre = @nombre_cliente
		and eliminado = 0
		set @nuevo = 0;
		if (@existe is null)
		begin
			insert into clientes(nombre,dni,paradabsas,preciobsas,celular,eliminado)
						values(@nombre_cliente,@dni,@id_parada,@precio,@celular,0)
			set @nuevo = 1;
			set @result=@@IDENTITY;
		end
		else
		begin
			select @dniAux = dni, @paradaaux = paradabsas,@precioaux = preciobsas , @celularaux = celular
			from clientes
			where id = @existe
			if (@dniaux is null or @dniaux = '''')
				update clientes set dni = @dni where id = @existe
			if (@paradaaux is null or @paradaaux = '''')
				update clientes set paradabsas = @id_parada where id = @existe
			if (@precioaux is null or @precioaux = '''')
				update clientes set preciobsas = @precio where id = @existe
			if (@celularaux is null or @celularaux = '''')
				update clientes set celular = @celular where id = @existe
			set @result = @existe
		end
		COMMIT
		
		select @result,@nuevo;

	END TRY

	BEGIN CATCH

		ROLLBACK
		set @result=0;
		set @nuevo=0;
		select @result,@nuevo;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarParada]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarParada] @descripcion nvarchar(50),
										@ciudad int,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN
		declare @orden int,@existe int
		select @existe = id from paradas where descripcion = @descripcion and ciudad = @ciudad and eliminado = 0
		print @existe
		if @existe is null
		begin
			select @orden = max(orden) from paradas where ciudad = @ciudad
		
			IF @orden is null
			BEGIN
				set @orden = 1
			END
			ELSE
				set @orden = @orden + 1

			insert into Paradas values(@descripcion,@orden,@ciudad,0)

			
			set @result=1;
		end
		else
			set @result=0;
			COMMIT
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bajarOrdenParada]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[bajarOrdenParada] @id int,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		declare @orden int
		declare @ciudad int
		select @orden = orden from paradas where id = @id
		select @ciudad = ciudad from paradas where id = @id
		
		update paradas set orden = @orden where eliminado = 0 and ciudad = @ciudad and orden = (@orden - 1)
		update paradas set orden = @orden - 1 where eliminado = 0 and id = @id

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subirOrdenParada]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[subirOrdenParada] @id int,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		declare @orden int
		declare @ciudad int
		select @orden = orden from paradas where id = @id
		select @ciudad = ciudad from paradas where id = @id
		
		update paradas set orden = @orden where eliminado = 0 and ciudad = @ciudad and orden = (@orden + 1)
		update paradas set orden = @orden + 1 where eliminado  = 0 and id = @id

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarParadas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cargarParadas]
					@ciudad int

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		select * from paradas where eliminado = 0 and ciudad = @Ciudad order by orden

	END TRY

	BEGIN CATCH

		ROLLBACK
		select null

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[obtenerIdParada]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[obtenerIdParada]
					@ciudad int,
					@descripcion nvarchar(50),
					@resultado int output

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		select @resultado = id from paradas where ciudad = @ciudad and descripcion = @descripcion
		if @resultado is null
			set @resultado = 0
		select @resultado;
	END TRY

	BEGIN CATCH

		ROLLBACK
		select 0;

	END CATCH

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarClienteModificar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cargarClienteModificar]
						@idCliente int
as
	BEGIN TRY

		BEGIN TRAN 
		COMMIT
		select c.id,c.dni,c.nombre,c.sexo,c.mail,c.direccion,pm.descripcion mercedes,pb.descripcion bsas,c.preciobsas,c.preciomercedes,c.celular,c.casa,c.observaciones,c.mensual from clientes c
                     left join paradas pm on pm.id = c.paradamercedes 
                     left join paradas pb on pb.id = c.paradabsas 
                     where c.id = @IdCliente
		

	END TRY

	BEGIN CATCH

		ROLLBACK

		select NULL;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eliminarViajeFijo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[eliminarViajeFijo] @id int,
										   @ahora datetime,
									  @result int OUTPUT
as
	declare @idViaje bigint
	declare cViajes cursor for
		select id from viajes
		where id_viaje_fijo = @id and dia >= @ahora
	BEGIN TRY

		BEGIN TRAN 
		
		open cViajes
		fetch cViajes into @idViaje
		
		while(@@FETCH_STATUS = 0)
		begin
			update pasajes set eliminado = 1 where id_viaje = @idViaje
			update viajes set eliminado = 1 where id = @idViaje
			fetch cViajes into @idViaje
		end
		delete viajesFijosClientes where id_horarioFijo = @id
		update viajesFijos set eliminado = 1 where id = @id

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH

	close cViajes
	deallocate cViajes









' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eliminarPasaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[eliminarPasaje] @id_pasaje bigint,
										@nombre_cliente nvarchar(80),
										@id_viaje bigint,
										@id_empleado int,
										@id_razon int,
										@observacion nvarchar(200),
										@result int OUTPUT

as
		BEGIN TRY

		BEGIN TRAN 
		declare @id_cliente int
		
		select @id_cliente = id from clientes
		where nombre = @nombre_cliente and eliminado = 0
		
		update pasajes set eliminado = 1 where id = @id_pasaje
		insert into historialclientes values(@id_cliente,
											 @id_viaje,
											 @id_empleado,
											 @id_razon,
											 @observacion,
											 GETDATE(),
											 @id_pasaje)
		COMMIT
		set @result = 1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK
		set @result=0;
		select @result;

	END CATCH









' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[venderPasajesFijos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[venderPasajesFijos] @id_viajeFijo int,
										@id_viaje bigint
as
	declare @precioAuxMer as money,@precioAuxBsAs as money, @idHorarioFijoAux int,@idClienteAux int,@idParadaMer int,@idParadaBsAs int,@ciudad int

	declare cViajesFijosClientes cursor for
		select id_horarioFijo,id_cliente from viajesfijosclientes
		where id_horarioFijo = @id_viajeFijo
	BEGIN TRY
		BEGIN TRAN 
		open cViajesFijosClientes
		
		fetch cViajesFijosClientes into @idHorarioFijoAux,@idClienteAux
		
		while(@@FETCH_STATUS = 0)
		begin
			select @ciudad = ciudad from viajes where id = @id_viaje
			select @idParadaMer = paradamercedes, @idParadaBsAs = paradabsas,
				   @precioauxMer = preciomercedes,@precioAuxBsas = preciobsas from clientes
			where id = @idClienteAux
			if @ciudad = 0
				insert into pasajes values(@idClienteAux,@id_viaje,@precioauxMer,@idParadaMer,0,0,0,1,GETDATE())
			else
				insert into pasajes values(@idClienteAux,@id_viaje,@precioAuxBsas,@idParadaBsAs,0,0,0,1,GETDATE())
			insert into historialclientes values(@idClienteAux,@id_viaje,1,4,''PASAJE VENDIDO POR CLIENTE FIJO'',GETDATE(),@@IDENTITY)
			fetch cViajesFijosClientes into @idHorarioFijoAux,@idClienteAux
		end
		COMMIT

	END TRY

	BEGIN CATCH

		ROLLBACK

	END CATCH
	close cViajesFijosClientes
	deallocate cViajesFijosClientes






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarClienteAViajeFijo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarClienteAViajeFijo] @idCliente int,
										   @idViajeFijo int,
											@ahora datetime,
									  @result int OUTPUT
as
	declare @precioAuxMer as money,@precioAuxBsAs as money, @idParadaMer int,@idParadaBsAs int,@ciudad int
	declare @idViaje bigint
	declare cViajes cursor for
		select id from viajes
		where id_viaje_fijo = @idViajeFijo and dia >= @ahora
	BEGIN TRY

		BEGIN TRAN 
		
		open cViajes
		fetch cViajes into @idViaje
		
		while(@@FETCH_STATUS = 0)
		begin
			select @ciudad = ciudad from viajes where id = @idViaje
			select @idParadaMer = paradamercedes, @idParadaBsAs = paradabsas,
			@precioauxMer = preciomercedes,@precioAuxBsas = preciobsas from clientes
			where id = @idCliente
			if @ciudad = 0
				insert into pasajes values(@idCliente,@idViaje,@precioauxMer,@idParadaMer,0,0,0,1,GETDATE())
			else
				insert into pasajes values(@idCliente,@idViaje,@precioAuxBsas,@idParadaBsAs,0,0,0,1,GETDATE())
			insert into historialclientes values(@idCliente,@idViaje,1,4,''PASAJE VENDIDO POR CLIENTE FIJO'',GETDATE(),@@IDENTITY)
			fetch cViajes into @idViaje
		end

		insert into viajesFijosClientes values(@idViajeFijo , @idCliente)
		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH
	close cViajes
	deallocate cViajes








' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarImpresion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarImpresion] @id_viaje bigint,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		
		insert into impresiones(hora,id_viaje,id_chofer,interno) values(GETDATE(),@id_viaje,null,null)

		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getHoraPasajeComprado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[getHoraPasajeComprado]
					@idViaje bigint,
					@idCliente int,
					@hora nvarchar(5) output

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		select @hora = v.hora from pasajes p 
              join viajes v on p.id_viaje = v.id 
              where v.dia = (select dbo.fecha_viaje(@idViaje)) 
              and v.ciudad = (select dbo.ciudad_viaje(@idViaje)) 
              and p.id_cliente =  @idCliente and p.en_espera = 0
		if @hora is null
			set @hora = ''00:00''
		select @hora;
	END TRY

	BEGIN CATCH

		ROLLBACK
		set @hora = ''00:00''
		select @hora;
	END CATCH

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eliminarViaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[eliminarViaje] @id bigint,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		update pasajes set eliminado = 1 where id_viaje = @id
		update viajes set eliminado = 1 where id = @id
		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH











' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eliminarClienteAViajeFijo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[eliminarClienteAViajeFijo] @idCliente int,
										   @idViajeFijo int,
											@ahora datetime,
									  @result int OUTPUT
as
	declare @idViaje bigint
	declare cViajes cursor for
		select id from viajes
		where id_viaje_fijo = @idViajeFijo and dia >= @ahora
	BEGIN TRY

		BEGIN TRAN 
		
		open cViajes
		fetch cViajes into @idViaje
		
		while(@@FETCH_STATUS = 0)
		begin
			update pasajes set eliminado = 1 where id_viaje = @idViaje and id_cliente = @idCliente
			fetch cViajes into @idViaje
		end

		delete viajesFijosClientes where id_cliente = @idcliente and id_horarioFijo = @idviajefijo
		COMMIT
		set @result=1;
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH
	close cViajes
	deallocate cViajes







' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ponerEnOcupado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[ponerEnOcupado] @idpasaje bigint,
										@idparada int,
									  @result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
		
		declare @yaCompro int,@id_cliente bigint, @id_viaje bigint

		select @id_cliente = id_cliente , @id_viaje = id_viaje
		from pasajes
		where id =  @idpasaje
		
		select @yaCompro = count(*) from pasajes p 
		join viajes v on p.id_viaje = v.id
		where v.dia = (select dbo.fecha_viaje(@id_viaje))
		and v.ciudad = (select dbo.ciudad_viaje(@id_viaje))
		and p.id_cliente =  @id_cliente
		and p.en_espera = 0 and p.eliminado = 0


		if @yacompro = 0
		begin
			update pasajes set en_espera = 0,id_parada = @idParada  where id = @idPasaje
			set @result=1;
		end
		else
			set @result = -1;

		COMMIT
		
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK

		set @result=0;
		select @result;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getHoraPasajeCompradoAux]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[getHoraPasajeCompradoAux]
					@idPasaje bigint,
					@hora nvarchar(5) output

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		declare @idcliente bigint, @idviaje bigint

		select @idcliente = id_cliente , @idviaje = id_viaje
		from pasajes
		where id =  @idpasaje

		select @hora = v.hora from pasajes p 
              join viajes v on p.id_viaje = v.id 
              where v.dia = (select dbo.fecha_viaje(@idViaje)) 
              and v.ciudad = (select dbo.ciudad_viaje(@idViaje)) 
              and p.id_cliente =  @idCliente and p.en_espera = 0
		if @hora is null
			set @hora = ''00:00''
		select @hora;
	END TRY

	BEGIN CATCH

		ROLLBACK
		set @hora = ''00:00''
		select @hora;
	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pintarpasaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[pintarpasaje]
					@idPasaje bigint,
					@color as bigint

as
	BEGIN TRY

		BEGIN TRAN 
		update pasajes set color = @color where id = @idpasaje
		commit
		
	END TRY

	BEGIN CATCH

		ROLLBACK

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarCliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarCliente]
		@nombre nvarchar(80),
		@dni nvarchar(16),
		@sexo bit,
		@mail nvarchar(80),
		@direccion nvarchar(80),
		@paradaMer int,
		@paradaBsAs int,
		@precioMer money,
		@precioBsAs money,
		@celular nvarchar(18),
		@casa nvarchar(18),
		@observaciones text,
		@mensual bit,
		@result int OUTPUT

as
	BEGIN TRY

		BEGIN TRAN 

		select @result = count(*) from clientes
		where nombre = @nombre and eliminado = 0
		
		if (@result = 0)	
			insert into Clientes values(@nombre,
										@dni,
										@sexo,
										@mail,
										@direccion,
										@paradaMer,
										@paradaBsAs,
										@precioMer,
										@precioBsAs,
										@celular,
										@casa,
										@observaciones,
										0,
										@mensual)
		

		COMMIT
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK
		set @result=1;
		select @result;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[modificarCliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[modificarCliente]
		@id int,
		@nombre nvarchar(80),
		@dni nvarchar(16),
		@sexo bit,
		@mail nvarchar(80),
		@direccion nvarchar(80),
		@paradaMer int,
		@paradaBsAs int,
		@precioMer money,
		@precioBsAs money,
		@celular nvarchar(18),
		@casa nvarchar(18),
		@observaciones text,
		@mensual bit,
		@result int OUTPUT

as
	BEGIN TRY

		BEGIN TRAN 
		declare @nombreAnt nvarchar(80)

		select @nombreAnt = nombre from clientes where id = @id

		select @result = count(*) from clientes
		where nombre = @nombre and eliminado = 0
		
		if (@result = 0 or (@result = 1 and @nombreAnt = @nombre))
		BEGIN
			update Clientes set	nombre = @nombre,
								dni =	 @dni,
								sexo =	 @sexo,
								mail =	 @mail,
								direccion = @direccion,
								paradamercedes = @paradaMer,
								paradabsas = @paradaBsAs,
								preciomercedes = @precioMer,
								preciobsas = @precioBsAs,
								celular = @celular,
								casa =	 @casa,
								observaciones = @observaciones,
								mensual = @mensual
						where id = @id
			set @result = 0
		end
		if @result = 2
			set @result = 1							 		

		COMMIT
		select @result;

	END TRY

	BEGIN CATCH

		ROLLBACK
		set @result=1;
		select @result;

	END CATCH



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarClientes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[cargarClientes]
as
	BEGIN TRY

		BEGIN TRAN 
		

		COMMIT
		select nombre from clientes where eliminado = 0

	END TRY

	BEGIN CATCH

		ROLLBACK

		select NULL;

	END CATCH


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[marcarViajesFijosClientes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[marcarViajesFijosClientes]
					@idCliente int

as
	BEGIN TRY

		BEGIN TRAN 
		commit
		select * from viajesfijosclientes Where id_cliente = @idcliente
	END TRY

	BEGIN CATCH

		ROLLBACK
		select 0;

	END CATCH
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cargarListadoClientesFijos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[cargarListadoClientesFijos]
as
	BEGIN TRY

		BEGIN TRAN 
		

		COMMIT
		select nombre,
			  hora_salida,
			  hora_regreso,
			  lunes,
			  martes,
			  miercoles,
			  jueves,
			  viernes,
			  sabado,
			  domingo,
			  feriado,
			  celular,
			  parada_mercedes + ''/'' + parada_bsas as parada ,
			  mensual
				from listado_completo
			order by nombre asc

	END TRY

	BEGIN CATCH

		ROLLBACK

		select NULL;

	END CATCH
' 
END
