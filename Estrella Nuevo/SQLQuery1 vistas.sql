SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[listado_iv_b]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[listado_iv_b]
AS
SELECT     nombre, hora_salida, hora_regreso, CASE COUNT(lunes) WHEN 1 THEN ''X'' ELSE '''' END AS lunes, CASE COUNT(martes) WHEN 1 THEN ''X'' ELSE '''' END AS martes, 
                      CASE COUNT(miercoles) WHEN 1 THEN ''X'' ELSE '''' END AS miercoles, CASE COUNT(jueves) WHEN 1 THEN ''X'' ELSE '''' END AS jueves, CASE COUNT(viernes) 
                      WHEN 1 THEN ''X'' ELSE '''' END AS viernes, CASE COUNT(sabado) WHEN 1 THEN ''X'' ELSE '''' END AS sabado, CASE COUNT(domingo) 
                      WHEN 1 THEN ''X'' ELSE '''' END AS domingo, CASE COUNT(feriado) WHEN 1 THEN ''X'' ELSE '''' END AS feriado, celular, parada_mercedes, parada_bsas, mensual
FROM         dbo.listado_iv_a AS listado_iv_a_1
GROUP BY nombre, hora_salida, hora_regreso, celular, parada_mercedes, parada_bsas, mensual
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'listado_iv_b', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[7] 4[42] 2[32] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "listado_iv_a_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4665
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_iv_b'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'listado_iv_b', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_iv_b'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[listado_i_b]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[listado_i_b]
AS
SELECT     nombre, hora AS hora_salida, '''' AS hora_regreso, CASE COUNT(lunes) WHEN 1 THEN ''X'' ELSE ''  '' END AS lunes, CASE COUNT(martes) 
                      WHEN 1 THEN ''X'' ELSE ''  '' END AS martes, CASE COUNT(miercoles) WHEN 1 THEN ''X'' ELSE ''  '' END AS miercoles, CASE COUNT(jueves) 
                      WHEN 1 THEN ''X'' ELSE ''  '' END AS jueves, CASE COUNT(viernes) WHEN 1 THEN ''X'' ELSE ''  '' END AS viernes, CASE COUNT(sabado) 
                      WHEN 1 THEN ''X'' ELSE ''  '' END AS sabado, CASE COUNT(domingo) WHEN 1 THEN ''X'' ELSE ''  '' END AS domingo, CASE COUNT(feriado) 
                      WHEN 1 THEN ''X'' ELSE ''  '' END AS feriado, celular, parada_mercedes, parada_bsas, mensual
FROM         dbo.listado_i_a AS listado_i_a_1
GROUP BY nombre, hora, celular, parada_mercedes, parada_bsas, mensual
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'listado_i_b', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[7] 4[49] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "listado_i_a_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 9
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4875
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_i_b'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'listado_i_b', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_i_b'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[listado_v_b]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[listado_v_b]
AS
SELECT     nombre, '''' AS hora_salida, hora AS hora_regreso, CASE COUNT(lunes) WHEN 1 THEN ''X'' ELSE '''' END AS lunes, CASE COUNT(martes) 
                      WHEN 1 THEN ''X'' ELSE '''' END AS martes, CASE COUNT(miercoles) WHEN 1 THEN ''X'' ELSE '''' END AS miercoles, CASE COUNT(jueves) 
                      WHEN 1 THEN ''X'' ELSE '''' END AS jueves, CASE COUNT(viernes) WHEN 1 THEN ''X'' ELSE '''' END AS viernes, CASE COUNT(sabado) 
                      WHEN 1 THEN ''X'' ELSE '''' END AS sabado, CASE COUNT(domingo) WHEN 1 THEN ''X'' ELSE '''' END AS domingo, CASE COUNT(feriado) 
                      WHEN 1 THEN ''X'' ELSE '''' END AS feriado, celular, parada_mercedes, parada_bsas, mensual
FROM         dbo.listado_v_a AS listado_v_a_1
GROUP BY nombre, hora, celular, parada_mercedes, parada_bsas, mensual
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'listado_v_b', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[7] 4[54] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "listado_v_a_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 9
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4965
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_v_b'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'listado_v_b', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_v_b'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[listado_iv_a]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[listado_iv_a]
AS
SELECT     c.nombre, vf1.hora AS hora_salida, vf2.hora AS hora_regreso, CASE vf1.dia WHEN 1 THEN ''X'' ELSE NULL END AS domingo, 
                      CASE vf1.dia WHEN 2 THEN ''X'' ELSE NULL END AS lunes, CASE vf1.dia WHEN 3 THEN ''X'' ELSE NULL END AS martes, CASE vf1.dia WHEN 4 THEN ''X'' ELSE NULL 
                      END AS miercoles, CASE vf1.dia WHEN 5 THEN ''X'' ELSE NULL END AS jueves, CASE vf1.dia WHEN 6 THEN ''X'' ELSE NULL END AS viernes, 
                      CASE vf1.dia WHEN 7 THEN ''X'' ELSE NULL END AS sabado, CASE vf1.dia WHEN 8 THEN ''X'' ELSE NULL END AS feriado, c.celular, 
                      pm.descripcion AS parada_mercedes, pb.descripcion AS parada_bsas, CASE c.mensual WHEN 1 THEN ''SI'' ELSE ''NO'' END AS mensual
FROM         dbo.Clientes AS c INNER JOIN
                      dbo.ViajesFijosClientes AS vfc1 ON c.id = vfc1.id_cliente INNER JOIN
                      dbo.ViajesFijos AS vf1 ON vf1.id = vfc1.id_horarioFijo INNER JOIN
                      dbo.ViajesFijosClientes AS vfc2 ON c.id = vfc2.id_cliente INNER JOIN
                      dbo.ViajesFijos AS vf2 ON vf2.id = vfc2.id_horarioFijo AND vf1.dia = vf2.dia INNER JOIN
                      dbo.Paradas AS pm ON c.paradamercedes = pm.id INNER JOIN
                      dbo.Paradas AS pb ON c.paradabsas = pb.id
WHERE     (vf1.ciudad = 0) AND (vf2.ciudad = 1)
GROUP BY c.nombre, vf1.hora, vf2.hora, vf1.dia, c.celular, pm.descripcion, pb.descripcion, c.mensual
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'listado_iv_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "vfc1"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 192
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vf1"
            Begin Extent = 
               Top = 192
               Left = 38
               Bottom = 300
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vfc2"
            Begin Extent = 
               Top = 300
               Left = 38
               Bottom = 378
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vf2"
            Begin Extent = 
               Top = 378
               Left = 38
               Bottom = 486
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pm"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 114
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pb"
            Begin Extent = 
               Top = 114
               Left = 281
               Bottom = 222
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_iv_a'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'listado_iv_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_iv_a'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'listado_iv_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_iv_a'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[listado_v_a]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[listado_v_a]
AS
SELECT     c.nombre, vf.hora, CASE vf.dia WHEN 1 THEN ''X'' ELSE NULL END AS domingo, CASE vf.dia WHEN 2 THEN ''X'' ELSE NULL END AS lunes, 
                      CASE vf.dia WHEN 3 THEN ''X'' ELSE NULL END AS martes, CASE vf.dia WHEN 4 THEN ''X'' ELSE NULL END AS miercoles, CASE vf.dia WHEN 5 THEN ''X'' ELSE NULL 
                      END AS jueves, CASE vf.dia WHEN 6 THEN ''X'' ELSE NULL END AS viernes, CASE vf.dia WHEN 7 THEN ''X'' ELSE NULL END AS sabado, 
                      CASE vf.dia WHEN 8 THEN ''X'' ELSE NULL END AS feriado, c.celular, pm.descripcion AS parada_mercedes, pb.descripcion AS parada_bsas, 
                      CASE c.mensual WHEN 1 THEN ''SI'' ELSE ''NO'' END AS mensual
FROM         dbo.Clientes AS c INNER JOIN
                      dbo.ViajesFijosClientes AS vfc ON c.id = vfc.id_cliente INNER JOIN
                      dbo.ViajesFijos AS vf ON vf.id = vfc.id_horarioFijo INNER JOIN
                      dbo.Paradas AS pm ON c.paradamercedes = pm.id INNER JOIN
                      dbo.Paradas AS pb ON c.paradabsas = pb.id
WHERE     (vf.ciudad = 1) AND (0 =
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.ViajesFijosClientes AS vfc2 INNER JOIN
                                                   dbo.ViajesFijos AS vf2 ON vf2.id = vfc2.id_horarioFijo
                            WHERE      (vfc2.id_cliente = c.id) AND (vf2.ciudad = 0) AND (vf2.dia = vf.dia)))
GROUP BY c.nombre, vf.hora, vf.dia, c.celular, pm.descripcion, pb.descripcion, c.mensual
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'listado_v_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "vfc"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 192
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vf"
            Begin Extent = 
               Top = 192
               Left = 38
               Bottom = 300
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pm"
            Begin Extent = 
               Top = 198
               Left = 281
               Bottom = 306
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pb"
            Begin Extent = 
               Top = 300
               Left = 38
               Bottom = 408
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_v_a'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'listado_v_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_v_a'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'listado_v_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_v_a'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[listado_i_a]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[listado_i_a]
AS
SELECT     c.nombre, vf.hora, CASE vf.dia WHEN 1 THEN ''X'' ELSE NULL END AS domingo, CASE vf.dia WHEN 2 THEN ''X'' ELSE NULL END AS lunes, 
                      CASE vf.dia WHEN 3 THEN ''X'' ELSE NULL END AS martes, CASE vf.dia WHEN 4 THEN ''X'' ELSE NULL END AS miercoles, CASE vf.dia WHEN 5 THEN ''X'' ELSE NULL 
                      END AS jueves, CASE vf.dia WHEN 6 THEN ''X'' ELSE NULL END AS viernes, CASE vf.dia WHEN 7 THEN ''X'' ELSE NULL END AS sabado, 
                      CASE vf.dia WHEN 8 THEN ''X'' ELSE NULL END AS feriado, c.celular, pm.descripcion AS parada_mercedes, pb.descripcion AS parada_bsas, 
                      CASE c.mensual WHEN 1 THEN ''SI'' ELSE ''NO'' END AS mensual
FROM         dbo.Clientes AS c INNER JOIN
                      dbo.ViajesFijosClientes AS vfc ON c.id = vfc.id_cliente INNER JOIN
                      dbo.ViajesFijos AS vf ON vf.id = vfc.id_horarioFijo INNER JOIN
                      dbo.Paradas AS pm ON c.paradamercedes = pm.id INNER JOIN
                      dbo.Paradas AS pb ON c.paradabsas = pb.id
WHERE     (vf.ciudad = 0) AND (0 =
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.ViajesFijosClientes AS vfc2 INNER JOIN
                                                   dbo.ViajesFijos AS vf2 ON vf2.id = vfc2.id_horarioFijo
                            WHERE      (vfc2.id_cliente = c.id) AND (vf2.ciudad = 1) AND (vf2.dia = vf.dia)))
GROUP BY c.nombre, vf.hora, vf.dia, c.celular, pm.descripcion, pb.descripcion, c.mensual
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'listado_i_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[13] 2[47] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "vfc"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 192
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vf"
            Begin Extent = 
               Top = 192
               Left = 38
               Bottom = 300
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pm"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 114
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pb"
            Begin Extent = 
               Top = 114
               Left = 281
               Bottom = 222
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_i_a'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'listado_i_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_i_a'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'listado_i_a', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'listado_i_a'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[listado_completo]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[listado_completo] as
select * from listado_v_b
union 
select * from listado_i_b
union 
select * from listado_iv_b' 
