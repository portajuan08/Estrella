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
										0)
		

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
								observaciones = @observaciones
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grupos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Grupos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_Grupos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Razones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Razones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Razones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feriados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Feriados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dia] [datetime] NOT NULL,
	[descripcion] [nvarchar](80) NULL,
 CONSTRAINT [PK_Feriados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Choferes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Choferes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](80) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Combis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Combis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patente] [nvarchar](6) NOT NULL,
	[descripcion] [nvarchar](80) NOT NULL,
	[asientos] [int] NOT NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_Combis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paradas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paradas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[orden] [int] NOT NULL,
	[ciudad] [int] NOT NULL,
	[eliminado] [int] NULL,
 CONSTRAINT [PK_Paradas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientesGrupos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ClientesGrupos](
	[id_cliente] [int] NOT NULL,
	[id_grupo] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistorialClientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HistorialClientes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_viaje] [bigint] NOT NULL,
	[empleado] [nvarchar](50) NOT NULL,
	[id_razon] [int] NOT NULL,
	[observacion] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_HistorialClientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viajes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Viajes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[dia] [datetime] NOT NULL,
	[hora] [nvarchar](5) NOT NULL,
	[id_combi] [int] NOT NULL,
	[ciudad] [int] NOT NULL,
	[eliminado] [bit] NULL,
	[id_viaje_fijo] [int] NULL,
 CONSTRAINT [PK_Viajes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViajesFijosClientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ViajesFijosClientes](
	[id_horarioFijo] [int] NOT NULL,
	[id_cliente] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pasajes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_viaje] [bigint] NOT NULL,
	[precio] [money] NULL,
	[id_parada] [int] NULL,
	[en_espera] [bit] NOT NULL,
 CONSTRAINT [PK_Pasajes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViajesFijos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ViajesFijos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hora] [nvarchar](5) NOT NULL,
	[dia] [int] NOT NULL,
	[id_combi] [int] NOT NULL,
	[ciudad] [int] NOT NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_HorariosFijos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](80) NOT NULL,
	[dni] [nvarchar](16) NULL,
	[sexo] [bit] NULL,
	[mail] [nvarchar](80) NULL,
	[direccion] [nvarchar](80) NULL,
	[paradamercedes] [int] NULL,
	[paradabsas] [int] NULL,
	[preciomercedes] [money] NULL,
	[preciobsas] [money] NULL,
	[celular] [nvarchar](18) NULL,
	[casa] [nvarchar](18) NULL,
	[observaciones] [text] NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Clientes] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
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
		set @PaginaTamanio = 5
		
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
					   v.dia,v.hora,v.ciudad,h.empleado,r.descripcion,h.observacion from historialclientes h 
                        join viajes v on h.id_viaje = v.id 
                        join razones r on h.id_Razon = r.id 
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
					  v.dia,v.hora,v.ciudad,h.empleado,r.descripcion,h.observacion from historialclientes h
                      join viajes v on h.id_viaje = v.id 
                      join razones r on h.id_Razon = r.id 
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
			delete pasajes where id_viaje = @idViaje
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[venderPasaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[venderPasaje] @id_cliente int,
											  @id_viaje bigint,
											  @precio money,
											  @id_parada int,
											  @result int OUTPUT

as
	BEGIN TRY

		BEGIN TRAN
		declare @cantidad int
		declare @maximo int
		select @maximo = c.asientos from viajes v, combis c
		where v.id = @id_viaje and v.id_combi = c.id
		select @cantidad = count(*) from pasajes where id_viaje = @id_viaje
		
		if @cantidad < @maximo
			insert into pasajes values(@id_cliente,@id_viaje,@precio,@id_parada,0)
		else
			insert into pasajes values(@id_cliente,@id_viaje,@precio,null,1)
		insert into historialclientes values(@id_cliente,@id_viaje,''SISTEMA'',5,''PASAJE VENDIDO MANUALMENTE'')
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
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[modificarCombiViaje] @idViaje int,
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eliminarClienteAViajeFijo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[eliminarClienteAViajeFijo] @idCliente int,
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
			delete pasajes where id_viaje = @idViaje and id_cliente = @idCliente
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarClienteAViajeFijo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[agregarClienteAViajeFijo] @idCliente int,
										   @idViajeFijo int,
											@ahora datetime,
									  @result int OUTPUT
as
	declare @idParadaMer int,@idParadaBsAs int,@ciudad int
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
			select @idParadaMer = paradamercedes, @idParadaBsAs = paradabsas from clientes
			where id = @idCliente
			if @ciudad = 0
				insert into pasajes values(@idCliente,@idViaje,0,@idParadaMer,0)
			else
				insert into pasajes values(@idCliente,@idViaje,0,@idParadaBsAs,0)
			insert into historialclientes values(@idCliente,@idViaje,''SISTEMA'',4,''PASAJE VENDIDO POR CLIENTE FIJO'')
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[venderPasajesFijos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[venderPasajesFijos] @id_viajeFijo int,
										@id_viaje bigint
as
	declare @idHorarioFijoAux int,@idClienteAux int,@idParadaMer int,@idParadaBsAs int,@ciudad int

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
			select @idParadaMer = paradamercedes, @idParadaBsAs = paradabsas from clientes
			where id = @idClienteAux
			if @ciudad = 0
				insert into pasajes values(@idClienteAux,@id_viaje,0,@idParadaMer,0)
			else
				insert into pasajes values(@idClienteAux,@id_viaje,0,@idParadaBsAs,0)
			insert into historialclientes values(@idClienteAux,@id_viaje,''SISTEMA'',4,''PASAJE VENDIDO POR CLIENTE FIJO'')
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fecha_viaje]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[fecha_viaje]( @id_viaje int)
returns datetime

as
	begin
		declare @fecha datetime
		
		select @fecha = dia from viajes
		where id = @id_viaje
		
		return @fecha
	end;' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ciudad_viaje]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[ciudad_viaje]( @id_viaje int)
returns bit

as
	begin
		declare @ciudad bit
		
		select @ciudad = ciudad from viajes
		where id = @id_viaje
		
		return @ciudad
	end;
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[verificarExistenciaClienteMercedes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[verificarExistenciaClienteMercedes] @nombre_cliente nvarchar(80),
											  @descripcion_parada nvarchar(50),
											  @precio money,
											  @dni nvarchar(16),
											  @celular nvarchar(18),
											  @result int OUTPUT

as
		BEGIN TRY

		BEGIN TRAN 
		declare @existe int,@id_parada int,@paradaaux int,@precioaux money,@celularaux nvarchar(18)
		
		select @id_parada = id from paradas 
		where descripcion = @descripcion_parada and eliminado = 0
		select @existe = id from clientes
		where nombre = @nombre_cliente
		and eliminado = 0
		if (@existe is null)
		begin
			insert into clientes(nombre,dni,paradamercedes,preciomercedes,celular,eliminado)
						values(@nombre_cliente,@dni,@id_parada,@precio,@celular,0)
			set @result=@@IDENTITY;
		end
		else
		begin
			select @paradaaux = paradamercedes,@precioaux = preciomercedes, @celularaux = celular
			from clientes
			where id = @existe
			if (@paradaaux is null)
				update clientes set paradamercedes = @id_parada where id = @existe
			if (@precioaux is null)
				update clientes set preciomercedes = @precio where id = @existe
			if (@celularaux is null)
				update clientes set celular = @celular where id = @existe
			set @result = @existe
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[verificarExistenciaClienteBuenosAires]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[verificarExistenciaClienteBuenosAires] @nombre_cliente nvarchar(80),
											  @descripcion_parada nvarchar(50),
											  @precio money,
											  @dni nvarchar(50),
											  @celular nvarchar(18),
											  @result int OUTPUT

as
		BEGIN TRY

		BEGIN TRAN 
		declare @existe int,@id_parada int,@paradaaux int,@precioaux money,@celularaux nvarchar(18)
		
		select @id_parada = id from paradas
		where descripcion = @descripcion_parada and eliminado = 0
		
		select @existe = id from clientes
		where nombre = @nombre_cliente
		and eliminado = 0
		if (@existe is null)
		begin
			insert into clientes(nombre,dni,paradabsas,preciobsas,celular,eliminado)
						values(@nombre_cliente,@dni,@id_parada,@precio,@celular,0)
			set @result=@@IDENTITY;
		end
		else
		begin
			select @paradaaux = paradabsas,@precioaux = preciobsas , @celularaux = celular
			from clientes
			where id = @existe
			if (@paradaaux is null)
				update clientes set paradabsas = @id_parada where id = @existe
			if (@precioaux is null)
				update clientes set preciobsas = @precio where id = @existe
			if (@celularaux is null)
				update clientes set celular = @celular where id = @existe
			set @result = @existe
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eliminarPasaje]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[eliminarPasaje] @id_pasaje int,
										@nombre_cliente nvarchar(80),
										@id_viaje int,
										@nombre_empleado nvarchar(80),
										@id_razon int,
										@observacion nvarchar(200),
										@result int OUTPUT

as
		BEGIN TRY

		BEGIN TRAN 
		declare @id_cliente int
		
		select @id_cliente = id from clientes
		where nombre = @nombre_cliente and eliminado = 0
		
		delete pasajes where id = @id_pasaje
		insert into historialclientes values(@id_cliente,
											 @id_viaje,
											 @nombre_empleado,
											 @id_razon,
											 @observacion)
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarFeriado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[agregarFeriado] @dia datetime,
										@descripcion nvarchar(80),
										@result int OUTPUT
as
	BEGIN TRY

		BEGIN TRAN 
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




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agregarChofer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[agregarChofer] @nombre nvarchar(80),
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Combis_Combis]') AND parent_object_id = OBJECT_ID(N'[dbo].[Combis]'))
ALTER TABLE [dbo].[Combis]  WITH CHECK ADD  CONSTRAINT [FK_Combis_Combis] FOREIGN KEY([id])
REFERENCES [dbo].[Combis] ([id])
GO
ALTER TABLE [dbo].[Combis] CHECK CONSTRAINT [FK_Combis_Combis]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientesGrupos_Clientes]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientesGrupos]'))
ALTER TABLE [dbo].[ClientesGrupos]  WITH CHECK ADD  CONSTRAINT [FK_ClientesGrupos_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[ClientesGrupos] CHECK CONSTRAINT [FK_ClientesGrupos_Clientes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientesGrupos_grupos]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientesGrupos]'))
ALTER TABLE [dbo].[ClientesGrupos]  WITH CHECK ADD  CONSTRAINT [FK_ClientesGrupos_grupos] FOREIGN KEY([id_grupo])
REFERENCES [dbo].[Grupos] ([id])
GO
ALTER TABLE [dbo].[ClientesGrupos] CHECK CONSTRAINT [FK_ClientesGrupos_grupos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialClientes_Clientes]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialClientes]'))
ALTER TABLE [dbo].[HistorialClientes]  WITH CHECK ADD  CONSTRAINT [FK_HistorialClientes_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[HistorialClientes] CHECK CONSTRAINT [FK_HistorialClientes_Clientes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialClientes_razones]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialClientes]'))
ALTER TABLE [dbo].[HistorialClientes]  WITH CHECK ADD  CONSTRAINT [FK_HistorialClientes_razones] FOREIGN KEY([id_razon])
REFERENCES [dbo].[Razones] ([id])
GO
ALTER TABLE [dbo].[HistorialClientes] CHECK CONSTRAINT [FK_HistorialClientes_razones]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialClientes_Viajes]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialClientes]'))
ALTER TABLE [dbo].[HistorialClientes]  WITH CHECK ADD  CONSTRAINT [FK_HistorialClientes_Viajes] FOREIGN KEY([id_viaje])
REFERENCES [dbo].[Viajes] ([id])
GO
ALTER TABLE [dbo].[HistorialClientes] CHECK CONSTRAINT [FK_HistorialClientes_Viajes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viajes_Combis]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viajes]'))
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_Combis] FOREIGN KEY([id_combi])
REFERENCES [dbo].[Combis] ([id])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_Combis]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viajes_ViajesFijos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viajes]'))
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_ViajesFijos] FOREIGN KEY([id_viaje_fijo])
REFERENCES [dbo].[ViajesFijos] ([id])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_Viajes_ViajesFijos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorariosFijosClientes_Clientes]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViajesFijosClientes]'))
ALTER TABLE [dbo].[ViajesFijosClientes]  WITH CHECK ADD  CONSTRAINT [FK_HorariosFijosClientes_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[ViajesFijosClientes] CHECK CONSTRAINT [FK_HorariosFijosClientes_Clientes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorariosFijosClientes_HorariosFijos]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViajesFijosClientes]'))
ALTER TABLE [dbo].[ViajesFijosClientes]  WITH CHECK ADD  CONSTRAINT [FK_HorariosFijosClientes_HorariosFijos] FOREIGN KEY([id_horarioFijo])
REFERENCES [dbo].[ViajesFijos] ([id])
GO
ALTER TABLE [dbo].[ViajesFijosClientes] CHECK CONSTRAINT [FK_HorariosFijosClientes_HorariosFijos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajes_Clientes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajes]'))
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Clientes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajes_ParadasMercedes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajes]'))
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_ParadasMercedes] FOREIGN KEY([id_parada])
REFERENCES [dbo].[Paradas] ([id])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_ParadasMercedes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajes_Viajes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajes]'))
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Viajes] FOREIGN KEY([id_viaje])
REFERENCES [dbo].[Viajes] ([id])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Viajes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViajesFijos_Dias]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViajesFijos]'))
ALTER TABLE [dbo].[ViajesFijos]  WITH CHECK ADD  CONSTRAINT [FK_ViajesFijos_Dias] FOREIGN KEY([dia])
REFERENCES [dbo].[Dias] ([id])
GO
ALTER TABLE [dbo].[ViajesFijos] CHECK CONSTRAINT [FK_ViajesFijos_Dias]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViajesFijos_ViajesFijos]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViajesFijos]'))
ALTER TABLE [dbo].[ViajesFijos]  WITH CHECK ADD  CONSTRAINT [FK_ViajesFijos_ViajesFijos] FOREIGN KEY([id])
REFERENCES [dbo].[ViajesFijos] ([id])
GO
ALTER TABLE [dbo].[ViajesFijos] CHECK CONSTRAINT [FK_ViajesFijos_ViajesFijos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clientes_ParadaBsAs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clientes]'))
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_ParadaBsAs] FOREIGN KEY([paradabsas])
REFERENCES [dbo].[Paradas] ([id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_ParadaBsAs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clientes_ParadaMercedes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clientes]'))
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_ParadaMercedes] FOREIGN KEY([paradamercedes])
REFERENCES [dbo].[Paradas] ([id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_ParadaMercedes]
