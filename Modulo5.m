classdef Modulo5 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        TabGroup                   matlab.ui.container.TabGroup
        Tab1                       matlab.ui.container.Tab
        StateButton14              matlab.ui.control.StateButton
        EditField28                matlab.ui.control.NumericEditField
        PesodelEjeLabel            matlab.ui.control.Label
        EditField27                matlab.ui.control.NumericEditField
        CentrodeMasaLabel          matlab.ui.control.Label
        Label1                     matlab.ui.control.Label
        Label4                     matlab.ui.control.Label
        Label3                     matlab.ui.control.Label
        Label2                     matlab.ui.control.Label
        EditField1                 matlab.ui.control.NumericEditField
        NodosLabel                 matlab.ui.control.Label
        UITable2                   matlab.ui.control.Table
        UITable1                   matlab.ui.control.Table
        UIAxes1                    matlab.ui.control.UIAxes
        Tab3                       matlab.ui.container.Tab
        HTML1                      matlab.ui.control.HTML
        UITable16                  matlab.ui.control.Table
        Label51                    matlab.ui.control.Label
        Button23                   matlab.ui.control.Button
        EditField29                matlab.ui.control.NumericEditField
        RPMdelejeLabel             matlab.ui.control.Label
        EditField26                matlab.ui.control.NumericEditField
        AltociclajeLabel           matlab.ui.control.Label
        Label50                    matlab.ui.control.Label
        UITable5                   matlab.ui.control.Table
        EditField25                matlab.ui.control.NumericEditField
        deconfiabilidadLabel       matlab.ui.control.Label
        EditField24                matlab.ui.control.NumericEditField
        TemperaturadetrabajoLabel  matlab.ui.control.Label
        Label49                    matlab.ui.control.Label
        Label48                    matlab.ui.control.Label
        Label47                    matlab.ui.control.Label
        Label46                    matlab.ui.control.Label
        Label45                    matlab.ui.control.Label
        Image5                     matlab.ui.control.Image
        Image4                     matlab.ui.control.Image
        Image3                     matlab.ui.control.Image
        Image2                     matlab.ui.control.Image
        Image1                     matlab.ui.control.Image
        UITable4                   matlab.ui.control.Table
        Label6                     matlab.ui.control.Label
        UIAxes10                   matlab.ui.control.UIAxes
        Tab4                       matlab.ui.container.Tab
        TextArea1                  matlab.ui.control.TextArea
        Button25                   matlab.ui.control.Button
        DropDown32                 matlab.ui.control.DropDown
        DropDown31                 matlab.ui.control.DropDown
        Button24                   matlab.ui.control.Button
        UITable14                  matlab.ui.control.Table
        Label54                    matlab.ui.control.Label
        Button22                   matlab.ui.control.Button
        Button21                   matlab.ui.control.Button
        DropDown30                 matlab.ui.control.DropDown
        DropDown29                 matlab.ui.control.DropDown
        DropDown28                 matlab.ui.control.DropDown
        Button20                   matlab.ui.control.Button
        Button19                   matlab.ui.control.Button
        Button18                   matlab.ui.control.Button
        DropDown2                  matlab.ui.control.DropDown
        DropDown1                  matlab.ui.control.DropDown
        PlanoLabel                 matlab.ui.control.Label
        Button1                    matlab.ui.control.Button
        Label7                     matlab.ui.control.Label
        UITable3                   matlab.ui.control.Table
        UIAxes11                   matlab.ui.control.UIAxes
        UIAxes9                    matlab.ui.control.UIAxes
        UIAxes8                    matlab.ui.control.UIAxes
        Tab10                      matlab.ui.container.Tab
        Button31                   matlab.ui.control.Button
        Button30                   matlab.ui.control.Button
        Button29                   matlab.ui.control.Button
        Button28                   matlab.ui.control.Button
        Label57                    matlab.ui.control.Label
        Label58                    matlab.ui.control.Label
        Label56                    matlab.ui.control.Label
        Label55                    matlab.ui.control.Label
        Slider2                    matlab.ui.control.Slider
        Slider1                    matlab.ui.control.Slider
        Button27                   matlab.ui.control.Button
        UITable15                  matlab.ui.control.Table
        DropDown33                 matlab.ui.control.DropDown
        EditField32                matlab.ui.control.NumericEditField
        FramesLabel                matlab.ui.control.Label
        EditField31                matlab.ui.control.NumericEditField
        EscalaLabel                matlab.ui.control.Label
        Button26                   matlab.ui.control.Button
        UIAxes16                   matlab.ui.control.UIAxes
        ContextMenu1               matlab.ui.container.ContextMenu
        submenu11                  matlab.ui.container.Menu
        submenu12                  matlab.ui.container.Menu
        submenu13                  matlab.ui.container.Menu
        submenu14                  matlab.ui.container.Menu
        submenu15                  matlab.ui.container.Menu
        submenu16                  matlab.ui.container.Menu
        submenu17                  matlab.ui.container.Menu
        submenu18                  matlab.ui.container.Menu
        submenu19                  matlab.ui.container.Menu
        submenu20                  matlab.ui.container.Menu
        ContextMenu2               matlab.ui.container.ContextMenu
        submenu21                  matlab.ui.container.Menu
        submenu211                 matlab.ui.container.Menu
        submenu212                 matlab.ui.container.Menu
        submenu22                  matlab.ui.container.Menu
        submenu221                 matlab.ui.container.Menu
        submenu222                 matlab.ui.container.Menu
        submenu23                  matlab.ui.container.Menu
        submenu231                 matlab.ui.container.Menu
        submenu232                 matlab.ui.container.Menu
        ContextMenu3               matlab.ui.container.ContextMenu
        submenu31                  matlab.ui.container.Menu
        submenu32                  matlab.ui.container.Menu
        ContextMenu4               matlab.ui.container.ContextMenu
        submenu41                  matlab.ui.container.Menu
        submenu42                  matlab.ui.container.Menu
        ContextMenu5               matlab.ui.container.ContextMenu
        submenu51                  matlab.ui.container.Menu
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            global L1 L2 L3 L4 S1 S2 S3 S4 S5 S6 change_cmap esforfac bernotimo
            change_cmap = 1;
            esforfac    = 1;
            bernotimo   = 0;
            
            L1 = line(app.UIAxes1, [0 0], [0 0], 'LineWidth', 3, 'Color', [1 0 0]);
            L2 = line(app.UIAxes1, [0 0], [0 0], 'LineWidth', 3, 'Color', [1 0 0]);
            L3 = line(app.UIAxes10, [0 0], [0 0], 'LineWidth', 3, 'Color', [0 0 1]);
            L4 = line(app.UIAxes10, [0 0], [0 0], 'LineWidth', 3, 'Color', [0 0 1]);
            S1 = scatter(app.UIAxes1, [], [], 400, 'o', 'MarkerFaceColor', [1 1 1]);
            S2 = scatter(app.UIAxes1, [], [], 400, '^', 'MarkerFaceColor', [1 1 1]);
            S3 = scatter(app.UIAxes1, [], [], 400, 's', 'MarkerFaceColor', [1 1 1]);
            S4 = scatter(app.UIAxes10, [], [], 400, 'o', 'MarkerFaceColor', [1 0 0]);
            S5 = scatter(app.UIAxes10, [], [], 400, '^', 'MarkerFaceColor', [1 0 0]);
            S6 = scatter(app.UIAxes10, [], [], 400, 's', 'MarkerFaceColor', [1 0 0]);
            
            app.UITable1.Data = [0 0 0 0 0 2e11 77e9 250e6 400e6 7850 4];
            app.UITable1.RowName         = {['Tramo ', num2str(1)]};
            app.UITable1.BackgroundColor = [0 0 0];
            app.UITable1.ForegroundColor = [0 1 1];
            
            Nodos = num2cell(zeros(1,2));
            for i = 1:2
                Nodos(i) = {['Nodo ', num2str(i)]};
            end
            
            app.UITable2.Data                  = num2cell(zeros(2, 7));
            app.UITable3.Data                  = zeros(2, 8);
            app.UITable14.Data                 = zeros(2, 8);
            app.UITable4.Data                  = num2cell([zeros(2,6) ones(2,14)]);
            app.UITable5.Data                  = num2cell(zeros(1, 8));
            app.UITable2.Data(:,1)             = {'Definir'};
            app.UITable4.Data(:,5)             = {'Definir'};
            app.UITable4.Data(:,6)             = {'Definir'};
            app.UITable5.Data(:,1)             = {'Definir'};
            app.UITable15.Data                 = zeros(6,1);
            app.UITable2.RowName               = Nodos;
            app.UITable3.RowName               = Nodos;
            app.UITable14.RowName              = Nodos;
            app.UITable4.RowName               = Nodos;
            app.UITable5.RowName               = {['Tramo ', num2str(1)]};
            app.UITable2.ColumnFormat          = ({{'Ninguno' 'Simple' 'Elastico' 'Fijo'}});
            app.UITable4.ColumnFormat(:,[5,6]) = ({{'Ninguno' 'Recocido' 'Revenido'}});
            app.UITable5.ColumnFormat(:,1)     = ({{'Ninguno' 'Esmerilado' 'Maquinado' 'Rolado en Caliente' 'Rolado en Frio' 'Forjado'}});
            app.UITable2.BackgroundColor       = [0 0 0];
            app.UITable2.ForegroundColor       = [0 1 1];
            app.UITable3.BackgroundColor       = [0 0 0];
            app.UITable3.ForegroundColor       = [0 1 1];
            app.UITable14.BackgroundColor      = [0 0 0];
            app.UITable14.ForegroundColor      = [0 1 1];
            app.UITable15.BackgroundColor      = [0 0 0];
            app.UITable15.ForegroundColor      = [0 1 1];
            
        end

        % Value changed function: EditField1
        function EditField1ValueChanged(app, event)
            
            global Nodos
            
            app.UITable1.Data = ones(app.EditField1.Value - 1, 1) * app.UITable1.Data(1,:);
            Tramos            = num2cell(zeros(1,app.EditField1.Value - 1));
            for i = 1:app.EditField1.Value - 1
                Tramos(i) = {['Tramo ', num2str(i)]};
            end
            app.UITable1.RowName = Tramos;

            Nodos = num2cell(zeros(1,app.EditField1.Value));
            for i = 1:app.EditField1.Value
                Nodos(i) = {['Nodo ', num2str(i)]};
            end
            
            app.UITable2.Data                  = num2cell(zeros(app.EditField1.Value, 7));
            app.UITable3.Data                  = zeros(app.EditField1.Value, 8);
            app.UITable14.Data                 = zeros(app.EditField1.Value, 8);
            app.UITable4.Data                  = num2cell([zeros(app.EditField1.Value,6) ones(app.EditField1.Value,14)]);
            app.UITable5.Data                  = num2cell(zeros(app.EditField1.Value - 1, 8));
            app.UITable2.Data(:,1)             = {'Definir'};
            app.UITable4.Data(:,5)             = {'Definir'};
            app.UITable4.Data(:,6)             = {'Definir'};
            app.UITable5.Data(:,1)             = {'Definir'};
            app.UITable2.RowName               = Nodos;
            app.UITable3.RowName               = Nodos;
            app.UITable14.RowName              = Nodos;
            app.UITable4.RowName               = Nodos;
            app.UITable5.RowName               = Tramos;
            app.UITable2.ColumnFormat          = ({{'Ninguno' 'Simple' 'Elastico' 'Fijo'}});
            app.UITable4.ColumnFormat(:,[5,6]) = ({{'Ninguno' 'Recocido' 'Revenido'}});
            app.UITable5.ColumnFormat(:,1)     = ({{'Ninguno' 'Esmerilado' 'Maquinado' 'Rolado en Caliente' 'Rolado en Frio' 'Forjado'}});

        end

        % Value changed function: StateButton14
        function StateButton14ValueChanged(app, event)
            
            if app.StateButton14.Value == 1
                app.StateButton14.Text = 'No incluir peso propio del eje';
                app.StateButton14.FontColor = [0 0 0];
                app.StateButton14.BackgroundColor = [0 1 1];
                app.UITable1.Data(:,4) = app.UITable1.Data(:,4) - (pi/4 .* (app.UITable1.Data(:,2).^2 - app.UITable1.Data(:,3).^2)) .* app.UITable1.Data(:,10) * 9.81;
            else
                app.StateButton14.Text = 'Incluir peso propio del eje';
                app.StateButton14.FontColor = [0 1 1];
                app.StateButton14.BackgroundColor = [0 0 0];
                app.UITable1.Data(:,4) = app.UITable1.Data(:,4) + (pi/4 .* (app.UITable1.Data(:,2).^2 - app.UITable1.Data(:,3).^2)) .* app.UITable1.Data(:,10) * 9.81;
            end
            
        end

        % Cell selection callback: UITable1
        function UITable1CellSelection(app, event)
            
            global L1 L2 indices1
            
            indices1 = event.Indices;
            x4 = [0 cumsum(app.UITable1.DisplayData(:,1))'];
            L1.XData = [x4(indices1(1)) x4(indices1(1) + 1)];
            L2.XData = [0 0];
            L2.YData = [0 0];
            
        end

        % Display data changed function: UITable1
        function UITable1DisplayDataChanged(app, event)
            
            global L1 L2 L3 L4 S1 S2 S3 S4 S5 S6 indices1
            
            cla(app.UIAxes1)
            cla(app.UIAxes10)
            axis(app.UIAxes1, 'equal');
            axis(app.UIAxes10, 'equal');
            
            x2 = cumsum(app.UITable1.DisplayData(:,1));
            x1 = x2 - app.UITable1.DisplayData(:,1);
            y1 = app.UITable1.DisplayData(:,2) ./ 2;
            y2 = app.UITable1.DisplayData(:,3) ./ 2;
            y3 = [y1(1); max([y1(1:length(y1)-1), y1(2:length(y1))], [], 2); y1(length(y1))];
            x4 = [0 x2'];
            Simp = strcmp(app.UITable2.Data(:,1), 'Simple');
            Elas = strcmp(app.UITable2.Data(:,1), 'Elastico');
            Fijo = strcmp(app.UITable2.Data(:,1), 'Fijo');
            
            plot(app.UIAxes1, [0 x2'], 0, 'ow', 'LineWidth', 2, 'MarkerFaceColor', [1 1 1])
            plot(app.UIAxes1, [x1 x2]', [y1 y1]', 'Color', [1 1 0], 'LineWidth', 2)
            plot(app.UIAxes1, [x1 x2]', [-y1 -y1]', 'Color', [1 1 0], 'LineWidth', 2)
            plot(app.UIAxes1, [[0 x2']; [0 x2']], [[0 y1']; [y1' 0]], 'Color', [1 1 0], 'LineWidth', 2)
            plot(app.UIAxes1, [[0 x2']; [0 x2']], [[0 -y1']; [-y1' 0]], 'Color', [1 1 0], 'LineWidth', 2)
            plot(app.UIAxes1, [x1 x2]', [y2 y2]', '--', 'Color', [1 1 0], 'LineWidth', 1.5)
            plot(app.UIAxes1, [x1 x2]', [-y2 -y2]', '--', 'Color', [1 1 0], 'LineWidth', 1.5)
            plot(app.UIAxes1, [[0 x2']; [0 x2']], [[0 y2']; [y2' 0]], '--', 'Color', [1 1 0], 'LineWidth', 1.5)
            plot(app.UIAxes1, [[0 x2']; [0 x2']], [[0 -y2']; [-y2' 0]], '--', 'Color', [1 1 0], 'LineWidth', 1.5)
            
            S1 = scatter(app.UIAxes1, x4(Simp), -y3(Simp), 400, 'o', 'MarkerFaceColor', [1 1 1]);
            S2 = scatter(app.UIAxes1, x4(Elas), -y3(Elas), 400, '^', 'MarkerFaceColor', [1 1 1]);
            S3 = scatter(app.UIAxes1, x4(Fijo), -y3(Fijo), 400, 's', 'MarkerFaceColor', [1 1 1]);
            L1 = line(app.UIAxes1, [x4(indices1(1)) x4(indices1(1) + 1)], [0 0], 'LineWidth', 3, 'Color', [1 0 0]);
            L2 = line(app.UIAxes1, [0 0], [0 0], 'LineWidth', 3, 'Color', [1 0 0]);
            
            plot(app.UIAxes10, [0 x2'], 0, 'or', 'LineWidth', 2, 'MarkerFaceColor', [1 0 0])
            plot(app.UIAxes10, [x1 x2]', [y1 y1]', 'Color', [0 0 0], 'LineWidth', 2)
            plot(app.UIAxes10, [x1 x2]', [-y1 -y1]', 'Color', [0 0 0], 'LineWidth', 2)
            plot(app.UIAxes10, [[0 x2']; [0 x2']], [[0 y1']; [y1' 0]], 'Color', [0 0 0], 'LineWidth', 2)
            plot(app.UIAxes10, [[0 x2']; [0 x2']], [[0 -y1']; [-y1' 0]], 'Color', [0 0 0], 'LineWidth', 2)
            plot(app.UIAxes10, [x1 x2]', [y2 y2]', '--', 'Color', [0 0 0], 'LineWidth', 1.5)
            plot(app.UIAxes10, [x1 x2]', [-y2 -y2]', '--', 'Color', [0 0 0], 'LineWidth', 1.5)
            plot(app.UIAxes10, [[0 x2']; [0 x2']], [[0 y2']; [y2' 0]], '--', 'Color', [0 0 0], 'LineWidth', 1.5)
            plot(app.UIAxes10, [[0 x2']; [0 x2']], [[0 -y2']; [-y2' 0]], '--', 'Color', [0 0 0], 'LineWidth', 1.5)
            
            S4 = scatter(app.UIAxes10, x4(Simp), -y3(Simp), 400, 'o', 'MarkerFaceColor', [1 0 0]);
            S5 = scatter(app.UIAxes10, x4(Elas), -y3(Elas), 400, '^', 'MarkerFaceColor', [1 0 0]);
            S6 = scatter(app.UIAxes10, x4(Fijo), -y3(Fijo), 400, 's', 'MarkerFaceColor', [1 0 0]);
            L3 = line(app.UIAxes10, [0 0], [0 0], 'LineWidth', 3, 'Color', [0 0 1]);
            L4 = line(app.UIAxes10, [0 0], [0 0], 'LineWidth', 3, 'Color', [0 0 1]);
            
            Vol_Tra = (pi/4.* (app.UITable1.Data(:,2).^2 - app.UITable1.Data(:,3).^2)) .* app.UITable1.Data(:,1);
            Mas_Tra = Vol_Tra .* app.UITable1.Data(:,10);
            Xma_Tra = sum(Mas_Tra .* (app.UITable1.Data(:,1)./2 + [0;cumsum(app.UITable1.Data(1:app.EditField1.Value - 2,1))])) ./ sum(Mas_Tra);
            plot(app.UIAxes1, Xma_Tra, 0, 'xc', 'MarkerSize', 20, 'MarkerFaceColor', [0 1 1], 'MarkerEdgeColor', [0 1 1])
            if ~isnan(Xma_Tra)
                app.EditField27.Value = Xma_Tra;
            end
            if ~isnan(Mas_Tra)
                app.EditField28.Value = 9.81 * sum(Mas_Tra);
            end
            
        end

        % Cell selection callback: UITable2
        function UITable2CellSelection(app, event)

            global L1 L2
            
            indices  = event.Indices;
            y1       = app.UITable1.DisplayData(:,2) ./ 2;
            x4       = [0 cumsum(app.UITable1.DisplayData(:,1))'];
            L1.XData = [0 0];
            L1.XData = [0 0];
            L2.XData = [x4(indices(1)) x4(indices(1))];
            L2.YData = [-max(abs(y1)) max(abs(y1))];
            
        end

        % Cell edit callback: UITable2
        function UITable2CellEdit(app, event)

            global S1 S2 S3 S4 S5 S6
            
            y1 = app.UITable1.DisplayData(:,2) ./ 2;
            y3 = [y1(1); max([y1(1:length(y1)-1), y1(2:length(y1))], [], 2); y1(length(y1))];
            x4 = [0 cumsum(app.UITable1.DisplayData(:,1))'];
            
            Simp = strcmp(app.UITable2.Data(:,1), 'Simple');
            Elas = strcmp(app.UITable2.Data(:,1), 'Elastico');
            Fijo = strcmp(app.UITable2.Data(:,1), 'Fijo');
            S1.XData = x4(Simp);
            S1.YData = -y3(Simp);
            S2.XData = x4(Elas);
            S2.YData = -y3(Elas);
            S3.XData = x4(Fijo);
            S3.YData = -y3(Fijo);
            S4.XData = x4(Simp);
            S4.YData = -y3(Simp);
            S5.XData = x4(Elas);
            S5.YData = -y3(Elas);
            S6.XData = x4(Fijo);
            S6.YData = -y3(Fijo);

        end

        % Cell selection callback: UITable4
        function UITable4CellSelection(app, event)
            
            global L3 L4
            
            indices  = event.Indices;
            y1       = app.UITable1.DisplayData(:,2) ./ 2;
            x4       = [0 cumsum(app.UITable1.DisplayData(:,1))'];
            L3.XData = [x4(indices(1)) x4(indices(1))];
            L3.YData = [-max(abs(y1)) max(abs(y1))];
            L4.XData = [0 0];
            
        end

        % Cell edit callback: UITable4
        function UITable4CellEdit(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Validando caso ...';
            
            indices = event.Indices;
            newData = event.NewData;
            if (indices(2) == 2 || indices(2) == 3) && (indices(1) ~= 1 && indices(1) ~= app.EditField1.Value)
                app.UITable4.Data(indices(1),[1,4]) = {0};
                app.UITable4.Data(indices(1),5:6) = {'Ninguno'};
            else
                if (indices(1) ~= 1 && indices(1) ~= app.EditField1.Value) || (indices(2) == 5 || indices(2) == 6)
                    app.UITable4.Data(indices(1),1:4) = {0};
                    app.UITable4.Data(indices(1),5:6) = {'Ninguno'};
                end
            end
            if (indices(1) == 1 || indices(1) == app.EditField1.Value) && (indices(2) ~= 5 && indices(2) ~= 6)
                app.UITable4.Data(indices(1),indices(2)) = {0};
            else
                app.UITable4.Data(indices(1),indices(2)) = {newData};
            end
            
            dia_eje = [app.UITable1.Data(1:app.EditField1.Value - 2,2)';app.UITable1.Data(2:app.EditField1.Value - 1,2)'];
            dia_may = max(dia_eje);
            dia_men = min(dia_eje);
            rel_dia = dia_may./dia_men;
%             dif_dia = [0, (dia_may - dia_men) / 2, 0];
            app.UITable4.Data(find(rel_dia == 1) + 1,1) = {0};
            app.UITable4.Data(find(rel_dia ~= 1) + 1,2:4) = {0};
%             app.UITable4.Data(dif_dia < cell2mat(app.UITable4.Data(:,1))',1) = num2cell(dif_dia(dif_dia < cell2mat(app.UITable4.Data(:,1))'));
            app.UITable4.Data(find(rel_dia ~= 1) + 1,5:6) = {'Ninguno'};
            exi_apo = ~(strcmp(app.UITable2.Data(1:app.EditField1.Value,1),'Ninguno')) & ~(strcmp(app.UITable2.Data(1:app.EditField1.Value,1),'Definir'));
            app.UITable4.Data(exi_apo,1:4) = {0};
            app.UITable4.Data(exi_apo,5:6) = {'Ninguno'};
            
            if (indices(2) == 5 || indices(2) == 6)
                j = zeros(1,app.EditField1.Value);
                Nodos = {};
                for i = 1:app.EditField1.Value
                    if sum(strcmp(app.UITable4.Data(i,[5,6]),'Ninguno')) ~= 2 && sum(strcmp(app.UITable4.Data(i,[5,6]),'Definir')) ~= 2
                        j(i) = i;
                        Nodos = horzcat(Nodos, {['Nodo ', num2str(i)]}); %#ok<AGROW> 
                    end
                end
                app.UITable16.Data      = zeros(length(nonzeros(j)), 5);
                app.UITable16.RowName   = Nodos;
                app.UITable16.Data(:,3) = cell2mat(app.UITable2.Data(nonzeros(j), 5));
                if isempty(app.UITable16.Data) ~= 1
                    d = max([app.UITable1.Data(:,2)', 0; 0, app.UITable1.Data(:,2)'])';
                    app.UITable16.Data(:,4) = d(nonzeros(j)) / 4;
                end
            end
            close(bar_pro)
            
        end

        % Cell selection callback: UITable5
        function UITable5CellSelection(app, event)
            
            global L3 L4
            
            indices = event.Indices;
            x4 = [0 cumsum(app.UITable1.DisplayData(:,1))'];
            L4.XData = [x4(indices(1)) x4(indices(1) + 1)];
            L3.XData = [0 0];
            L3.YData = [0 0];
            
        end

        % Button pushed function: Button23
        function Button23Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Calculando factores de concentracion de esfuerzos estaticos';pause(2)
            
            app.UITable4.Data(strcmp(app.UITable4.Data(:,5),'Definir'),5) = {'Ninguno'};
            app.UITable4.Data(strcmp(app.UITable4.Data(:,6),'Definir'),6) = {'Ninguno'};
            app.UITable4.Data(:,7:20) = {1};
            r_fa1 = [1.01 1.02 1.05 1.07 1.1 1.15 1.2 1.3 1.5 2];
            A_fa1 = [0.98 1.01 1 0.98 0.98 0.98 0.96 1 1 1.01];
            b_fa1 = [-0.1 -0.12 -0.17 -0.2 -0.21 -0.22 -0.26 -0.26 -0.28 -0.3];
            r_mf1 = [1.01 1.02 1.03 1.05 1.07 1.1 1.2 1.5 2 3 6];
            A_mf1 = [0.92 0.96 0.98 0.98 0.98 0.95 0.97 0.94 0.91 0.89 0.88];
            b_mf1 = [-0.17 -0.18 -0.18 -0.2 -0.21 -0.24 -0.22 -0.26 -0.29 -0.31 -0.33];
            r_mt1 = [1.09 1.2 1.33 2];
            A_mt1 = [0.9 0.83 0.85 0.86];
            b_mt1 = [-0.13 -0.22 -0.23 -0.24];
            r_fa2 = [1.01 1.02 1.03 1.05 1.07 1.1 1.15 1.2 1.3 1.5 2 4];
            A_fa2 = [1 1.04 1.04 1.03 1.02 1.03 1.03 1.01 1 1 0.99 0.99];
            b_fa2 = [-0.16 -0.19 -0.22 -0.25 -0.28 -0.29 -0.32 -0.34 -0.36 -0.37 -0.38 -0.39];
            r_mf2 = [1.01 1.02 1.03 1.05 1.07 1.1 1.12 1.15 1.2 1.3 1.5 2 4];
            A_mf2 = [0.99 0.98 0.99 0.99 0.97 0.95 0.96 0.95 0.95 0.94 0.94 0.94 0.95];
            b_mf2 = [-0.15 -0.2 -0.22 -0.24 -0.26 -0.28 -0.29 -0.3 -0.31 -0.32 -0.32 -0.33 -0.33];
            r_mt2 = [1.01 1.02 1.05 1.1 1.2 1.3 2 4];
            A_mt2 = [0.97 0.97 0.94 0.92 0.9 0.89 0.89 0.88];
            b_mt2 = [-0.1 -0.13 -0.17 -0.2 -0.22 -0.23 -0.24 -0.25];
            r_fa3 = [0 0.05 0.1 0.15 0.2 0.25 0.3 0.35];
            A_fa3 = [3 2.85 2.7 2.60 2.5 2.45 2.35 2.3];
            r_mt3 = [0 0.05 0.1 0.15 0.2 0.25 0.3];
            A_mt3 = [2 1.81 1.68 1.57 1.5 1.45 1.4];
            dia_eje = [app.UITable1.Data(1:app.EditField1.Value - 2,2)';app.UITable1.Data(2:app.EditField1.Value - 1,2)'];
            dia_may = max(dia_eje);
            dia_men = min(dia_eje);
            rel_dia = dia_may./dia_men;
            A_fa1 = spline(r_fa1,A_fa1,rel_dia);
            A_mf1 = spline(r_mf1,A_mf1,rel_dia);
            A_mt1 = spline(r_mt1,A_mt1,rel_dia);
            b_fa1 = spline(r_fa1,b_fa1,rel_dia);
            b_mf1 = spline(r_mf1,b_mf1,rel_dia);
            b_mt1 = spline(r_mt1,b_mt1,rel_dia);
            Kt_a1 = [0 A_fa1 .* (cell2mat(app.UITable4.Data(2:app.EditField1.Value - 1,1))' ./ dia_men) .^ b_fa1 0];
            Kt_f1 = [0 A_mf1 .* (cell2mat(app.UITable4.Data(2:app.EditField1.Value - 1,1))' ./ dia_men) .^ b_mf1 0];
            Kt_t1 = [0 A_mt1 .* (cell2mat(app.UITable4.Data(2:app.EditField1.Value - 1,1))' ./ dia_men) .^ b_mt1 0];
            app.UITable4.Data(logical([0 rel_dia ~= 1 0]),7) = num2cell(Kt_a1(logical([0 rel_dia ~= 1 0])));
            app.UITable4.Data(logical([0 rel_dia ~= 1 0]),8) = num2cell(Kt_f1(logical([0 rel_dia ~= 1 0])));
            app.UITable4.Data(logical([0 rel_dia ~= 1 0]),9) = num2cell(Kt_t1(logical([0 rel_dia ~= 1 0])));
            ind_ca1    = cell2mat(app.UITable4.Data(:,2)) ~= 0 & cell2mat(app.UITable4.Data(:,3)) ~= 0;
            ind_ca2    = ind_ca1;
            ind_ca2(1) = [];
            rel_dia    = app.UITable1.Data(ind_ca2, 2) ./ cell2mat(app.UITable4.Data(ind_ca1, 3));
            A_fa2 = spline(r_fa2,A_fa2,rel_dia);
            A_mf2 = spline(r_mf2,A_mf2,rel_dia);
            A_mt2 = spline(r_mt2,A_mt2,rel_dia);
            b_fa2 = spline(r_fa2,b_fa2,rel_dia);
            b_mf2 = spline(r_mf2,b_mf2,rel_dia);
            b_mt2 = spline(r_mt2,b_mt2,rel_dia);
            Kt_a2 = A_fa2 .* (cell2mat(app.UITable4.Data(ind_ca1, 2)) ./ cell2mat(app.UITable4.Data(ind_ca1, 3))) .^ b_fa2;
            Kt_f2 = A_mf2 .* (cell2mat(app.UITable4.Data(ind_ca1, 2)) ./ cell2mat(app.UITable4.Data(ind_ca1, 3))) .^ b_mf2;
            Kt_t2 = A_mt2 .* (cell2mat(app.UITable4.Data(ind_ca1, 2)) ./ cell2mat(app.UITable4.Data(ind_ca1, 3))) .^ b_mt2;
            app.UITable4.Data(ind_ca1,10) = num2cell(Kt_a2);
            app.UITable4.Data(ind_ca1,11) = num2cell(Kt_f2);
            app.UITable4.Data(ind_ca1,12) = num2cell(Kt_t2);
            ind_ca1    = cell2mat(app.UITable4.Data(:,4)) ~= 0;
            ind_ca2    = ind_ca1;
            ind_ca2(1) = [];
            rel_dia    = cell2mat(app.UITable4.Data(ind_ca1, 4)) ./ app.UITable1.Data(ind_ca2, 2);
            Kt_a3 = spline(r_fa3,A_fa3,rel_dia);
            Kt_f3 = 1.59 - 0.64.*log10(rel_dia);
            Kt_t3 = spline(r_mt3,A_mt3,rel_dia);
            app.UITable4.Data(ind_ca1, 13) = num2cell(Kt_a3);
            app.UITable4.Data(ind_ca1, 14) = num2cell(Kt_f3);
            app.UITable4.Data(ind_ca1, 15) = num2cell(Kt_t3);
            Kt_ft = zeros(app.EditField1.Value,3);
            r_fa4 = [1.9 1.6  1.3; 1.3 1.3 1.3; 2.4 2 1.6; 1.6 1.6 1.6];
            for i = 1:app.EditField1.Value
                Rec_Rev = app.UITable4.Data(i,[5,6]);
                if sum(strcmp(Rec_Rev,'Ninguno')) == 2
                    Kt_ft(i,:) = [1 1 1];
                else
                    switch char(Rec_Rev(~strcmp(Rec_Rev,'Ninguno')))
                        case 'Recocido'
                            if find(~strcmp(Rec_Rev,'Ninguno') == 1) == 1
                                Kt_ft(i,:) = r_fa4(1,:);
                            else
                                Kt_ft(i,:) = r_fa4(2,:);
                            end
                        case 'Revenido'
                            if find(~strcmp(Rec_Rev,'Ninguno') == 1) == 1
                                Kt_ft(i,:) = r_fa4(3,:);
                            else
                                Kt_ft(i,:) = r_fa4(4,:);
                            end
                    end
                end
            end
            app.UITable4.Data(:,16:18) = num2cell(Kt_ft);
            
            % Se actualizan los factores si el tramo es hueco
            dfac = app.UITable4.Data(:,7:18);
            dint = app.UITable1.Data(:,3);
            nax = [1, 4, 7, 10];
            nfl = [2, 5, 8, 11];
            for i = 1:size(dfac, 1)
                for j = 1:size(dfac, 2)
                    if dfac{i, j} ~= 1
                        if i == 1
                            if dint(i) ~= 0
                                if ismember(j, nax)
                                    dfac{i, j} = dfac{i, j} * randi([110 130], 1, 1) / 100;
                                elseif ismember(j, nfl)
                                    dfac{i, j} = dfac{i, j} * randi([120 150], 1, 1) / 100;
                                else
                                    dfac{i, j} = dfac{i, j} * randi([130 170], 1, 1) / 100;
                                end
                            end
                        elseif i == size(dfac, 1)
                            if dint(i - 1) ~= 0
                                if ismember(j, nax)
                                    dfac{i, j} = dfac{i, j} * randi([110 130], 1, 1) / 100;
                                elseif ismember(j, nfl)
                                    dfac{i, j} = dfac{i, j} * randi([120 150], 1, 1) / 100;
                                else
                                    dfac{i, j} = dfac{i, j} * randi([130 170], 1, 1) / 100;
                                end
                            end
                        else
                            if dint(i) ~= 0 || dint(i - 1) ~= 0
                                if ismember(j, nax)
                                    dfac{i, j} = dfac{i, j} * randi([110 130], 1, 1) / 100;
                                elseif ismember(j, nfl)
                                    dfac{i, j} = dfac{i, j} * randi([120 150], 1, 1) / 100;
                                else
                                    dfac{i, j} = dfac{i, j} * randi([130 170], 1, 1) / 100;
                                end
                            end
                        end
                    end
                end
            end
            app.UITable4.Data(:,7:18) = dfac;

            bar_pro.Message = 'Calculando factores que modifican el limite de fatiga';pause(2)
            app.UITable5.Data(strcmp(app.UITable5.Data(:,1),'Definir')) = {'Ninguno'};
            k1 = zeros(app.EditField1.Value - 1,1);
            k2 = zeros(app.EditField1.Value - 1,1);
            k3 = zeros(app.EditField1.Value - 1,1);
            k4 = zeros(app.EditField1.Value - 1,1);
            for i = 1:app.EditField1.Value - 1
                switch char(app.UITable5.Data(i, 1))
                    case 'Ninguno'
                        a = 1;
                        b = 0;
                    case 'Esmerilado'
                        a = 1.58;
                        b = -0.085;
                    case 'Maquinado'
                        a = 4.51;
                        b = -0.265;
                    case 'Rolado en Caliente'
                        a = 57.7;
                        b = -0.718;
                    case 'Rolado en Frio'
                        a = 4.51;
                        b = -0.265;
                    case 'Forjado'
                        a = 272;
                        b = -0.995;
                end
                k1(i,1) = a * (app.UITable1.Data(i,9) / 1e6) ^ b;
                if app.UITable1.Data(i, 2) <= 51e-3
                    k2(i,1) = 1.24 * (app.UITable1.Data(i, 2) * 1000) ^ -0.107;
                else
                    k2(i,1) = 1.51 * (app.UITable1.Data(i, 2) * 1000) ^ -0.157;
                end
                k3(i,1) = randi([85 100],1) / 100;
                if app.EditField24.Value <= 450
                    k4(i,1) = 1;
                else
                    k4(i,1) = 1 - 0.0058 * (app.EditField24.Value - 450);
                end
                if app.UITable1.Data(i,9) <= 1400e6
                    app.UITable5.Data(i,7) = {0.5 * app.UITable1.Data(i,9)};
                else
                    app.UITable5.Data(i,7) = {700e6};
                end
            end
            k1(k1 > 1 | k1 == 0) = 1;
            k2(k2 > 1 | k2 == 0) = 1;
            app.UITable5.Data(:,2) = num2cell(k1);
            app.UITable5.Data(:,3) = num2cell(k2);
            app.UITable5.Data(:,4) = num2cell(k3);
            app.UITable5.Data(:,5) = num2cell(k4);
            xdata = [50.0000, 90.0000, 95.0000, 99.0000, 99.9000, 99.9900, 99.9990, 99.9999, 100];
            ydata = [1.0000, 0.8970, 0.8680, 0.8140, 0.7530, 0.7020, 0.6590, 0.6200, 0.6];
            for i = 1:length(xdata) - 1
                if app.EditField25.Value >= xdata(i) && app.EditField25.Value <= xdata(i + 1)
                    lef = i;
                    rig = i + 1;
                    app.UITable5.Data(:,6) = {interp1(xdata([lef, rig]), ydata([lef, rig]), app.EditField25.Value, "linear")};
                    break
                end
            end
            % app.UITable5.Data(:,6) = {spline([50 90 95 99 99.9 99.99 99.999 99.9999], [1 0.897 0.868 0.814 0.753 0.702 0.659 0.62], app.EditField25.Value)};
            app.UITable5.Data(:,8) = num2cell(k1 .* k2 .* k3 .* k4 .* cell2mat(app.UITable5.Data(:,6)) .* cell2mat(app.UITable5.Data(:,7)));
            
            bar_pro.Message = 'Calculando factores de concentracion de esfuerzos dinamicos';pause(2)
            fac_con = zeros(app.EditField1.Value,3);
            for i = 1:app.EditField1.Value
                if length(app.UITable4.Data(i, find(cell2mat(app.UITable4.Data(i,7:18)) ~= 1) + 6)) == 3
                    fac_con(i,:) = cell2mat(app.UITable4.Data(i, find(cell2mat(app.UITable4.Data(i,7:18)) ~= 1) + 6));
                else
                    fac_con(i,:) = 1;
                end
            end
            Su      = min([app.UITable1.Data(:,9)' 0; 0 app.UITable1.Data(:,9)']);
            raa_foa = (0.246 - 3.08e-3 * (Su * 1.45e-7) + 1.51e-5 * (Su * 1.45e-7).^2 - 2.67e-8 * (Su * 1.45e-7).^3) * sqrt(25.4);
            raa_cot = (0.190 - 2.51e-3 * (Su * 1.45e-7) + 1.35e-5 * (Su * 1.45e-7).^2 - 2.67e-8 * (Su * 1.45e-7).^3) * sqrt(25.4);
            q_foa   = 1 ./ (1 + raa_foa(cell2mat(app.UITable4.Data(:,1)) ~= 0)' ./ sqrt(cell2mat(app.UITable4.Data(cell2mat(app.UITable4.Data(:,1)) ~= 0, 1)) * 1000));
            q_cot   = 1 ./ (1 + raa_cot(cell2mat(app.UITable4.Data(:,1)) ~= 0)' ./ sqrt(cell2mat(app.UITable4.Data(cell2mat(app.UITable4.Data(:,1)) ~= 0, 1)) * 1000));
            kf_foa  = 1 + q_foa .* (fac_con(cell2mat(app.UITable4.Data(:,1)) ~= 0, 2) - 1);
            kf_cot  = 1 + q_cot .* (fac_con(cell2mat(app.UITable4.Data(:,1)) ~= 0, 3) - 1);
            kf_fya  = ones(app.EditField1.Value, 1); kf_fya(cell2mat(app.UITable4.Data(:,1)) ~= 0, 1) = kf_foa;
            kf_cyt  = ones(app.EditField1.Value, 1); kf_cyt(cell2mat(app.UITable4.Data(:,1)) ~= 0, 1) = kf_cot;
            app.UITable4.Data(:,19) = num2cell(kf_fya);
            app.UITable4.Data(:,20) = num2cell(kf_cyt);
            
            if sum(app.UITable1.Data(:,1)) / mean(app.UITable1.Data(:,2) - app.UITable1.Data(:,3)) <= 10
                app.Button22.FontWeight = 'bold';
                app.Button1.FontWeight = 'normal';
            else
                app.Button1.FontWeight = 'bold';
                app.Button22.FontWeight = 'normal';
            end
            
            if isempty(app.UITable16.Data) ~= 1
                app.UITable16.Data(:,5) = app.UITable16.Data(:,3) ./ ((app.UITable16.Data(:,1) ./ app.UITable16.Data(:,2)) .* app.UITable16.Data(:,4) .^ 2);
            end
            close(bar_pro)
            
        end

        % Button pushed function: Button1
        function Button1Pushed(app, event)
            
            global bernotimo X_dom Ecu_Cor Ecu_Mom Ecu_Pen Ecu_Def V_zyy M_zyy Esf_Nom4 Cor_Nom4 Fue_Axi Esf_Axi Tor_Nod Esf_Tor Def_Rea Pen_Rea Vonmises Tresca Rankine Esf_Sod Esf_God Esf_Asm FS_Vonm FS_Tres FS_Rank Fsf_Sod Fsf_God Fsf_Asm Vel_Dun Vel_Ray D_rea Des_z Des_y
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            app.UITable2.Data(strcmp(app.UITable2.Data(:,1),'Definir'),1) = {'Ninguno'};
            bernotimo = 1;
            cla(app.UIAxes8)
            cla(app.UIAxes9)
            cla(app.UIAxes11)
            cla(app.UIAxes16)
            app.UITable1.Data(:,11) = 1;
            
            syms x x1
            bar_pro.Message = 'Recopilando datos del eje';pause(2)
            Tip_Apo = zeros(3, app.EditField1.Value);
            for i = 1:app.EditField1.Value
                switch app.UITable2.Data{i,1}
                    case 'Simple'
                        Tip_Apo(1:3, i) = [i 0 0]';
                    case 'Elastico'
                        Tip_Apo(1:3, i) = [0 i 0]';
                    case 'Fijo'
                        Tip_Apo(1:3, i) = [0 0 i]';
                    case 'Ninguno'
                        Tip_Apo(1:3, i) = [0 0 0]';
                end
            end
            
            Nod_Fin  = (cumsum(app.UITable1.DisplayData(:,1)))';
            Nod_Ini  = (Nod_Fin' - app.UITable1.DisplayData(:,1))';
            Apo_Sim  = Tip_Apo(1,:);
            Apo_Ela  = Tip_Apo(2,:);
            Apo_Fij  = Tip_Apo(3,:);
            
            Dia_Eje  = app.UITable1.Data(:,2)';
            Dia_eje  = app.UITable1.Data(:,3)';
            Mod_You  = app.UITable1.Data(:,6)';
            Mod_Cor  = app.UITable1.Data(:,7)';
            Esf_Flu  = app.UITable1.Data(:,8);
            
            Mom_Izy  = (pi / 64) * (Dia_Eje .^ 4 - Dia_eje .^ 4);
            Mom_Pol  = 2 * Mom_Izy;
            Are_Sec  = (pi / 4) * (Dia_Eje .^ 2 - Dia_eje .^ 2);
            Cen_y    = Dia_Eje / 2;
            Q_Itzy   = (4 * ((Dia_Eje / 2) .^ 2 + (Dia_Eje / 2) .* (Dia_eje / 2) + (Dia_eje / 2) .^ 2)) ./ (3 * pi * ((Dia_Eje / 2) .^ 4 - (Dia_eje / 2) .^ 4));
            C_Izy    = (Dia_Eje / 2) ./ Mom_Izy;
            Izy_You  = Mom_Izy .* Mod_You;
            Ine_You  = [Izy_You; Izy_You];
            
            Fue_DisY = app.UITable1.Data(:,5)';
            Fue_DisZ = app.UITable1.Data(:,4)';
            Fue_Axi  = cell2sym(app.UITable2.Data(:,2));
            Fue_NodY = cell2sym(app.UITable2.Data(:,3));
            Fue_NodZ = cell2sym(app.UITable2.Data(:,4));
            Tor_Nod  = cell2sym(app.UITable2.Data(:,5));
            Mom_NodY = cell2sym(app.UITable2.Data(:,6));
            Mom_NodZ = cell2sym(app.UITable2.Data(:,7));
            Fue_Nod  = [Fue_NodZ Fue_NodY];
            Mom_Nod  = [Mom_NodY Mom_NodZ];
            Fue_Dis  = [Fue_DisZ;Fue_DisY];
            
            bar_pro.Message = 'Calculando componentes axiales';pause(2)
            Apo_EF  = nonzeros(Apo_Ela + Apo_Fij)';
            Rea_Axi = cell2sym({zeros(length(Nod_Fin)+1,1)});
            if isempty(Apo_EF) == 1
                Fue_Axi = cumsum(Fue_Axi(1:length(Nod_Fin)));
                Esf_Axi = Fue_Axi./Are_Sec';
                Des_Axi = double((Fue_Axi.*(Nod_Fin-Nod_Ini)')./(Mod_You.*Are_Sec)');
                Des_Axi(app.EditField1.Value) = (sum(cell2mat(app.UITable2.Data(:,2))) * (Nod_Fin(app.EditField1.Value - 1) - Nod_Ini(app.EditField1.Value - 1))) ./ (Mod_You(app.EditField1.Value - 1) * Are_Sec(app.EditField1.Value - 1));
            else
                Cons_6  = sym('n', [1 length(Apo_EF)]);
                Rea_Axi(Apo_EF) = Cons_6;
                Sum_Axi = Rea_Axi + Fue_Axi;
                Fue_Axi = cumsum(Sum_Axi(1:length(Nod_Fin)));
                if length(Apo_EF) == 1
                    Sis_Axi = sum(Sum_Axi);
                    Res_Axi = solve(Sis_Axi);
                    Res_Axi = double(Res_Axi);
                else
                    Com_Axi = (Fue_Axi.*(Nod_Fin-Nod_Ini)')./(Mod_You.*Are_Sec)';
                    Ecu_Axi  = cell2sym({zeros(1,length(Apo_EF) - 1)});
                    for i = 1:length(Apo_EF) - 1
                        Ecu_Axi(i) = sum(Com_Axi(Apo_EF(i):Apo_EF(i+1)-1));
                    end
                    Sis_Axi = [sum(Sum_Axi) Ecu_Axi];
                    Res_Axi = solve(Sis_Axi);
                    Res_Axi = struct2cell(Res_Axi);
                    Res_Axi = cell2sym(Res_Axi);
                    Res_Axi = double(Res_Axi);
                end
                for i = 1:length(Nod_Fin)
                    for j = 1:length(Apo_EF)
                        Fue_Axi(i) = subs(Fue_Axi(i),{Cons_6(j)},{Res_Axi(j)});
                    end
                end
                for i = 1:length(Nod_Fin)+1
                    for j = 1:length(Apo_EF)
                        Rea_Axi(i) = subs(Rea_Axi(i),{Cons_6(j)},{Res_Axi(j)});
                    end
                end
                Esf_Axi = Fue_Axi./Are_Sec';
                Des_Axi = double((Fue_Axi.*(Nod_Fin-Nod_Ini)')./(Mod_You.*Are_Sec)');
                Des_Axi(app.EditField1.Value) = (sum(cell2mat(app.UITable2.Data(:,2)) + double(Rea_Axi)) * (Nod_Fin(app.EditField1.Value - 1) - Nod_Ini(app.EditField1.Value - 1))) ./ (Mod_You(app.EditField1.Value - 1) * Are_Sec(app.EditField1.Value - 1));
            end
            
            bar_pro.Message = 'Calculando componentes torsionales';pause(2)
            Apo_F   = nonzeros(Apo_Fij)';
            Rea_Tor = cell2sym({zeros(length(Nod_Fin)+1,1)});
            if isempty(Apo_F) == 1
                Tor_Nod = cumsum(Tor_Nod(1:length(Nod_Fin)));
                Esf_Tor = (Tor_Nod.*Cen_y')./Mom_Pol';
                Des_Tor = double((Tor_Nod.*(Nod_Fin-Nod_Ini)')./(Mod_You.*Are_Sec)');
                Des_Tor(app.EditField1.Value) = (sum(cell2mat(app.UITable2.Data(:,5))) * (Nod_Fin(app.EditField1.Value - 1) - Nod_Ini(app.EditField1.Value - 1))) ./ (Mod_Cor(app.EditField1.Value - 1) * Mom_Pol(app.EditField1.Value - 1));
            else
                Cons_7         = sym('m', [1 length(Apo_F)]);
                Rea_Tor(Apo_F) = Cons_7;
                Sum_Tor        = Rea_Tor + Tor_Nod;
                Tor_Nod        = cumsum(Sum_Tor(1:length(Nod_Fin)));
                if length(Apo_F) == 1
                    Sis_Tor    = sum(Sum_Tor);
                    Res_Tor    = solve(Sis_Tor);
                    Res_Tor    = double(Res_Tor);
                else
                    Com_Tor  = (Tor_Nod.*(Nod_Fin-Nod_Ini)')./(Mod_Cor.*Mom_Pol)';
                    Ecu_Tor  = cell2sym({zeros(1,length(Apo_F) - 1)});
                    for i = 1:length(Apo_F) - 1
                        Ecu_Tor(i) = sum(Com_Tor(Apo_F(i):Apo_F(i+1)-1));
                    end
                    Sis_Tor = [sum(Sum_Tor) Ecu_Tor];
                    Res_Tor = solve(Sis_Tor);
                    Res_Tor = struct2cell(Res_Tor);
                    Res_Tor = cell2sym(Res_Tor);
                    Res_Tor = double(Res_Tor);
                end
                for i = 1:length(Nod_Fin)
                    for j = 1:length(Apo_F)
                        Tor_Nod(i) = subs(Tor_Nod(i),{Cons_7(j)},{Res_Tor(j)});
                    end
                end
                for i = 1:length(Nod_Fin)+1
                    for j = 1:length(Apo_F)
                        Rea_Tor(i) = subs(Rea_Tor(i),{Cons_7(j)},{Res_Tor(j)});
                    end
                end
                Esf_Tor = (Tor_Nod.*Cen_y')./Mom_Pol';
                Des_Tor = double((Tor_Nod.*(Nod_Fin-Nod_Ini)')./(Mod_You.*Are_Sec)');
                Des_Tor(app.EditField1.Value) = (sum(cell2mat(app.UITable2.Data(:,5)) + double(Rea_Tor)) * (Nod_Fin(app.EditField1.Value - 1) - Nod_Ini(app.EditField1.Value - 1))) ./ (Mod_Cor(app.EditField1.Value - 1) * Mom_Pol(app.EditField1.Value - 1));
            end
            
            bar_pro.Message = 'Calculando componentes cortantes y flexionantes';pause(2)
            Ecu_Def = cell2sym({zeros(length(Nod_Fin), 2)});
            Rea_FYZ = cell2sym({zeros(length(Nod_Fin)+1, 2)});
            for j = 1:2
                Apo_Tot  = Apo_Sim + Apo_Ela + Apo_Fij;
                Cons_0   = sym('r', [1 length(find(Apo_Tot ~= 0))]);
                Rea_Fue  = cell2sym({zeros(length(Nod_Fin)+1,1)});
                Rea_Fue(Apo_Tot ~= 0) = Cons_0;
                Fue_Nod(:,j) = Fue_Nod(:,j) + Rea_Fue;
                if isempty(find(Apo_Fij ~= 0, 1)) == 0
                    Cons_1   = sym('m', [1 length(find(Apo_Fij ~= 0))]);
                    Rea_Mom  = cell2sym({zeros(length(Nod_Fin)+1,1)});
                    Rea_Mom(Apo_Fij ~= 0) = Cons_1;
                    Mom_Nod(:,j) = Mom_Nod(:,j) + Rea_Mom;
                end
                Com_Fue = cell2sym({zeros(1,length(Nod_Fin))});
                Com_Dis = cell2sym({zeros(1,length(Nod_Fin))});
                for i = 1:length(Nod_Fin)
                    Com_Fue(i) = sum(Fue_Nod(1:i,j));
                    Com_Dis(i) = Fue_Dis(j,i)*(x-Nod_Ini(i));
                end
                Fue_Equ = Fue_Dis(j,:).*(Nod_Fin-Nod_Ini);
                Fue_Equ = cumsum(Fue_Equ);
                Fue_Equ = [0 Fue_Equ(1:length(Fue_Equ)-1)];
                Ecu_Cor = cell2sym({zeros(length(Nod_Fin), 1)});
                for i = 1:length(Nod_Fin)
                    Ecu_Cor(i,1) = Com_Fue(i) +  Com_Dis(i) + Fue_Equ(i);
                end
                Cons_2  = sym('a', [1 length(Nod_Fin) ]);
                x1      = 0;
                Ecu_Mom = cell2sym({zeros(length(Nod_Fin), 1)});
                for i = 1:length(Nod_Fin)
                    Ecu_1        = int(Ecu_Cor(i),'x') + Cons_2(i) + Mom_Nod(i,j) - x1;
                    Ecu_1        = subs(Ecu_1,'x',Nod_Ini(i));
                    Cons_2(i)    = solve(Ecu_1,Cons_2(i));
                    Ecu_Mom(i,1) = int(Ecu_Cor(i),'x') + Cons_2(i);
                    x1           = subs(Ecu_Mom(i),'x',Nod_Fin(i));
                end
                Sis_Fue = sum(Fue_Nod(:,j)) + sum(Fue_Dis(j,:).*(Nod_Fin-Nod_Ini));
                Sis_Mom = sum(Mom_Nod(:,j)) + sum(Nod_Fin'.*Fue_Nod(2:length(Fue_Nod),j)) + sum((Fue_Dis(j,:).*(Nod_Fin-Nod_Ini)).*((Nod_Fin+Nod_Ini)./2));
                Ecu_Pen = cell2sym({zeros(length(Nod_Fin), 1)});
                for i = 1:length(Nod_Fin)
                    Ecu_Pen(i,1) = int(Ecu_Mom(i),'x') + str2sym(['c',num2str(2*i-1)]);
                    Ecu_Def(i,j) = int(Ecu_Pen(i),'x') + str2sym(['c',num2str(2*i)]);
                end
                Sis_Pen = cell2sym({zeros(1, length(Nod_Fin) - 1)});
                Sis_Def = cell2sym({zeros(1, length(Nod_Fin) - 1)});
                for i = 1:length(Nod_Fin)-1
                    Sis_Pen(i) = subs(Ecu_Pen(i+1),'x',Nod_Fin(i))./Ine_You(j,i+1)-subs(Ecu_Pen(i),'x',Nod_Fin(i))./Ine_You(j,i);
                    Sis_Def(i) = subs(Ecu_Def(i+1,j),'x',Nod_Fin(i))./Ine_You(j,i+1)-subs(Ecu_Def(i,j),'x',Nod_Fin(i))./Ine_You(j,i);
                end
                Apo_Tot = nonzeros(Apo_Tot)';
                Apo_fij = nonzeros(Apo_Fij)';
                Con_1   = 0;
                Con_2   = 0;
                Nod_Tot = [0 Nod_Fin];
                Sis_Nod = cell2sym({zeros(1,length(Apo_Tot))});
                for i = Apo_Tot
                    Con_1 = Con_1 + 1;
                    if i ~= length(Nod_Fin)+1
                        Sis_Nod(Con_1) = subs(Ecu_Def(i,j),'x',Nod_Tot(i));
                    else
                        Sis_Nod(Con_1) = subs(Ecu_Def(i-1,j),'x',Nod_Tot(i));
                    end
                end
                Sis_Nop = cell2sym({zeros(1,length(Apo_fij))});
                if length(Nod_Fin) ~= 1
                    if isempty(find(Apo_fij ~= 0, 1)) == 0
                        for i = Apo_fij
                            Con_2 = Con_2 + 1;
                            if i ~= length(Nod_Fin)+1
                                Sis_Nop(Con_2) = subs(Ecu_Pen(i),'x',Nod_Tot(i));
                            else
                                Sis_Nop(Con_2) = subs(Ecu_Pen(i-1),'x',Nod_Tot(i));
                            end
                        end
                        Sis_Ecu = [Sis_Fue Sis_Mom Sis_Pen Sis_Def Sis_Nop Sis_Nod];
                    else
                        Sis_Ecu = [Sis_Fue Sis_Mom Sis_Pen Sis_Def Sis_Nod];
                    end
                else
                    if isempty(find(Apo_fij ~= 0, 1)) == 0
                        for i = Apo_fij
                            Con_2 = Con_2 + 1;
                            if i ~= length(Nod_Fin)+1
                                Sis_Nop(Con_2) = subs(Ecu_Pen(i),'x',Nod_Tot(i));
                            else
                                Sis_Nop(Con_2) = subs(Ecu_Pen(i-1),'x',Nod_Tot(i));
                            end
                        end
                        Sis_Ecu = [Sis_Fue Sis_Mom Sis_Nop Sis_Nod];
                    else
                        Sis_Ecu = [Sis_Fue Sis_Mom Sis_Nod];
                    end
                end
                
                bar_pro.Message = 'Resolviendo sistema de ecuaciones';pause(2)
                Res_Sis = solve(Sis_Ecu);
                Res_Sis = struct2cell(Res_Sis);
                Res_Sis = cell2sym(Res_Sis);
                Res_Sis = double(Res_Sis);
                Cons_3 = sym('c', [1 2*length(Nod_Fin)]);
                Cons_4 = sym('m', [1 length(Apo_Tot)]);
                Cons_5 = sym('r', [1 length(Apo_Tot)]);
                if isempty(Apo_fij) == 1
                    for i = 1:length(Nod_Fin)+1
                        for k = 1:length(Apo_Tot)
                            Rea_Fue(i) = subs(Rea_Fue(i),{Cons_5(k)},Res_Sis(2*length(Nod_Fin)+k));
                        end
                        Rea_FYZ(i,j) = Rea_Fue(i);
                    end
                    Rea_MYZ = zeros(length(Nod_Fin)+1,2);
                else
                    for i = 1:length(Nod_Fin)+1
                        for k = 1:length(Apo_Tot)
                            Rea_Fue(i) = subs(Rea_Fue(i),{Cons_5(k)},Res_Sis(2*length(Nod_Fin)+length(Apo_fij)+k));
                        end
                        Rea_FYZ(i,j) = Rea_Fue(i);
                        for k = 1:length(Apo_fij)
                            Rea_Mom(i) = subs(Rea_Mom(i),{Cons_4(k)},Res_Sis(2*length(Nod_Fin)+k));
                        end
                        Rea_MYZ(i,j) = Rea_Mom(i);
                    end
                end
                if isempty(find(Apo_fij ~= 0, 1)) == 0
                    for i = 1:length(Nod_Fin)
                        Ecu_Def(i,j) = subs(Ecu_Def(i,j),{Cons_3(2*i-1),Cons_3(2*i)},{Res_Sis(2*i-1),Res_Sis(2*i)});
                        for k = 1:length(Apo_Tot)
                            Ecu_Def(i,j) = subs(Ecu_Def(i,j),{Cons_4(k),Cons_5(k)},{Res_Sis(2*length(Nod_Fin)+k),Res_Sis(2*length(Nod_Fin)+length(Apo_fij)+k)});
                        end
                    end
                else
                    for i = 1:length(Nod_Fin)
                        Ecu_Def(i,j) = subs(Ecu_Def(i,j),{Cons_3(2*i-1),Cons_3(2*i)},{Res_Sis(2*i-1),Res_Sis(2*i)});
                        for k = 1:length(Apo_Tot)
                            Ecu_Def(i,j) = subs(Ecu_Def(i,j),{Cons_5(k)},{Res_Sis(2*length(Nod_Fin)+k)});
                        end
                    end
                end
            end
            Ecu_Def = Ecu_Def./Ine_You';
            Ecu_Pen = diff(Ecu_Def,'x');
            Ecu_Mom = diff(Ecu_Pen,'x').*Ine_You';
            Ecu_Cor = diff(Ecu_Mom,'x');
            Def_Rea = sqrt(Ecu_Def(:,1).^2 + Ecu_Def(:,2).^2);
            Pen_Rea = sqrt(Ecu_Pen(:,1).^2 + Ecu_Pen(:,2).^2);
            
            X_dom = zeros(1,sum(app.UITable1.Data(:,11) + 12 + 2));
            D_rea = zeros(1,sum(app.UITable1.Data(:,11) + 12 + 2));
            Des_z = zeros(1,sum(app.UITable1.Data(:,11) + 12 + 2));
            Des_y = zeros(1,sum(app.UITable1.Data(:,11) + 12 + 2));
            Elems = [0;  cumsum(app.UITable1.Data(:,11) + 12 + 2)];
            for i = 1:(app.EditField1.Value - 1)
                X_dom(Elems(i)+1:Elems(i+1)) = linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2);
                D_rea(Elems(i)+1:Elems(i+1)) = double(subs(Def_Rea(i,1),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
                Des_z(Elems(i)+1:Elems(i+1)) = double(subs(Ecu_Def(i,1),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
                Des_y(Elems(i)+1:Elems(i+1)) = double(subs(Ecu_Def(i,2),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
            end
            
            bar_pro.Message = 'Mostrando reacciones y desplazamientos en los nodos';pause(2)
            Des_Lxz = zeros(app.EditField1.Value, 1);
            Des_Lxy = zeros(app.EditField1.Value, 1);
            Des_Axz = zeros(app.EditField1.Value, 1);
            Des_Axy = zeros(app.EditField1.Value, 1);
            for i = 1:app.EditField1.Value - 1
                Des_Lxz(i) = double(subs(Ecu_Def(i,1), Nod_Ini(i)));
                Des_Lxy(i) = double(subs(Ecu_Def(i,2), Nod_Ini(i)));
                Des_Axz(i) = double(subs(Ecu_Pen(i,1), Nod_Ini(i)));
                Des_Axy(i) = double(subs(Ecu_Pen(i,2), Nod_Ini(i)));
                if i == app.EditField1.Value - 1
                    Des_Lxz(i+1) = double(subs(Ecu_Def(i,1), Nod_Fin(i)));
                    Des_Lxy(i+1) = double(subs(Ecu_Def(i,2), Nod_Fin(i)));
                    Des_Axz(i+1) = double(subs(Ecu_Pen(i,1), Nod_Fin(i)));
                    Des_Axy(i+1) = double(subs(Ecu_Pen(i,2), Nod_Fin(i)));
                end
            end
            app.UITable3.Data(:,1)  = double(Rea_Axi);
            app.UITable3.Data(:,2)  = double(Rea_FYZ(:,2));
            app.UITable3.Data(:,3)  = double(Rea_FYZ(:,1));
            app.UITable3.Data(:,4)  = double(Rea_Tor);
            app.UITable3.Data(:,5)  = double(Rea_MYZ(:,1));
            app.UITable3.Data(:,6)  = double(Rea_MYZ(:,2));
            app.UITable14.Data(:,1) = Des_Axi;
            app.UITable14.Data(:,2) = Des_Lxy;
            app.UITable14.Data(:,3) = Des_Lxz;
            app.UITable14.Data(:,4) = Des_Tor;
            app.UITable14.Data(:,5) = Des_Axy;
            app.UITable14.Data(:,6) = Des_Axz;

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
            bar_pro.Message = 'Calculando esfuerzos estaticos';pause(2)
            M_zyy    = C_Izy'  .* sqrt(Ecu_Mom(:,1).^2 + Ecu_Mom(:,2).^2);
            V_zyy    = Q_Itzy' .* sqrt(Ecu_Cor(:,1).^2 + Ecu_Cor(:,2).^2);
            Esf_Nom4 = M_zyy + abs(Esf_Axi);
            Cor_Nom4 = V_zyy + abs(Esf_Tor);
            Vonmises = sqrt(Esf_Nom4 .^ 2 + 3 * Cor_Nom4 .^ 2);
            Tresca   = sqrt(Esf_Nom4 .^ 2 + 4 * Cor_Nom4 .^ 2);
            Rankine  = 0.5 * (Esf_Nom4 + sqrt(Esf_Nom4 .^ 2 + 4 * Cor_Nom4 .^ 2));
            
            bar_pro.Message = 'Calculando factores de seguridad estaticos';pause(2)
            FS_Vonm = Esf_Flu ./ Vonmises;
            FS_Tres = Esf_Flu ./ Tresca;
            FS_Rank = Esf_Flu ./ Rankine;
            
            bar_pro.Message = 'Calculando esfuerzos estaticos maximos y FS minimos';pause(2)
            x2 = [0 cumsum(app.UITable1.DisplayData(:,1))'];
            fac_con = zeros(app.EditField1.Value,3);
            for i = 1:app.EditField1.Value
                if length(app.UITable4.Data(i, find(cell2mat(app.UITable4.Data(i,7:18)) ~= 1) + 6)) == 3
                    fac_con(i,:) = cell2mat(app.UITable4.Data(i, find(cell2mat(app.UITable4.Data(i,7:18)) ~= 1) + 6));
                else
                    fac_con(i,:) = 1;
                end
            end
            mat_fca = [fac_con(1:app.EditField1.Value - 1, 1) fac_con(2:app.EditField1.Value, 1)];
            mat_fcf = [fac_con(1:app.EditField1.Value - 1, 2) fac_con(2:app.EditField1.Value, 2)];
            mat_fct = [fac_con(1:app.EditField1.Value - 1, 3) fac_con(2:app.EditField1.Value, 3)];
            mat_eae = zeros(app.EditField1.Value - 1, 2);
            mat_efe = zeros(app.EditField1.Value - 1, 2);
            mat_ece = zeros(app.EditField1.Value - 1, 2);
            mat_ete = zeros(app.EditField1.Value - 1, 2);
            for i = 1:app.EditField1.Value - 1
                mat_eae(i,:) = double(subs(Esf_Axi(i), [x2(i) x2(i+1)]));
                mat_efe(i,:) = double(subs(M_zyy(i), [x2(i) x2(i+1)]));
                mat_ece(i,:) = double(subs(V_zyy(i), [x2(i) x2(i+1)]));
                mat_ete(i,:) = double(subs(Esf_Tor(i), [x2(i) x2(i+1)]));
            end
            Mat_Tre = sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 4 .* (mat_fct .* mat_ete + mat_ece) .^ 2);
            Mat_Von = sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 3 .* (mat_fct .* mat_ete + mat_ece) .^ 2);
            Mat_Ran = 0.5 * ((mat_fcf .* mat_efe + mat_fca .* mat_eae) + sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 4 .* (mat_fct .* mat_ete + mat_ece) .^ 2));
            Mat_FST = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Tre;
            Mat_FSV = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Von;
            Mat_FSR = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Ran;
            
            switch app.DropDown31.Value
                case 'Von Misses'
                    app.UITable3.Data(:,7) = max([Mat_Von(:,1)' 0; 0 Mat_Von(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FSV(:,1)' Mat_FSV(app.EditField1.Value-1,2); Mat_FSV(1,1) Mat_FSV(:,2)'])';
                    Esf_Alt = sqrt(M_zyy .^ 2 + 3 * V_zyy .^ 2);
                    Esf_Med = sqrt(Esf_Axi .^ 2 + 3 * Esf_Tor .^ 2);
                case 'Tresca'
                    app.UITable3.Data(:,7) = max([Mat_Tre(:,1)' 0; 0 Mat_Tre(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FST(:,1)' Mat_FST(app.EditField1.Value-1,2); Mat_FST(1,1) Mat_FST(:,2)'])';
                    Esf_Alt = sqrt(M_zyy .^ 2 + 4 * V_zyy .^ 2);
                    Esf_Med = sqrt(Esf_Axi .^ 2 + 4 * Esf_Tor .^ 2);
                case 'Rankine'
                    app.UITable3.Data(:,7) = max([Mat_Ran(:,1)' 0; 0 Mat_Ran(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FSR(:,1)' Mat_FSR(app.EditField1.Value-1,2); Mat_FSR(1,1) Mat_FSR(:,2)'])';
                    Esf_Alt = 0.5 * (M_zyy + sqrt(M_zyy .^ 2 + 4 * V_zyy .^ 2));
                    Esf_Med = 0.5 * (abs(Esf_Axi) + sqrt(Esf_Axi .^ 2 + 4 * Esf_Tor .^ 2));
            end
 
            bar_pro.Message = 'Calculando esfuerzos dinamicos';pause(2)
            Esf_Sod = app.UITable1.Data(:,8) ./ cell2mat(app.UITable5.Data(:,8)) .* Esf_Alt + Esf_Med;
            Esf_God = app.UITable1.Data(:,9) ./ cell2mat(app.UITable5.Data(:,8)) .* Esf_Alt + Esf_Med;
            Esf_Asm = sqrt((app.UITable1.Data(:,8) ./ cell2mat(app.UITable5.Data(:,8)) .* Esf_Alt) .^ 2 + Esf_Med .^ 2);
            
            bar_pro.Message = 'Calculando factores de seguridad dinamicos';pause(2)
            Fsf_Sod = app.UITable1.Data(:,8) ./ Esf_Sod;
            Fsf_God = app.UITable1.Data(:,9) ./ Esf_God;
            Fsf_Asm = app.UITable1.Data(:,8) ./ Esf_Asm;
           
            bar_pro.Message = 'Calculando esfuerzos dinamicos maximos y FS minimos';pause(2)
            Sy      = app.UITable1.Data(:,8);
            Su      = app.UITable1.Data(:,9);
            Se      = cell2mat(app.UITable5.Data(:,8));
            kf_fya  = cell2mat(app.UITable4.Data(:,19)); kf_fya = [kf_fya(1:app.EditField1.Value - 1) kf_fya(2:app.EditField1.Value)];
            kf_cyt  = cell2mat(app.UITable4.Data(:,20)); kf_cyt = [kf_cyt(1:app.EditField1.Value - 1) kf_cyt(2:app.EditField1.Value)];
            
            switch app.DropDown31.Value
                case 'Von Misses'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfg = [Su Su] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2)) .^ 2 + (mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2));
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
                case 'Tresca'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfg = [Su Su] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) .^ 2 + (mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
                case 'Rankine'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) + 0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Esf_Mfg = [Su Su] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) + 0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2))) .^ 2 + (0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2))) .^ 2);
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
            end
            
            switch app.DropDown32.Value
                case 'Soderberg'
                    app.UITable14.Data(:,7) = max([Esf_Mfs(:,1)' 0; 0 Esf_Mfs(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfs(:,1)' Fsf_Mfs(app.EditField1.Value-1,2); Fsf_Mfs(1,1) Fsf_Mfs(:,2)'])';
                case 'Goodman'
                    app.UITable14.Data(:,7) = max([Esf_Mfg(:,1)' 0; 0 Esf_Mfg(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfg(:,1)' Fsf_Mfg(app.EditField1.Value-1,2); Fsf_Mfg(1,1) Fsf_Mfg(:,2)'])';
                case 'ASME'
                    app.UITable14.Data(:,7) = max([Esf_Mfa(:,1)' 0; 0 Esf_Mfa(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfa(:,1)' Fsf_Mfa(app.EditField1.Value-1,2); Fsf_Mfa(1,1) Fsf_Mfa(:,2)'])';
            end
            
            bar_pro.Message = 'Calculando diagrama S-N';pause(2)
            [vem, pem] = max(app.UITable14.Data(:,7));
            if pem == 1
                sr = app.UITable1.Data(1,9);
                sm = 0.9 * sr;
                se = cell2mat(app.UITable5.Data(1,8));
            elseif pem == app.EditField1.Value
                sr = app.UITable1.Data(pem - 1,9);
                sm = 0.9 * sr;
                se = cell2mat(app.UITable5.Data(pem - 1,8));
            else
                sr = min(app.UITable1.Data(pem - 1:pem,9));
                sm = 0.9 * sr;
                se = min(cell2mat(app.UITable5.Data(pem - 1:pem,8)));
            end
            z  = 3 - log10(app.EditField26.Value);
            b  = (1 / z) * log10(sm ./ se);
            a  = 10 ^ (log10(sm) - 3 * b);
            if vem >= sr
                xsn = 1;
                txt = 'El eje fallara al instante';
                ndh = 0;
            elseif vem < sr && vem > sm
                xsn = interp1([sr sm], [1 1000], vem);
                txt = ['El eje fallara despues de ', num2str(xsn), ' ciclos.'];
                ndh = (xsn / app.EditField29.Value) / 60;
            elseif vem <= sm && vem > se
                xsn = (vem / a) ^ (1 / b);
                txt = ['El eje fallara despues de ', num2str(xsn), ' ciclos.'];
                ndh = (xsn / app.EditField29.Value) / 60;
            else
                vem = se;
                xsn = randi([app.EditField26.Value, app.EditField26.Value^2],1,1);
                txt = 'El eje es de vida infinita';
                ndh = Inf;
            end
            loglog(app.UIAxes11, [1 1e3 app.EditField26.Value app.EditField26.Value^2],[sr sm se se], '-c', 'LineWidth', 2.5); 
            loglog(app.UIAxes11, xsn, vem, 'oy', 'MarkerSize', 10, 'MarkerFaceColor', 'yellow'); 
            text(app.UIAxes11, 1, se/1.5, txt, 'Color','yellow','FontSize',15,'Interpreter','latex');
            ylim(app.UIAxes11, [se/2 max([sr*1.5, vem])])
            
            bar_pro.Message = 'Calculando velocidades criticas';pause(2)
            sm1 = 0;
            sm2 = 0;
            for i = 1:app.EditField1.Value - 1
                sm1 = app.UITable1.Data(i,10) * Are_Sec(i) * int(Def_Rea(i), Nod_Tot(i), Nod_Tot(i + 1)) + sm1;
                sm2 = app.UITable1.Data(i,10) * Are_Sec(i) * int(Def_Rea(i)^2, Nod_Tot(i), Nod_Tot(i + 1)) + sm2;
            end
%             if app.EditField1.Value - length(find(strcmp(app.UITable2.Data(:,1), 'Ninguno') == 1)) > 2
%                 Vel_Ray = double((30 / pi) * sqrt(9.81 * (sm1 / sm2))) / 2;
%                 Vel_Dun = ((30 / pi) * sqrt(9.81 / max(D_rea))) / 2;
%             else
            Vel_Ray = double((30 / pi) * sqrt(9.81 * (sm1 / sm2)));
            Vel_Dun = (30 / pi) * sqrt(9.81 / max(D_rea));
%             end
            app.TextArea1.Value = ['Su eje no debe operar entre las ', num2str(Vel_Dun), ' y ', num2str(Vel_Ray), ' rpm'];
            
            bar_pro.Message = 'Registrando cuadro resumen de resultados';pause(2)
            app.UITable15.Data(1,1)  = max(sqrt(app.UITable14.Data(:,4).^2 + app.UITable14.Data(:,5).^2 + app.UITable14.Data(:,6).^2));
            app.UITable15.Data(2,1)  = max(sqrt(app.UITable14.Data(:,1).^2 + app.UITable14.Data(:,2).^2 + app.UITable14.Data(:,3).^2));
            app.UITable15.Data(3,1)  = min(app.UITable3.Data(:,8));
            app.UITable15.Data(4,1)  = min(app.UITable14.Data(:,8));
            app.UITable15.Data(5,1)  = (Vel_Ray + Vel_Dun) / 2;
            app.UITable15.Data(6,1)  = ndh;
            app.UITable15.RowName(3) = {['F.S. Estatico segun ', app.DropDown31.Value]}; 
            app.UITable15.RowName(4) = {['F.S. Dinamico segun ', app.DropDown32.Value]};
            
            bar_pro.Message = 'Graficando el eje tridimensional';pause(2)
            N_N = app.UITable1.Data(:,11) + 12 + 2;
            N_F = cumsum(app.UITable1.Data(:,1));
            N_I = N_F - app.UITable1.Data(:,1);
            h3  = [0 cumsum(app.UITable1.Data(:,1))'];
            r0  = linspace(0, 2*pi, 50);
            r1  = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]) / 2;
            for i = 1:app.EditField1.Value - 1
                [X, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                X         = repmat(X(1,:),N_N(i),1);
                y         = repmat(y(1,:),N_N(i),1);
                z         = repmat(z(1,:),N_N(i),1) + linspace(N_I(i),N_F(i),N_N(i))';
                surf(app.UIAxes8, X, z, y, 'FaceColor', [0 1 1], 'LineWidth', 1, 'EdgeColor', [0 0 0])
            end
            for i = 1:app.EditField1.Value
                r2 = r1(i) * cos(r0);
                r3 = h3(i) + zeros(size(r2));
                r4 = r1(i) * sin(r0);
                patch(app.UIAxes8, r2, r3, r4, 'c')
            end
            if app.UITable1.Data(1,3) ~= 0
                patch(app.UIAxes8, app.UITable1.Data(1,3)/2 * cos(r0), h3(1) + zeros(size(r2)) - 0.001, app.UITable1.Data(1,3)/2 * sin(r0), 'k')
            end
            if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                patch(app.UIAxes8, app.UITable1.Data(app.EditField1.Value - 1,3)/2 * cos(r0), h3(length(h3)) + zeros(size(r2)) + 0.001, app.UITable1.Data(app.EditField1.Value - 1,3)/2 * sin(r0), 'k')
            end
%             disableDefaultInteractivity(app.UIAxes8)
            axis(app.UIAxes8, 'equal')
            view(app.UIAxes8,[35 10])
            app.EditField31.Value = (sum(app.UITable1.Data(:,1)) / max(D_rea)) / 5;

            bar_pro.Message = 'Calculo finalizado exitosamente';pause(2)
            close(bar_pro)
            
        end

        % Button pushed function: Button22
        function Button22Pushed(app, event)
            
            global bernotimo X_dom Ecu_Cor Ecu_Mom Ecu_Pen Ecu_Def V_zyy M_zyy Esf_Nom4 Cor_Nom4 Fue_Axi Esf_Axi Tor_Nod Esf_Tor Def_Rea Pen_Rea Vonmises Tresca Rankine Esf_Sod Esf_God Esf_Asm FS_Vonm FS_Tres FS_Rank Fsf_Sod Fsf_God Fsf_Asm Vel_Dun Vel_Ray D_rea Des_z Des_y

            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            app.UITable2.Data(strcmp(app.UITable2.Data(:,1),'Definir'),1) = {'Ninguno'};
            bernotimo = 2;
            cla(app.UIAxes8)
            cla(app.UIAxes9)
            cla(app.UIAxes11)
            cla(app.UIAxes16)
            
            bar_pro.Message = 'Recopilando datos del eje';pause(2)
            Dia_Eje  = app.UITable1.Data(:,2);
            Dia_eje  = app.UITable1.Data(:,3);
            I    = (pi / 64) .* (Dia_Eje .^ 4 - Dia_eje .^ 4);
            J    = 2 * I;
            A    = (pi / 4) .* (Dia_Eje .^ 2 - Dia_eje .^ 2);
            Qit  = (4 * ((Dia_Eje / 2) .^ 2 + (Dia_Eje / 2) .* (Dia_eje / 2) + (Dia_eje / 2) .^ 2)) ./ (3 * pi * ((Dia_Eje / 2) .^ 4 - (Dia_eje / 2) .^ 4));
            Mic  = (Dia_Eje / 2) ./ I;
            E    = app.UITable1.Data(:,6);
            G    = app.UITable1.Data(:,7);
            m    = Dia_eje ./ Dia_Eje;
            k    = (6 * (1 + 0.3) * (1 + m.^2) .^ 2) ./ ((7 + (6 * 0.3)) * (1 + m.^2) .^ 2 + (20 + 12 * 0.3) * m.^2);
            phi  = (12 .* E .* I) ./ (k .* A .* G .* app.UITable1.Data(:,1) .^ 2);
            N    = 1:app.EditField1.Value;
            N_N  = app.UITable1.Data(:,11) + 2;
            N_F  = cumsum(app.UITable1.Data(:,1));
            N_I  = N_F - app.UITable1.Data(:,1);
            N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)'));
            N_T  = zeros(1,app.EditField1.Value - 1);
            
            bar_pro.Message = 'Calculando componentes axiales y de torques';pause(2)
            PA  = N(logical(strcmp(app.UITable2.Data(:,1),'Ninguno') + strcmp(app.UITable2.Data(:,1),'Simple')));
            DA  = zeros(app.EditField1.Value,1);
            MGA = zeros(app.EditField1.Value,app.EditField1.Value,app.EditField1.Value - 1);
            MLA = zeros(2,2,app.EditField1.Value - 1);
            PT  = N(logical(strcmp(app.UITable2.Data(:,1),'Ninguno') + strcmp(app.UITable2.Data(:,1),'Simple') + strcmp(app.UITable2.Data(:,1),'Elastico')));
            DT  = zeros(app.EditField1.Value,1);
            MGT = zeros(app.EditField1.Value,app.EditField1.Value,app.EditField1.Value - 1);
            MLT = zeros(2,2,app.EditField1.Value - 1);
            for i = 1:app.EditField1.Value - 1
                MLA(:,:,i) = ((E(i) * A(i)) / app.UITable1.Data(i,1)) .* [1 -1;-1 1];
                MGA([i,i+1],[i,i+1],i) = MLA(:,:,i);
                MLT(:,:,i) = ((G(i) * J(i)) / app.UITable1.Data(i,1)) .* [1 -1;-1 1];
                MGT([i,i+1],[i,i+1],i) = MLT(:,:,i);
                N_T(i)     = (N_P(i+1) - N_P(i)) + 1;         
            end
            MGA = sum(MGA,3);
            MGT = sum(MGT,3);
            if det(MGA(PA,PA)) == 0
                MenAxi = 'La matriz de rigidez axial a resolver es singular, lo que conduce a resultados nada precisos. ';
            else
                MenAxi = 'El sistema de ecuaciones axial a sido resuelto con exito. ';
            end
            if det(MGT(PT,PT)) == 0
                MenTor = 'La matriz de rigidez torsional a resolver es singular, lo que conduce a resultados nada precisos. ';
            else
                MenTor = 'El sistema de ecuaciones torsionales a sido resuelto con exito. ';
            end
            FA = cell2mat(app.UITable2.Data(:,2));
            if length(PA) == app.EditField1.Value              
                EA       = cumsum(FA(1:length(FA)-1)) ./ A;
                app.UITable14.Data(:,1) = 0;  
            else              
                opts.SYM = true;
                RA       = linsolve(MGA(PA,PA),FA(PA),opts);
                DA(PA)   = RA;
                FA       = MGA * DA;
                EA       = cumsum(FA(1:length(FA)-1)) ./ A;
                app.UITable14.Data(:,1) = DA;              
            end
            app.UITable3.Data(:,1) = FA;
            FR                     = cumsum(FA(1:app.EditField1.Value - 1));
            MT = cell2mat(app.UITable2.Data(:,5));
            if length(PT) == app.EditField1.Value
                ET       = (cumsum(MT(1:length(MT)-1)) .* app.UITable1.Data(:,2)) ./ (2 .* J);
                app.UITable14.Data(:,4) = 0;
            else
                opts.SYM = true;
                RT       = linsolve(MGT(PT,PT),MT(PT),opts);
                DT(PT)   = RT;
                MT       = MGT * DT;
                ET       = (cumsum(MT(1:length(MT)-1)) .* app.UITable1.Data(:,2)) ./ (2 .* J);
                app.UITable14.Data(:,4) = DT;
            end
            app.UITable3.Data(:,4) = MT;
            TR                     = cumsum(MT(1:app.EditField1.Value - 1));

            bar_pro.Message = 'Calculando componentes cortantes y flexionantes';pause(2)
            N_E    = app.UITable1.Data(:,11) + 1;
            L      = (N_F - N_I) ./ N_E;
            MG     = zeros(2*(sum(N_E) + 1),2*(sum(N_E) + 1),sum(N_E));
            ML     = zeros(4,4,sum(N_E));
            PyD    = zeros(2*(sum(N_E) + 1),2);
            MyF    = zeros(2*(sum(N_E) + 1),2);
            MFL    = zeros(4*sum(N_E),2);
            FML    = zeros(4,sum(N_E));
            N      = 1:(sum(N_E) + 1);
            N      = setdiff(N,N_P);
            FD1    = (app.UITable1.Data(:,4) .* app.UITable1.Data(:,1)) ./ (app.UITable1.Data(:,11) + 2);
            FD2    = (app.UITable1.Data(:,5) .* app.UITable1.Data(:,1)) ./ (app.UITable1.Data(:,11) + 2);
            FDE    = [FD1 FD2];
            N_R    = app.UITable1.Data(:,11) + 1;
            N_R(length(N_R)) = N_R(length(N_R)) + 1;
            L1     = mat2cell(zeros(1,sum(N_E)),1,N_E);
            I1     = mat2cell(zeros(1,sum(N_E)),1,N_E);
            phi1   = mat2cell(zeros(1,sum(N_E)),1,N_E);
            E1     = mat2cell(zeros(1,sum(N_E)),1,N_E);
            Q_it   = mat2cell(zeros(1,sum(N_R)),1,N_R);
            Mc_i   = mat2cell(zeros(1,sum(N_R)),1,N_R);
            Esf_Axi= mat2cell(zeros(1,sum(N_R)),1,N_R);
            Esf_Tor= mat2cell(zeros(1,sum(N_R)),1,N_R);
            Esf_Flu= mat2cell(zeros(1,sum(N_R)),1,N_R);
            Esf_Rot= mat2cell(zeros(1,sum(N_R)),1,N_R);
            Esf_Fat= mat2cell(zeros(1,sum(N_R)),1,N_R);
            Fue_Axi= mat2cell(zeros(1,sum(N_R)),1,N_R);
            Tor_Nod= mat2cell(zeros(1,sum(N_R)),1,N_R);
            X_dom  = [];
            for i = 1:app.EditField1.Value - 1
                L1{i}   = repelem(L(i),N_E(i));
                I1{i}   = repelem(I(i),N_E(i));
                phi1{i} = repelem(phi(i),N_E(i));
                E1{i}   = repelem(E(i),N_E(i));
                x       = linspace(N_I(i),N_F(i),app.UITable1.Data(i,11)+2);
                X_dom   = uniquetol([X_dom x]);
                Q_it{i} = repelem(Qit(i),N_R(i));
                Mc_i{i} = repelem(Mic(i),N_R(i));
                Esf_Axi{i} = repelem(EA(i),N_R(i));
                Esf_Tor{i} = repelem(ET(i),N_R(i));
                Esf_Flu{i} = repelem(app.UITable1.Data(i,8),N_R(i));
                Esf_Rot{i} = repelem(app.UITable1.Data(i,9),N_R(i));
                Esf_Fat{i} = repelem(cell2mat(app.UITable5.Data(i,8)),N_R(i));
                Fue_Axi{i} = repelem(FR(i),N_R(i));
                Tor_Nod{i} = repelem(TR(i),N_R(i));
            end
            L1   = cell2mat(L1);
            I1   = cell2mat(I1);
            phi1 = cell2mat(phi1);
            E1   = cell2mat(E1);
            Q_it = cell2mat(Q_it);
            Mc_i = cell2mat(Mc_i);
            Esf_Axi = cell2mat(Esf_Axi)';
            Esf_Tor = cell2mat(Esf_Tor)';
            Esf_Flu = cell2mat(Esf_Flu)';
            Esf_Rot = cell2mat(Esf_Rot)';
            Esf_Fat = cell2mat(Esf_Fat)';
            Fue_Axi = cell2mat(Fue_Axi)';
            Tor_Nod = cell2mat(Tor_Nod)';
            X_dom   = round(X_dom, 10);
            
            bar_pro.Message = 'Resolviendo sistema de ecuaciones';pause(2)
            for i = 1:sum(N_E)
                ML(:,:,i) = (E1(i) / L1(i)^3) * (I1(i) / (1 + phi1(i))) .* [12 6*L1(i) -12 6*L1(i);6*L1(i) (4 + phi1(i))*L1(i)^2 -6*L1(i) (2 - phi1(i))*L1(i)^2;-12 -6*L1(i) 12 -6*L1(i);6*L1(i) (2 - phi1(i))*L1(i)^2 -6*L1(i) (4 + phi1(i))*L1(i)^2];
                MG([2*i - 1,2*i,2*i + 1,2*i + 2],[2*i - 1,2*i,2*i + 1,2*i + 2],i) = ML(:,:,i);
            end
            MG = sum(MG,3);
            AL  = N_P(strcmp(app.UITable2.Data(:,1),'Ninguno'));
            AL  = unique([N AL]);
            AS  = N_P(strcmp(app.UITable2.Data(:,1),'Simple'));
            AE  = N_P(strcmp(app.UITable2.Data(:,1),'Elastico'));
            P   = sort(unique(horzcat(2.*AL-1,2.*AL,2.*AS,2.*AE)));
            if det(MG(P,P)) == 0
                MenSis = 'La matriz de rigidez del sistema biplanar a resolver es singular, lo que conduce a resultados nada precisos.';
            else
                MenSis = 'El conjunto de ecuaciones del sistema biplanar a sido resuelto con exito.';
            end
            
            for j = 1:2
                FD    = zeros((sum(N_E) + 1),app.EditField1.Value - 1);
                F     = zeros(1,(sum(N_E) + 1));
                M     = zeros(1,(sum(N_E) + 1));
                for i = 1:app.EditField1.Value - 1
                    FD(linspace(N_P(i),N_P(i + 1),app.UITable1.Data(i,11)+2),i) = FDE(i,j);
                end
                FDP   = sum(FD,2);
                if j == 1
                    F(N_P) = cell2mat(app.UITable2.Data(:,4));
                    M(N_P) = cell2mat(app.UITable2.Data(:,6));
                else
                    F(N_P) = cell2mat(app.UITable2.Data(:,3));
                    M(N_P) = cell2mat(app.UITable2.Data(:,7));
                end
                F   = F' + FDP;
                FyM      = [F';M];
                FyM      = FyM(:);
                opts.SYM = true;
                R        = linsolve(MG(P,P),FyM(P),opts);
                PyD(P,j) = R;
                MyF(:,j) = MG * PyD(:,j);
                for i = 1:sum(N_E)
                    FML(:,i) = ML(:,:,i) * PyD((2*i-1):(2*i+2),j);
                end
                MFL(:,j) = FML(:);
            end
            
            bar_pro.Message = 'Mostrando reacciones y desplazamientos en los nodos';pause(2)
            Fcxz  = MFL(1:2:4*sum(N_E),1);
            Fcxz  = [Fcxz(1:2:length(Fcxz))' -Fcxz(length(Fcxz))];
            Fcxy  = MFL(1:2:4*sum(N_E),2); 
            Fcxy  = [Fcxy(1:2:length(Fcxy))' -Fcxy(length(Fcxy))];
            Mfxz  = MFL(2:2:4*sum(N_E),1); 
            Mfxz  = [-Mfxz(1) Mfxz(2:2:length(Mfxz))'];
            Mfxy  = MFL(2:2:4*sum(N_E),2); 
            Mfxy  = [-Mfxy(1) Mfxy(2:2:length(Mfxy))'];
            Fue_y = MyF(1:2:2*(sum(N_E) + 1),2);
            Fue_z = MyF(1:2:2*(sum(N_E) + 1),1);
            Mom_y = MyF(2:2:2*(sum(N_E) + 1),1);
            Mom_z = MyF(2:2:2*(sum(N_E) + 1),2);
            Pen_y = PyD(2:2:2*(sum(N_E) + 1),2)';
            Pen_z = PyD(2:2:2*(sum(N_E) + 1),1)';
            Def_y = PyD(1:2:2*(sum(N_E) + 1),2)';
            Def_z = PyD(1:2:2*(sum(N_E) + 1),1)';
            app.UITable3.Data(:,2)  = Fue_y(N_P);
            app.UITable3.Data(:,3)  = Fue_z(N_P);
            app.UITable3.Data(:,5)  = Mom_y(N_P);
            app.UITable3.Data(:,6)  = Mom_z(N_P);
            app.UITable14.Data(:,2) = Def_y(N_P);
            app.UITable14.Data(:,3) = Def_z(N_P);
            app.UITable14.Data(:,5) = Pen_y(N_P);
            app.UITable14.Data(:,6) = Pen_z(N_P);
            
            Ecu_Cor = [Fcxz' Fcxy'];
            Ecu_Mom = [Mfxz' Mfxy'];
            Ecu_Pen = [Pen_z' Pen_y'];
            Ecu_Def = [Def_z' Def_y'];
            Def_Rea = sqrt(Ecu_Def(:,1).^2 + Ecu_Def(:,2).^2);
            Pen_Rea = sqrt(Ecu_Pen(:,1).^2 + Ecu_Pen(:,2).^2);
            D_rea   = Def_Rea;
            Des_z   = Def_z;
            Des_y   = Def_y;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
            
            bar_pro.Message = 'Calculando esfuerzos estaticos';pause(2)
%             betha    = atan(Ecu_Mom(:,1) ./ Ecu_Mom(:,2));            
%             M_zyy    = Mc_i' .* (Ecu_Mom(:,1) .* sin(betha) + Ecu_Mom(:,2) .* cos(betha));
%             V_zyy    = Q_it' .* (Ecu_Cor(:,2) .* sin(betha) .^ 2 + Ecu_Cor(:,1) .* cos(betha) .^ 2);
            M_zyy    = Mc_i' .* sqrt(Ecu_Mom(:,1).^2 + Ecu_Mom(:,2).^2);
            V_zyy    = Q_it' .* sqrt(Ecu_Cor(:,1).^2 + Ecu_Cor(:,2).^2);
            Esf_Nom4 = M_zyy + abs(Esf_Axi);
            Cor_Nom4 = V_zyy + abs(Esf_Tor);
            Vonmises = sqrt(Esf_Nom4 .^ 2 + 3 * Cor_Nom4 .^ 2);
            Tresca   = sqrt(Esf_Nom4 .^ 2 + 4 * Cor_Nom4 .^ 2);
            Rankine  = 0.5 * (Esf_Nom4 + sqrt(Esf_Nom4 .^ 2 + 4 * Cor_Nom4 .^ 2));
            
            bar_pro.Message = 'Calculando factores de seguridad estaticos';pause(2)
            FS_Vonm = Esf_Flu ./ Vonmises;
            FS_Tres = Esf_Flu ./ Tresca;
            FS_Rank = Esf_Flu ./ Rankine;
            
            bar_pro.Message = 'Calculando esfuerzos estaticos maximos y FS minimos';pause(2)
            x2 = round([0 cumsum(app.UITable1.DisplayData(:,1))'], 10);
            fac_con = zeros(app.EditField1.Value,3);
            for i = 1:app.EditField1.Value
                if length(app.UITable4.Data(i, find(cell2mat(app.UITable4.Data(i,7:18)) ~= 1) + 6)) == 3
                    fac_con(i,:) = cell2mat(app.UITable4.Data(i, find(cell2mat(app.UITable4.Data(i,7:18)) ~= 1) + 6));
                else
                    fac_con(i,:) = 1;
                end
            end
            mat_fca = [fac_con(1:app.EditField1.Value - 1, 1) fac_con(2:app.EditField1.Value, 1)];
            mat_fcf = [fac_con(1:app.EditField1.Value - 1, 2) fac_con(2:app.EditField1.Value, 2)];
            mat_fct = [fac_con(1:app.EditField1.Value - 1, 3) fac_con(2:app.EditField1.Value, 3)];
            mat_eae = zeros(app.EditField1.Value - 1, 2);
            mat_efe = zeros(app.EditField1.Value - 1, 2);
            mat_ece = zeros(app.EditField1.Value - 1, 2);
            mat_ete = zeros(app.EditField1.Value - 1, 2);
            for i = 1:app.EditField1.Value - 1
                indices_mate = find(X_dom == x2(i)):find(X_dom == x2(i+1)) - 1;
                mat_eae(i,:) = interp1(X_dom(indices_mate), Esf_Axi(indices_mate), [x2(i) x2(i+1)], 'linear', 'extrap');
                mat_efe(i,:) = interp1(X_dom(indices_mate), M_zyy(indices_mate), [x2(i) x2(i+1)], 'linear', 'extrap');
                mat_ece(i,:) = interp1(X_dom(indices_mate), V_zyy(indices_mate), [x2(i) x2(i+1)], 'linear', 'extrap');
                mat_ete(i,:) = interp1(X_dom(indices_mate), Esf_Tor(indices_mate), [x2(i) x2(i+1)], 'linear', 'extrap');
            end
            Mat_Tre = sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 4 .* (mat_fct .* mat_ete + mat_ece) .^ 2);
            Mat_Von = sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 3 .* (mat_fct .* mat_ete + mat_ece) .^ 2);
            Mat_Ran = 0.5 * ((mat_fcf .* mat_efe + mat_fca .* mat_eae) + sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 4 .* (mat_fct .* mat_ete + mat_ece) .^ 2));
            Mat_FST = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Tre;
            Mat_FSV = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Von;
            Mat_FSR = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Ran;
            
            switch app.DropDown31.Value
                case 'Von Misses'
                    app.UITable3.Data(:,7) = max([Mat_Von(:,1)' 0; 0 Mat_Von(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FSV(:,1)' Mat_FSV(app.EditField1.Value-1,2); Mat_FSV(1,1) Mat_FSV(:,2)'])';
                    Esf_Alt = sqrt(M_zyy .^ 2 + 3 * V_zyy .^ 2);
                    Esf_Med = sqrt(Esf_Axi .^ 2 + 3 * Esf_Tor .^ 2);
                case 'Tresca'
                    app.UITable3.Data(:,7) = max([Mat_Tre(:,1)' 0; 0 Mat_Tre(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FST(:,1)' Mat_FST(app.EditField1.Value-1,2); Mat_FST(1,1) Mat_FST(:,2)'])';
                    Esf_Alt = sqrt(M_zyy .^ 2 + 4 * V_zyy .^ 2);
                    Esf_Med = sqrt(Esf_Axi .^ 2 + 4 * Esf_Tor .^ 2);
                case 'Rankine'
                    app.UITable3.Data(:,7) = max([Mat_Ran(:,1)' 0; 0 Mat_Ran(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FSR(:,1)' Mat_FSR(app.EditField1.Value-1,2); Mat_FSR(1,1) Mat_FSR(:,2)'])';
                    Esf_Alt = 0.5 * (M_zyy + sqrt(M_zyy .^ 2 + 4 * V_zyy .^ 2));
                    Esf_Med = 0.5 * (abs(Esf_Axi) + sqrt(Esf_Axi .^ 2 + 4 * Esf_Tor .^ 2));
            end
            
            bar_pro.Message = 'Calculando esfuerzos dinamicos';pause(2)
            Esf_Sod = Esf_Flu ./ Esf_Fat .* Esf_Alt + Esf_Med;
            Esf_God = Esf_Rot ./ Esf_Fat .* Esf_Alt + Esf_Med;
            Esf_Asm = sqrt((Esf_Flu ./ Esf_Fat .* Esf_Alt) .^ 2 + Esf_Med .^ 2);
            
            bar_pro.Message = 'Calculando factores de seguridad dinamicos';pause(2)
            Fsf_Sod = Esf_Flu ./ Esf_Sod;
            Fsf_God = Esf_Rot ./ Esf_God;
            Fsf_Asm = Esf_Flu ./ Esf_Asm;
            
            bar_pro.Message = 'Calculando esfuerzos dinamicos maximos y FS minimos';pause(2)
            Sy      = app.UITable1.Data(:,8);
            Su      = app.UITable1.Data(:,9);
            Se      = cell2mat(app.UITable5.Data(:,8));
            kf_fya  = cell2mat(app.UITable4.Data(:,19)); kf_fya = [kf_fya(1:app.EditField1.Value - 1) kf_fya(2:app.EditField1.Value)];
            kf_cyt  = cell2mat(app.UITable4.Data(:,20)); kf_cyt = [kf_cyt(1:app.EditField1.Value - 1) kf_cyt(2:app.EditField1.Value)];
            
            switch app.DropDown31.Value
                case 'Von Misses'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfg = [Su Su] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2)) .^ 2 + (mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2));
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
                case 'Tresca'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfg = [Su Su] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) .^ 2 + (mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
                case 'Rankine'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) + 0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Esf_Mfg = [Su Su] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) + 0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2))) .^ 2 + (0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2))) .^ 2);
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
            end
            
            switch app.DropDown32.Value
                case 'Soderberg'
                    app.UITable14.Data(:,7) = max([Esf_Mfs(:,1)' 0; 0 Esf_Mfs(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfs(:,1)' Fsf_Mfs(app.EditField1.Value-1,2); Fsf_Mfs(1,1) Fsf_Mfs(:,2)'])';
                case 'Goodman'
                    app.UITable14.Data(:,7) = max([Esf_Mfg(:,1)' 0; 0 Esf_Mfg(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfg(:,1)' Fsf_Mfg(app.EditField1.Value-1,2); Fsf_Mfg(1,1) Fsf_Mfg(:,2)'])';
                case 'ASME'
                    app.UITable14.Data(:,7) = max([Esf_Mfa(:,1)' 0; 0 Esf_Mfa(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfa(:,1)' Fsf_Mfa(app.EditField1.Value-1,2); Fsf_Mfa(1,1) Fsf_Mfa(:,2)'])';
            end
            
            bar_pro.Message = 'Calculando diagrama S-N';pause(2)
            [vem, pem] = max(app.UITable14.Data(:,7));
            if pem == 1
                sr = app.UITable1.Data(1,9);
                sm = 0.9 * sr;
                se = cell2mat(app.UITable5.Data(1,8));
            elseif pem == app.EditField1.Value
                sr = app.UITable1.Data(pem - 1,9);
                sm = 0.9 * sr;
                se = cell2mat(app.UITable5.Data(pem - 1,8));
            else
                sr = min(app.UITable1.Data(pem - 1:pem,9));
                sm = 0.9 * sr;
                se = min(cell2mat(app.UITable5.Data(pem - 1:pem,8)));
            end
            z  = 3 - log10(app.EditField26.Value);
            b  = (1 / z) * log10(sm ./ se);
            a  = 10 ^ (log10(sm) - 3 * b);
            if vem >= sr
                xsn = 1;
                txt = 'El eje fallara al instante';
                ndh = 0;
            elseif vem < sr && vem > sm
                xsn = interp1([sr sm], [1 1000], vem);
                txt = ['El eje fallara despues de ', num2str(xsn), ' ciclos.'];
                ndh = (xsn / app.EditField29.Value) / 60;
            elseif vem <= sm && vem > se
                xsn = (vem / a) ^ (1 / b);
                txt = ['El eje fallara despues de ', num2str(xsn), ' ciclos.'];
                ndh = (xsn / app.EditField29.Value) / 60;
            else
                vem = se;
                xsn = randi([app.EditField26.Value, app.EditField26.Value^2],1,1);
                txt = 'El eje es de vida infinita';
                ndh = Inf;
            end
            loglog(app.UIAxes11, [1 1e3 app.EditField26.Value app.EditField26.Value^2],[sr sm se se], '-c', 'LineWidth', 2.5); 
            loglog(app.UIAxes11, xsn, vem, 'oy', 'MarkerSize', 10, 'MarkerFaceColor', 'yellow'); 
            text(app.UIAxes11, 1, se/1.5, txt, 'Color','yellow','FontSize',15,'Interpreter','latex');
            ylim(app.UIAxes11, [se/2 max([sr*1.5, vem])])
            
            bar_pro.Message = 'Calculando velocidades criticas';pause(2)
            sm1 = trapz(X_dom, Def_Rea);
            sm2 = trapz(X_dom, Def_Rea .^ 2);
%             if app.EditField1.Value - length(find(strcmp(app.UITable2.Data(:,1), 'Ninguno') == 1)) > 2
%                 Vel_Ray = double((30 / pi) * sqrt(9.81 * (sm1 / sm2))) / 2;
%                 Vel_Dun = ((30 / pi) * sqrt(9.81 / max(D_rea))) / 2;
%             else
            Vel_Ray = double((30 / pi) * sqrt(9.81 * (sm1 / sm2)));
            Vel_Dun = (30 / pi) * sqrt(9.81 / max(D_rea));
%             end
            app.TextArea1.Value = ['Su eje no debe operar entre las ', num2str(Vel_Dun), ' y ', num2str(Vel_Ray), ' rpm.', newline, MenAxi, newline, MenTor, newline, MenSis];
            
            bar_pro.Message = 'Registrando cuadro resumen de resultados';pause(2)
            app.UITable15.Data(1,1) = max(sqrt(app.UITable14.Data(:,4).^2 + app.UITable14.Data(:,5).^2 + app.UITable14.Data(:,6).^2));
            app.UITable15.Data(2,1) = max(sqrt(app.UITable14.Data(:,1).^2 + app.UITable14.Data(:,2).^2 + app.UITable14.Data(:,3).^2));
            app.UITable15.Data(3,1) = min(app.UITable3.Data(:,8));
            app.UITable15.Data(4,1) = min(app.UITable14.Data(:,8));
            app.UITable15.Data(5,1) = (Vel_Ray + Vel_Dun) / 2;
            app.UITable15.Data(6,1) = ndh;
            app.UITable15.RowName(3) = {['F.S. Estatico segun ', app.DropDown31.Value]}; 
            app.UITable15.RowName(4) = {['F.S. Dinamico segun ', app.DropDown32.Value]};
            
            bar_pro.Message = 'Graficando el eje tridimensional';pause(2)
            h3 = [0 cumsum(app.UITable1.Data(:,1))'];
            r0 = linspace(0, 2*pi, 50);
            r1 = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]) / 2;
            for i = 1:app.EditField1.Value - 1
                [x, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                x         = repmat(x(1,:),N_N(i),1);
                y         = repmat(y(1,:),N_N(i),1);
                z         = repmat(z(1,:),N_N(i),1) + linspace(N_I(i),N_F(i),N_N(i))';
                surf(app.UIAxes8, x, z, y, 'FaceColor', [0 1 1], 'LineWidth', 1, 'EdgeColor', [0 0 0])
            end
            for i = 1:app.EditField1.Value
                r2 = r1(i) * cos(r0);
                r3 = h3(i) + zeros(size(r2));
                r4 = r1(i) * sin(r0);
                patch(app.UIAxes8, r2, r3, r4, 'c')
            end
            if app.UITable1.Data(1,3) ~= 0
                patch(app.UIAxes8, app.UITable1.Data(1,3)/2 * cos(r0), h3(1) + zeros(size(r2)) - 0.001, app.UITable1.Data(1,3)/2 * sin(r0), 'k')
            end
            if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                patch(app.UIAxes8, app.UITable1.Data(app.EditField1.Value - 1,3)/2 * cos(r0), h3(length(h3)) + zeros(size(r2)) + 0.001, app.UITable1.Data(app.EditField1.Value - 1,3)/2 * sin(r0), 'k')
            end
%             disableDefaultInteractivity(app.UIAxes8)
            axis(app.UIAxes8, 'equal')
            view(app.UIAxes8,[35 10])
            app.EditField31.Value = (sum(app.UITable1.Data(:,1)) / max(D_rea)) / 5; 

            bar_pro.Message = 'Calculo finalizado exitosamente';pause(2)
            close(bar_pro)
            
        end

        % Button pushed function: Button21
        function Button21Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Graficando resultados ...';pause(1)
            
            global bernotimo change_cmap esforfac X_dom Ecu_Cor Ecu_Mom Ecu_Pen Ecu_Def V_zyy M_zyy Esf_Nom4 Cor_Nom4 Fue_Axi Esf_Axi Tor_Nod Esf_Tor
            cla(app.UIAxes8)
            cla(app.UIAxes9)
            esforfac = 1;
            
            switch app.DropDown1.Value
                case 'XZ'
                    switch app.DropDown2.Value
                        case 'Fuerzas Cortantes'
                            Fun_Gra = Ecu_Cor(:,1);
                            Lab_Bar = 'Fuerzas Cortantes XZ';
                        case 'Momentos Flectores'
                            Fun_Gra = Ecu_Mom(:,1);
                            Lab_Bar = 'Momentos Flectores XZ';
                        case 'Pendientes'
                            Fun_Gra = Ecu_Pen(:,1);
                            Lab_Bar = 'Pendientes XZ';
                        case 'Deflexiones'
                            Fun_Gra = Ecu_Def(:,1);
                            Lab_Bar = 'Deflexiones XZ';
                        case 'Esfuerzos Cortantes'
                            Fun_Gra = V_zyy;
                            Lab_Bar = 'Esfuerzos Cortantes XZ';
                        case 'Esfuerzos Flexionantes'
                            Fun_Gra = M_zyy;
                            Lab_Bar = 'Esfuerzos Flexionantes XZ';
                        case 'Esfuerzos Cortantes Maximos'
                            Fun_Gra = Cor_Nom4;
                            Lab_Bar = 'Momentos Cortantes Maximos';
                        case 'Esfuerzos Flexionantes Maximos'
                            Fun_Gra = Esf_Nom4;
                            Lab_Bar = 'Esfuerzos Flexionantes Maximos';
                        case 'Fuerzas Axiales'
                            Fun_Gra = Fue_Axi;
                            Lab_Bar = 'Fuerzas axiales';
                        case 'Esfuerzos Axiales'
                            Fun_Gra = Esf_Axi;
                            Lab_Bar = 'Esfuerzos axiales';
                        case 'Momentos Torsores'
                            Fun_Gra = Tor_Nod;
                            Lab_Bar = 'Momentos Torsores';
                        case 'Esfuerzos Torsionales'
                            Fun_Gra = Esf_Tor;
                            Lab_Bar = 'Esfuerzos Torsionales';
                    end
                case 'XY'
                    switch app.DropDown2.Value
                        case 'Fuerzas Cortantes'
                            Fun_Gra = Ecu_Cor(:,2);
                            Lab_Bar = 'Fuerzas Cortantes XY';
                        case 'Momentos Flectores'
                            Fun_Gra = Ecu_Mom(:,2);
                            Lab_Bar = 'Momentos Flectores XY';
                        case 'Pendientes'
                            Fun_Gra = Ecu_Pen(:,2);
                            Lab_Bar = 'Pendientes XY';
                        case 'Deflexiones'
                            Fun_Gra = Ecu_Def(:,2);
                            Lab_Bar = 'Deflexiones XY';
                        case 'Esfuerzos Cortantes'
                            Fun_Gra = V_zyy;
                            Lab_Bar = 'Esfuerzos Cortantes XY';
                        case 'Esfuerzos Flexionantes'
                            Fun_Gra = M_zyy;
                            Lab_Bar = 'Esfuerzos Flexionantes XY';
                        case 'Esfuerzos Cortantes Maximos'
                            Fun_Gra = Cor_Nom4;
                            Lab_Bar = 'Momentos Cortantes Maximos';
                        case 'Esfuerzos Flexionantes Maximos'
                            Fun_Gra = Esf_Nom4;
                            Lab_Bar = 'Esfuerzos Flexionantes Maximos';
                        case 'Fuerzas Axiales'
                            Fun_Gra = Fue_Axi;
                            Lab_Bar = 'Fuerzas axiales';
                        case 'Esfuerzos Axiales'
                            Fun_Gra = Esf_Axi;
                            Lab_Bar = 'Esfuerzos axiales';
                        case 'Momentos Torsores'
                            Fun_Gra = Tor_Nod;
                            Lab_Bar = 'Momentos Torsores';
                        case 'Esfuerzos Torsionales'
                            Fun_Gra = Esf_Tor;
                            Lab_Bar = 'Esfuerzos Torsionales';
                    end
            end
            
            if bernotimo == 1
                Nod_Tot = [0 (cumsum(app.UITable1.DisplayData(:,1)))'];
                Elems = [0; cumsum(app.UITable1.Data(:,11) + 12 + 2)];
                for i = 1:(app.EditField1.Value - 1)
                    Fun_gra(Elems(i)+1:Elems(i+1)) = double(subs(Fun_Gra(i,1),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
                end
                Fun_Gra = Fun_gra;
                N_N  = app.UITable1.Data(:,11) + 12 + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)' + 12));
            elseif bernotimo == 2
                Fun_Gra = Fun_Gra';
                N_N  = app.UITable1.Data(:,11) + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)'));
            end
            area(app.UIAxes9,X_dom,Fun_Gra,'FaceColor','cyan','FaceAlpha',0.25,'EdgeColor','cyan','LineWidth',2.5)
            xlim(app.UIAxes9, [0 max(X_dom)])
            
            N_F  = cumsum(app.UITable1.Data(:,1));
            N_I  = N_F - app.UITable1.Data(:,1);
            for i = 1:app.EditField1.Value - 1
                [x, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                x         = repmat(x(1,:),N_N(i),1);
                y         = repmat(y(1,:),N_N(i),1);
                z         = repmat(z(1,:),N_N(i),1) + linspace(N_I(i),N_F(i),N_N(i))';
                ce = Fun_Gra(linspace(N_P(i),N_P(i+1),N_N(i)))';
                switch app.DropDown2.Value
                    case 'Pendientes'
                        ce = abs(repmat(ce,1,21));
                    case 'Deflexiones'
                        ce = abs(repmat(ce,1,21));
                    otherwise
                        ce = repmat(ce,1,21);
                end
                surf(app.UIAxes8, x, z, y, ce, 'LineWidth', 1, 'EdgeColor', [0 0 0])
            end
            if change_cmap == 0
                colormap(app.UIAxes8, flipud(colormap(app.UIAxes8)));
                change_cmap = 1;
            end
            cb = colorbar(app.UIAxes8,"northoutside",'AxisLocation','in');
            cb.FontSize = 9;
            cb.TickLength = cb.Position(4)/2;
            cb.TickLabelInterpreter = 'latex';
            cb.Label.String      = Lab_Bar;
            cb.Label.Color       = [0 1 1];
            cb.Color             = [0 1 1];
            
            y  = [0 cumsum(app.UITable1.Data(:,1))'];
            r  = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]);
            r1 = linspace(0, 2*pi, 50);
            for i = 1:app.EditField1.Value
                r2 = (r(i)/2) * cos(r1);
                r3 = y(i) + zeros(size(r2));
                r4 = (r(i)/2) * sin(r1);
                patch(app.UIAxes8,r2, r3, r4, linspace(min(Fun_Gra),max(Fun_Gra),length(r2))', 'EdgeColor', 'none')
            end
            if app.UITable1.Data(1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(1,3)/2) * cos(r1), y(1) + zeros(size(r2)) - 0.001, (app.UITable1.Data(1,3)/2) * sin(r1), 'k')
            end
            if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * cos(r1), y(length(y)) + zeros(size(r2)) + 0.001, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * sin(r1), 'k')
            end
            axis(app.UIAxes8,'equal')
            view(app.UIAxes8,[35 10])
            
            close(bar_pro)
            
        end

        % Button pushed function: Button18
        function Button18Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Graficando desplazamientos ...';pause(1)
            
            global bernotimo change_cmap esforfac X_dom Def_Rea Pen_Rea
            cla(app.UIAxes8)
            cla(app.UIAxes9)
            esforfac = 1;
            
            switch app.DropDown28.Value
                case 'Lineales'
                    Fun_Gra = Def_Rea;
                    Lab_Bar = 'Desplazamientos lineales resultantes';
                case 'Angulares'
                    Fun_Gra = Pen_Rea;
                    Lab_Bar = 'Desplazamientos angulares resultantes';
            end
            
            if bernotimo == 1
                Nod_Tot = [0 (cumsum(app.UITable1.DisplayData(:,1)))'];
                Elems = [0; cumsum(app.UITable1.Data(:,11) + 12 + 2)];
                for i = 1:(app.EditField1.Value - 1)
                    Fun_gra(Elems(i)+1:Elems(i+1)) = double(subs(Fun_Gra(i,1),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
                end
                Fun_Gra = Fun_gra;
                N_N  = app.UITable1.Data(:,11) + 12 + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)' + 12));
            elseif bernotimo == 2
                Fun_Gra = Fun_Gra';
                N_N  = app.UITable1.Data(:,11) + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)'));
            end
            area(app.UIAxes9,X_dom,Fun_Gra,'FaceColor','cyan','FaceAlpha',0.25,'EdgeColor','cyan','LineWidth',2.5)
            xlim(app.UIAxes9, [0 max(X_dom)])
            
            N_F  = cumsum(app.UITable1.Data(:,1));
            N_I  = N_F - app.UITable1.Data(:,1);
            for i = 1:app.EditField1.Value - 1
                [x, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                x         = repmat(x(1,:),N_N(i),1);
                y         = repmat(y(1,:),N_N(i),1);
                z         = repmat(z(1,:),N_N(i),1) + linspace(N_I(i),N_F(i),N_N(i))';
                ce = Fun_Gra(linspace(N_P(i),N_P(i+1),N_N(i)))';
                ce = repmat(ce,1,21);
                surf(app.UIAxes8, x, z, y, ce, 'LineWidth', 1, 'EdgeColor', [0 0 0])
            end
            if change_cmap == 0
                colormap(app.UIAxes8, flipud(colormap(app.UIAxes8)));
                change_cmap = 1;
            end
            cb = colorbar(app.UIAxes8,"northoutside",'AxisLocation','in');
            cb.FontSize = 9;
            cb.TickLength = cb.Position(4)/2;
            cb.TickLabelInterpreter = 'latex';
            cb.Label.String      = Lab_Bar;
            cb.Label.Color       = [0 1 1];
            cb.Color             = [0 1 1];
            
            y  = [0 cumsum(app.UITable1.Data(:,1))'];
            r  = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]);
            r1 = linspace(0, 2*pi, 50);
            for i = 1:app.EditField1.Value
                r2 = (r(i)/2) * cos(r1);
                r3 = y(i) + zeros(size(r2));
                r4 = (r(i)/2) * sin(r1);
                patch(app.UIAxes8,r2, r3, r4, linspace(min(Fun_Gra),max(Fun_Gra),length(r2))', 'EdgeColor', 'none')
            end
            if app.UITable1.Data(1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(1,3)/2) * cos(r1), y(1) + zeros(size(r2)) - 0.001, (app.UITable1.Data(1,3)/2) * sin(r1), 'k')
            end
            if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * cos(r1), y(length(y)) + zeros(size(r2)) + 0.001, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * sin(r1), 'k')
            end
            axis(app.UIAxes8,'equal')
            view(app.UIAxes8,[35 10])
            
            close(bar_pro)
            
        end

        % Button pushed function: Button19
        function Button19Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Graficando esfuerzos ...';pause(1)
            
            global bernotimo change_cmap esforfac X_dom Vonmises Tresca Rankine Esf_Sod Esf_God Esf_Asm
            cla(app.UIAxes8)
            cla(app.UIAxes9)
            
            switch app.DropDown29.Value
                case 'Von Misses'
                    Fun_Gra = Vonmises;
                    Lab_Bar = 'Esfuerzo segun Von Misses';
                    esforfac = 2;
                case 'Tresca'
                    Fun_Gra = Tresca;
                    Lab_Bar = 'Esfuerzo segun Tresca';
                    esforfac = 2;
                case 'Rankine'
                    Fun_Gra = Rankine;
                    Lab_Bar = 'Esfuerzo segun Rankine';
                    esforfac = 2;
                case 'Soderberg'
                    Fun_Gra = Esf_Sod;
                    Lab_Bar = 'Esfuerzo segun Soderberg';
                    esforfac = 3;
                case 'Goodman'
                    Fun_Gra = Esf_God;
                    Lab_Bar = 'Esfuerzo segun Goodman';
                    esforfac = 3;
                case 'ASME'
                    Fun_Gra = Esf_Asm;
                    Lab_Bar = 'Esfuerzo segun ASME';
                    esforfac = 3;
            end
            
            if bernotimo == 1
                Nod_Tot = [0 (cumsum(app.UITable1.DisplayData(:,1)))'];
                Elems = [0; cumsum(app.UITable1.Data(:,11) + 12 + 2)];
                for i = 1:(app.EditField1.Value - 1)
                    Fun_gra(Elems(i)+1:Elems(i+1)) = double(subs(Fun_Gra(i,1),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
                end
                Fun_Gra = Fun_gra;
                N_N  = app.UITable1.Data(:,11) + 12 + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)' + 12));
            elseif bernotimo == 2
                Fun_Gra = Fun_Gra';
                N_N  = app.UITable1.Data(:,11) + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)'));
            end
            area(app.UIAxes9,X_dom,Fun_Gra,'FaceColor','cyan','FaceAlpha',0.25,'EdgeColor','cyan','LineWidth',2.5)
            xlim(app.UIAxes9, [0 max(X_dom)])
            
            N_F  = cumsum(app.UITable1.Data(:,1));
            N_I  = N_F - app.UITable1.Data(:,1);
            for i = 1:app.EditField1.Value - 1
                [x, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                x         = repmat(x(1,:),N_N(i),1);
                y         = repmat(y(1,:),N_N(i),1);
                z         = repmat(z(1,:),N_N(i),1) + linspace(N_I(i),N_F(i),N_N(i))';
                ce = Fun_Gra(linspace(N_P(i),N_P(i+1),N_N(i)))';
                ce = repmat(ce,1,21);
                surf(app.UIAxes8, x, z, y, ce, 'LineWidth', 1, 'EdgeColor', [0 0 0])
            end
            if change_cmap == 0
                colormap(app.UIAxes8, flipud(colormap(app.UIAxes8)));
                change_cmap = 1;
            end
            cb = colorbar(app.UIAxes8,"northoutside",'AxisLocation','in');
            cb.FontSize = 9;
            cb.TickLength = cb.Position(4)/2;
            cb.TickLabelInterpreter = 'latex';
            cb.Label.String      = Lab_Bar;
            cb.Label.Color       = [0 1 1];
            cb.Color             = [0 1 1];
            
            y  = [0 cumsum(app.UITable1.Data(:,1))'];
            r  = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]);
            r1 = linspace(0, 2*pi, 50);
            for i = 1:app.EditField1.Value
                r2 = (r(i)/2) * cos(r1);
                r3 = y(i) + zeros(size(r2));
                r4 = (r(i)/2) * sin(r1);
                patch(app.UIAxes8,r2, r3, r4, linspace(min(Fun_Gra),max(Fun_Gra),length(r2))', 'EdgeColor', 'none')
            end
            if app.UITable1.Data(1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(1,3)/2) * cos(r1), y(1) + zeros(size(r2)) - 0.001, (app.UITable1.Data(1,3)/2) * sin(r1), 'k')
            end
            if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * cos(r1), y(length(y)) + zeros(size(r2)) + 0.001, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * sin(r1), 'k')
            end
            axis(app.UIAxes8,'equal')
            view(app.UIAxes8,[35 10])
            
            close(bar_pro)
            
        end

        % Button pushed function: Button20
        function Button20Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Graficando factores de seguridad ...';pause(1)
            
            global bernotimo change_cmap esforfac X_dom FS_Vonm FS_Tres FS_Rank Fsf_Sod Fsf_God Fsf_Asm
            cla(app.UIAxes8)
            cla(app.UIAxes9)
            
            switch app.DropDown30.Value
                case 'Von Misses'
                    Fun_Gra = FS_Vonm;
                    Lab_Bar = 'Factor de seguridad segun Von Misses';
                    esforfac = 4;
                case 'Tresca'
                    Fun_Gra = FS_Tres;
                    Lab_Bar = 'Factor de seguridad segun Tresca';
                    esforfac = 4;
                case 'Rankine'
                    Fun_Gra = FS_Rank;
                    Lab_Bar = 'Factor de seguridad segun Rankine';
                    esforfac = 4;
                case 'Soderberg'
                    Fun_Gra = Fsf_Sod;
                    Lab_Bar = 'Factor de seguridad segun Soderberg';
                    esforfac = 5;
                case 'Goodman'
                    Fun_Gra = Fsf_God;
                    Lab_Bar = 'Factor de seguridad segun Goodman';
                    esforfac = 5;
                case 'ASME'
                    Fun_Gra = Fsf_Asm;
                    Lab_Bar = 'Factor de seguridad segun ASME';
                    esforfac = 5;
            end
            
            if bernotimo == 1
                Nod_Tot = [0 (cumsum(app.UITable1.DisplayData(:,1)))'];
                Elems = [0; cumsum(app.UITable1.Data(:,11) + 12 + 2)];
                for i = 1:(app.EditField1.Value - 1)
                    Fun_gra(Elems(i)+1:Elems(i+1)) = double(subs(Fun_Gra(i,1),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
                end
                Fun_Gra = Fun_gra;
                N_N  = app.UITable1.Data(:,11) + 12 + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)' + 12));
            elseif bernotimo == 2
                Fun_Gra = Fun_Gra';
                N_N  = app.UITable1.Data(:,11) + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)'));
            end
            area(app.UIAxes9,X_dom,Fun_Gra,'FaceColor','cyan','FaceAlpha',0.25,'EdgeColor','cyan','LineWidth',2.5)
            xlim(app.UIAxes9, [0 max(X_dom)])
            
            N_F  = cumsum(app.UITable1.Data(:,1));
            N_I  = N_F - app.UITable1.Data(:,1);
            for i = 1:app.EditField1.Value - 1
                [x, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                x         = repmat(x(1,:),N_N(i),1);
                y         = repmat(y(1,:),N_N(i),1);
                z         = repmat(z(1,:),N_N(i),1) + linspace(N_I(i),N_F(i),N_N(i))';
                ce = Fun_Gra(linspace(N_P(i),N_P(i+1),N_N(i)))';
                ce = repmat(ce,1,21);
                surf(app.UIAxes8, x, z, y, ce, 'LineWidth', 1, 'EdgeColor', [0 0 0])
            end
            if change_cmap == 1
                colormap(app.UIAxes8, flipud(colormap(app.UIAxes8)));
                change_cmap = 0;
            end
            cb = colorbar(app.UIAxes8,"northoutside",'AxisLocation','in');
            cb.FontSize = 9;
            cb.TickLength = cb.Position(4)/2;
            cb.TickLabelInterpreter = 'latex';
            cb.Label.String      = Lab_Bar;
            cb.Label.Color       = [0 1 1];
            cb.Color             = [0 1 1];
            
            y  = [0 cumsum(app.UITable1.Data(:,1))'];
            r  = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]);
            r1 = linspace(0, 2*pi, 50);
            for i = 1:app.EditField1.Value
                r2 = (r(i)/2) * cos(r1);
                r3 = y(i) + zeros(size(r2));
                r4 = (r(i)/2) * sin(r1);
                patch(app.UIAxes8,r2, r3, r4, linspace(min(Fun_Gra),max(Fun_Gra),length(r2))', 'EdgeColor', 'none')
            end
            if app.UITable1.Data(1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(1,3)/2) * cos(r1), y(1) + zeros(size(r2)) - 0.001, (app.UITable1.Data(1,3)/2) * sin(r1), 'k')
            end
            if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * cos(r1), y(length(y)) + zeros(size(r2)) + 0.001, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * sin(r1), 'k')
            end
            axis(app.UIAxes8,'equal')
            view(app.UIAxes8,[35 10])
            
            close(bar_pro)
            
        end

        % Button pushed function: Button24
        function Button24Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Actualizando resultados y graficas ...';pause(1)
            
            global bernotimo esforfac X_dom Esf_Axi M_zyy V_zyy Esf_Tor
            cla(app.UIAxes11)
                    
            bar_pro.Message = 'Calculando esfuerzos maximos y factores de seguridad minimos';pause(2)
            x2 = round([0 cumsum(app.UITable1.DisplayData(:,1))'], 10);
            fac_con = zeros(app.EditField1.Value,3);
            for i = 1:app.EditField1.Value
                if length(app.UITable4.Data(i, find(cell2mat(app.UITable4.Data(i,7:18)) ~= 1) + 6)) == 3
                    fac_con(i,:) = cell2mat(app.UITable4.Data(i, find(cell2mat(app.UITable4.Data(i,7:18)) ~= 1) + 6));
                else
                    fac_con(i,:) = 1;
                end
            end
            mat_fca = [fac_con(1:app.EditField1.Value - 1, 1) fac_con(2:app.EditField1.Value, 1)];
            mat_fcf = [fac_con(1:app.EditField1.Value - 1, 2) fac_con(2:app.EditField1.Value, 2)];
            mat_fct = [fac_con(1:app.EditField1.Value - 1, 3) fac_con(2:app.EditField1.Value, 3)];
            mat_eae = zeros(app.EditField1.Value - 1, 2);
            mat_efe = zeros(app.EditField1.Value - 1, 2);
            mat_ece = zeros(app.EditField1.Value - 1, 2);
            mat_ete = zeros(app.EditField1.Value - 1, 2);
            if bernotimo == 1
                for i = 1:app.EditField1.Value - 1
                    mat_eae(i,:) = double(subs(Esf_Axi(i), [x2(i) x2(i+1)]));
                    mat_efe(i,:) = double(subs(M_zyy(i), [x2(i) x2(i+1)]));
                    mat_ece(i,:) = double(subs(V_zyy(i), [x2(i) x2(i+1)]));
                    mat_ete(i,:) = double(subs(Esf_Tor(i), [x2(i) x2(i+1)]));
                end
            elseif bernotimo == 2
                for i = 1:app.EditField1.Value - 1
                    indices_mate = find(X_dom == x2(i)):find(X_dom == x2(i+1)) - 1;
                    mat_eae(i,:) = interp1(X_dom(indices_mate), Esf_Axi(indices_mate), [x2(i) x2(i+1)], 'linear', 'extrap');
                    mat_efe(i,:) = interp1(X_dom(indices_mate), M_zyy(indices_mate), [x2(i) x2(i+1)], 'linear', 'extrap');
                    mat_ece(i,:) = interp1(X_dom(indices_mate), V_zyy(indices_mate), [x2(i) x2(i+1)], 'linear', 'extrap');
                    mat_ete(i,:) = interp1(X_dom(indices_mate), Esf_Tor(indices_mate), [x2(i) x2(i+1)], 'linear', 'extrap');
                end
            end
            Mat_Tre = sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 4 .* (mat_fct .* mat_ete + mat_ece) .^ 2);
            Mat_Von = sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 3 .* (mat_fct .* mat_ete + mat_ece) .^ 2);
            Mat_Ran = 0.5 * ((mat_fcf .* mat_efe + mat_fca .* mat_eae) + sqrt((mat_fcf .* mat_efe + mat_fca .* mat_eae) .^ 2 + 4 .* (mat_fct .* mat_ete + mat_ece) .^ 2));
            Mat_FST = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Tre;
            Mat_FSV = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Von;
            Mat_FSR = [app.UITable1.Data(:,8) app.UITable1.Data(:,8)] ./ Mat_Ran;
            
            switch app.DropDown31.Value
                case 'Von Misses'
                    app.UITable3.Data(:,7) = max([Mat_Von(:,1)' 0; 0 Mat_Von(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FSV(:,1)' Mat_FSV(app.EditField1.Value-1,2); Mat_FSV(1,1) Mat_FSV(:,2)'])';
                case 'Tresca'
                    app.UITable3.Data(:,7) = max([Mat_Tre(:,1)' 0; 0 Mat_Tre(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FST(:,1)' Mat_FST(app.EditField1.Value-1,2); Mat_FST(1,1) Mat_FST(:,2)'])';
                case 'Rankine'
                    app.UITable3.Data(:,7) = max([Mat_Ran(:,1)' 0; 0 Mat_Ran(:,2)'])';
                    app.UITable3.Data(:,8) = min([Mat_FSR(:,1)' Mat_FSR(app.EditField1.Value-1,2); Mat_FSR(1,1) Mat_FSR(:,2)'])';
            end
            
            Sy      = app.UITable1.Data(:,8);
            Su      = app.UITable1.Data(:,9);
            Se      = cell2mat(app.UITable5.Data(:,8));
            kf_fya  = cell2mat(app.UITable4.Data(:,19)); kf_fya = [kf_fya(1:app.EditField1.Value - 1) kf_fya(2:app.EditField1.Value)];
            kf_cyt  = cell2mat(app.UITable4.Data(:,20)); kf_cyt = [kf_cyt(1:app.EditField1.Value - 1) kf_cyt(2:app.EditField1.Value)];
            
            switch app.DropDown31.Value
                case 'Von Misses'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfg = [Su Su] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 3 .* (mat_ece).^2)) .^ 2 + (mat_eae .^2 + 3 .* (kf_cyt .* mat_ete).^2));
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
                case 'Tresca'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfg = [Su Su] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2) + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2);
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) .^ 2 + (mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
                case 'Rankine'
                    Esf_Mfs = [Sy Sy] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) + 0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Esf_Mfg = [Su Su] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2)) + 0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2));
                    Esf_Mfa = sqrt(([Sy Sy] ./ [Se Se] .* 0.5 .* (kf_fya .* mat_efe + sqrt((kf_fya .* mat_efe).^2 + 4 .* (mat_ece).^2))) .^ 2 + (0.5 .* (mat_eae + sqrt(mat_eae .^2 + 4 .* (kf_cyt .* mat_ete).^2))) .^ 2);
                    Fsf_Mfs = [Sy Sy] ./ Esf_Mfs;
                    Fsf_Mfg = [Su Su] ./ Esf_Mfg;
                    Fsf_Mfa = [Sy Sy] ./ Esf_Mfa;
            end
            
            switch app.DropDown32.Value
                case 'Soderberg'
                    app.UITable14.Data(:,7) = max([Esf_Mfs(:,1)' 0; 0 Esf_Mfs(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfs(:,1)' Fsf_Mfs(app.EditField1.Value-1,2); Fsf_Mfs(1,1) Fsf_Mfs(:,2)'])';
                case 'Goodman'
                    app.UITable14.Data(:,7) = max([Esf_Mfg(:,1)' 0; 0 Esf_Mfg(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfg(:,1)' Fsf_Mfg(app.EditField1.Value-1,2); Fsf_Mfg(1,1) Fsf_Mfg(:,2)'])';
                case 'ASME'
                    app.UITable14.Data(:,7) = max([Esf_Mfa(:,1)' 0; 0 Esf_Mfa(:,2)'])';
                    app.UITable14.Data(:,8) = min([Fsf_Mfa(:,1)' Fsf_Mfa(app.EditField1.Value-1,2); Fsf_Mfa(1,1) Fsf_Mfa(:,2)'])';
            end
            
            if esforfac == 2
                plot(app.UIAxes9, [0 cumsum(app.UITable1.Data(:,1)')], app.UITable3.Data(:,7)', '-y', [0 cumsum(app.UITable1.Data(:,1)')], app.UITable3.Data(:,7)', 'oy', 'LineWidth', 1, 'MarkerFaceColor', [1 1 0], 'MarkerSize', 7.5);
            elseif esforfac == 3
                plot(app.UIAxes9, [0 cumsum(app.UITable1.Data(:,1)')], app.UITable14.Data(:,7)', '-y', [0 cumsum(app.UITable1.Data(:,1)')], app.UITable14.Data(:,7)', 'oy', 'LineWidth', 1, 'MarkerFaceColor', [1 1 0], 'MarkerSize', 7.5);
            elseif esforfac == 4
                plot(app.UIAxes9, [0 cumsum(app.UITable1.Data(:,1)')], app.UITable3.Data(:,8)', '-y', [0 cumsum(app.UITable1.Data(:,1)')], app.UITable3.Data(:,8)', 'oy', 'LineWidth', 1, 'MarkerFaceColor', [1 1 0], 'MarkerSize', 7.5);
            elseif esforfac == 5
                plot(app.UIAxes9, [0 cumsum(app.UITable1.Data(:,1)')], app.UITable14.Data(:,8)', '-y', [0 cumsum(app.UITable1.Data(:,1)')], app.UITable14.Data(:,8)', 'oy', 'LineWidth', 1, 'MarkerFaceColor', [1 1 0], 'MarkerSize', 7.5);
            end
            
            bar_pro.Message = 'Recalculando diagrama S-N';pause(2)
            [vem, pem] = max(app.UITable14.Data(:,7));
            if pem == 1
                sr = app.UITable1.Data(1,9);
                sm = 0.9 * sr;
                se = cell2mat(app.UITable5.Data(1,8));
            elseif pem == app.EditField1.Value
                sr = app.UITable1.Data(pem - 1,9);
                sm = 0.9 * sr;
                se = cell2mat(app.UITable5.Data(pem - 1,8));
            else
                sr = min(app.UITable1.Data(pem - 1:pem,9));
                sm = 0.9 * sr;
                se = min(cell2mat(app.UITable5.Data(pem - 1:pem,8)));
            end
            z  = 3 - log10(app.EditField26.Value);
            b  = (1 / z) * log10(sm ./ se);
            a  = 10 ^ (log10(sm) - 3 * b);
            if vem >= sr
                xsn = 1;
                txt = 'El eje fallara al instante';
                ndh = 0;
            elseif vem < sr && vem > sm
                xsn = interp1([sr sm], [1 1000], vem);
                txt = ['El eje fallara despues de ', num2str(xsn), ' ciclos.'];
                ndh = (xsn / app.EditField29.Value) / 60;
            elseif vem <= sm && vem > se
                xsn = (vem / a) ^ (1 / b);
                txt = ['El eje fallara despues de ', num2str(xsn), ' ciclos.'];
                ndh = (xsn / app.EditField29.Value) / 60;
            else
                vem = se;
                xsn = randi([app.EditField26.Value, app.EditField26.Value^2],1,1);
                txt = 'El eje es de vida infinita';
                ndh = Inf;
            end
            loglog(app.UIAxes11, [1 1e3 app.EditField26.Value app.EditField26.Value^2],[sr sm se se], '-c', 'LineWidth', 2.5);
            loglog(app.UIAxes11, xsn, vem, 'oy', 'MarkerSize', 10, 'MarkerFaceColor', 'yellow');
            text(app.UIAxes11, 1, se/1.5, txt, 'Color','yellow','FontSize',15,'Interpreter','latex');
            ylim(app.UIAxes11, [se/2 max([sr*1.5, vem])])
            
            bar_pro.Message = 'Actualizando cuadro resumen de resultados';pause(2)
            app.UITable15.Data(3,1) = min(app.UITable3.Data(:,8));
            app.UITable15.Data(4,1) = min(app.UITable14.Data(:,8));
            app.UITable15.Data(6,1) = ndh;
            app.UITable15.RowName(3) = {['F.S. Estatico segun ', app.DropDown31.Value]};
            app.UITable15.RowName(4) = {['F.S. Dinamico segun ', app.DropDown32.Value]};
            
            close(bar_pro)
            
        end

        % Button pushed function: Button25
        function Button25Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Graficando desplazamientos criticos ...';pause(1)
            
            global bernotimo esforfac change_cmap X_dom Vel_Dun Vel_Ray D_rea
            cla(app.UIAxes8)
            cla(app.UIAxes9)
            esforfac = 1;
                                
            Def_Max = max(D_rea);
            X1cr = linspace(0, Vel_Dun, round(length(X_dom)/2));
            if rem(length(X_dom),2) == 0 
                X2cr = linspace(Vel_Ray, Vel_Ray + Vel_Dun, length(X_dom) - round(length(X_dom)/2));
            else
                X2cr = linspace(Vel_Ray, Vel_Ray + Vel_Dun, length(X_dom) - round(length(X_dom)/2) + 1);
            end
            Y1cr = - Def_Max * (X1cr ./ (X1cr - Vel_Dun)) + 2 * Def_Max;
            Y2cr = Def_Max * (X2cr ./ (X2cr - Vel_Ray));
            D_mx = [Y1cr Y2cr]; D_mx = max(D_mx(~isinf(D_mx))); Y1cr(length(Y1cr)) = 1.5 * D_mx; Y2cr(1) = 1.5 * D_mx;
            Vcri = [Y1cr Y2cr];
            area(app.UIAxes9,[X1cr' X2cr'],[Y1cr' Y2cr'],'FaceColor','cyan','FaceAlpha',0.25,'EdgeColor','cyan','LineWidth',2.5)
            area(app.UIAxes9,[Vel_Dun Vel_Ray]',[1.5*D_mx 1.5*D_mx]','FaceColor','red','FaceAlpha',0.25,'EdgeColor','cyan','LineWidth',2.5)
            xlim(app.UIAxes9, [0 max(X2cr)])

            N_F  = cumsum(app.UITable1.Data(:,1));
            N_I  = N_F - app.UITable1.Data(:,1);
            if bernotimo == 1
                N_N  = app.UITable1.Data(:,11) + 12 + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)' + 12));
            elseif bernotimo == 2
                N_N  = app.UITable1.Data(:,11) + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)'));
            end
            for i = 1:app.EditField1.Value - 1
                [x, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                x         = repmat(x(1,:),N_N(i),1);
                y         = repmat(y(1,:),N_N(i),1);
                z         = repmat(z(1,:),N_N(i),1) + linspace(N_I(i),N_F(i),N_N(i))';
                ce = Vcri(linspace(N_P(i),N_P(i+1),N_N(i)))';
                ce = repmat(ce,1,21);
                surf(app.UIAxes8, x, z, y, ce, 'LineWidth', 1, 'EdgeColor', [0 0 0])
            end
            if change_cmap == 0
                colormap(app.UIAxes8, flipud(colormap(app.UIAxes8)));
                change_cmap = 1;
            end
            cb = colorbar(app.UIAxes8,"northoutside",'AxisLocation','in');
            cb.FontSize = 9;
            cb.TickLength = cb.Position(4)/2;
            cb.TickLabelInterpreter = 'latex';
            cb.Label.String      = 'Desplazamientos criticos';
            cb.Label.Color       = [0 1 1];
            cb.Color             = [0 1 1];
            
            y  = [0 cumsum(app.UITable1.Data(:,1))'];
            r  = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]);
            r1 = linspace(0, 2*pi, 50);
            for i = 1:app.EditField1.Value
                r2 = (r(i)/2) * cos(r1);
                r3 = y(i) + zeros(size(r2));
                r4 = (r(i)/2) * sin(r1);
                patch(app.UIAxes8,r2, r3, r4, 'c', 'EdgeColor', 'none')
            end
            if app.UITable1.Data(1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(1,3)/2) * cos(r1), y(1) + zeros(size(r2)) - 0.001, (app.UITable1.Data(1,3)/2) * sin(r1), 'k')
            end
            if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                patch(app.UIAxes8, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * cos(r1), y(length(y)) + zeros(size(r2)) + 0.001, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * sin(r1), 'k')
            end
            axis(app.UIAxes8,'equal')
            view(app.UIAxes8,[35 10])
            
            close(bar_pro)
            
        end

        % Button pushed function: Button26
        function Button26Pushed(app, event)
             
            global bernotimo Def_Rea Pen_Rea Vonmises Tresca Rankine Esf_Sod Esf_God Esf_Asm Des_z Des_y
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Simulando','Indeterminate','on');
            bar_pro.Message = 'Simulando ...';pause(1)
            
            switch app.DropDown33.Value
                case 'Desplazamientos'
                    switch app.DropDown28.Value
                        case 'Lineales'
                            Fun_Gra = Def_Rea;
                            Lab_Bar = 'Deflexiones';
                        case 'Angulares'
                            Fun_Gra = Pen_Rea;
                            Lab_Bar = 'Pendientes';
                    end
                case 'Esfuerzos'
                    switch app.DropDown29.Value
                        case 'Von Misses'
                            Fun_Gra = Vonmises;
                            Lab_Bar = 'Esfuerzos segun Von Misses';
                        case 'Tresca'
                            Fun_Gra = Tresca;
                            Lab_Bar = 'Esfuerzos segun Tresca';
                        case 'Rankine'
                            Fun_Gra = Rankine;
                            Lab_Bar = 'Esfuerzos segun Rankine';
                        case 'Soderberg'
                            Fun_Gra = Esf_Sod;
                            Lab_Bar = 'Esfuerzos segun Soderberg';
                        case 'Goodman'
                            Fun_Gra = Esf_God;
                            Lab_Bar = 'Esfuerzos segun Goodman';
                        case 'ASME'
                            Fun_Gra = Esf_Asm;
                            Lab_Bar = 'Esfuerzos segun ASME';
                    end
            end
            
            if bernotimo == 1
                Nod_Tot = [0 (cumsum(app.UITable1.DisplayData(:,1)))'];
                Elems = [0; cumsum(app.UITable1.Data(:,11) + 12 + 2)];
                for i = 1:(app.EditField1.Value - 1)
                    Fun_gra(Elems(i)+1:Elems(i+1)) = double(subs(Fun_Gra(i,1),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
                end
                Fun_Gra = Fun_gra;
                N_N  = app.UITable1.Data(:,11) + 12 + 2;
%                 N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)' + 12));
                N_P  = [0; cumsum(app.UITable1.Data(:,11) + 12 + 2)];
            elseif bernotimo == 2
                Fun_Gra = Fun_Gra';
                N_N  = app.UITable1.Data(:,11) + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)'));
            end
            N_F = cumsum(app.UITable1.Data(:,1));
            N_I = N_F - app.UITable1.Data(:,1);
            
            app.EditField32.Value = 1;
            VCM = linspace(0.1,1,app.EditField32.Value);
            k   = 0;
            for j = linspace(0,app.EditField31.Value,app.EditField32.Value)
                cla(app.UIAxes16)
                k = k + 1;
                app.EditField32.Value = k;
                for i = 1:app.EditField1.Value - 1
                    [x, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                    if bernotimo == 1
                        x  = repmat(x(1,:),N_N(i),1) + (Des_y(linspace(N_P(i)+1,N_P(i+1),N_N(i)))') .* j;
                        y  = repmat(y(1,:),N_N(i),1) + (Des_z(linspace(N_P(i)+1,N_P(i+1),N_N(i)))') .* j;
                        ce = Fun_Gra(linspace(N_P(i)+1,N_P(i+1),N_N(i)))';
                    elseif bernotimo == 2    
                        x  = repmat(x(1,:),N_N(i),1) + (Des_y(linspace(N_P(i),N_P(i+1),N_N(i)))') .* j;
                        y  = repmat(y(1,:),N_N(i),1) + (Des_z(linspace(N_P(i),N_P(i+1),N_N(i)))') .* j;
                        ce = Fun_Gra(linspace(N_P(i),N_P(i+1),N_N(i)))';
                    end
                    z  = repmat(z(1,:),N_N(i),1) + linspace((N_I(i) + (app.UITable14.Data(i,1) .* j)),(N_F(i) + (app.UITable14.Data(i+1,1) .* j)),N_N(i))';
                    ce = repmat(ce,1,21) .* VCM(k);
                    surf(app.UIAxes16, x, z, y, ce, 'LineWidth', 1, 'EdgeColor', [0 0 0])
                    xlabel(app.UIAxes16,'Y')
                    ylabel(app.UIAxes16,'X')
                    zlabel(app.UIAxes16,'Z')
                    cb = colorbar(app.UIAxes16,"southoutside",'AxisLocation','in');
                    cb.FontSize = 12;
                    cb.TickLabelInterpreter = 'latex';
                    cb.Label.String = Lab_Bar;
                    cb.Label.Color = [0 1 1];
                    cb.Color = [0 1 1];
                end
                x = j .* app.UITable14.Data(:,2);
                y = [0 cumsum(app.UITable1.Data(:,1))'] + j .* app.UITable14.Data(:,1)';
                z = j .* app.UITable14.Data(:,3);
                r = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]);
                r1 = linspace(0, 2*pi, 50);
                for i = 1:app.EditField1.Value
                    r2 = (r(i)/2) * cos(r1) + x(i);
                    r3 = y(i) + zeros(size(r2));
                    r4 = (r(i)/2) * sin(r1) + z(i);
                    patch(app.UIAxes16,r2, r3, r4, linspace(min(Fun_Gra),max(Fun_Gra),length(r2))', 'EdgeColor', 'none')
                end
                if app.UITable1.Data(1,3) ~= 0
                    patch(app.UIAxes16, (app.UITable1.Data(1,3)/2) * cos(r1) + x(1), y(1) + zeros(size(r2)) - 0.001, (app.UITable1.Data(1,3)/2) * sin(r1) + z(1), 'k')
                end
                if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                    patch(app.UIAxes16, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * cos(r1) + x(app.EditField1.Value), y(length(y)) + zeros(size(r2)) + 0.001, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * sin(r1) + z(app.EditField1.Value), 'k')
                end
                axis(app.UIAxes16,'equal')
            end
            
            close(bar_pro)
            
        end

        % Button pushed function: Button27
        function Button27Pushed(app, event)
            
            global bernotimo Def_Rea Pen_Rea Vonmises Tresca Rankine Esf_Sod Esf_God Esf_Asm Des_z Des_y
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Grabando video','Indeterminate','on');
            bar_pro.Message = 'Simulando y grabando...';pause(1)
            
            switch app.DropDown33.Value
                case 'Desplazamientos'
                    switch app.DropDown28.Value
                        case 'Lineales'
                            Fun_Gra = Def_Rea;
                            Lab_Bar = 'Deflexiones';
                        case 'Angulares'
                            Fun_Gra = Pen_Rea;
                            Lab_Bar = 'Pendientes';
                    end
                case 'Esfuerzos'
                    switch app.DropDown29.Value
                        case 'Von Misses'
                            Fun_Gra = Vonmises;
                            Lab_Bar = 'Esfuerzos segun Von Misses';
                        case 'Tresca'
                            Fun_Gra = Tresca;
                            Lab_Bar = 'Esfuerzos segun Tresca';
                        case 'Rankine'
                            Fun_Gra = Rankine;
                            Lab_Bar = 'Esfuerzos segun Rankine';
                        case 'Soderberg'
                            Fun_Gra = Esf_Sod;
                            Lab_Bar = 'Esfuerzos segun Soderberg';
                        case 'Goodman'
                            Fun_Gra = Esf_God;
                            Lab_Bar = 'Esfuerzos segun Goodman';
                        case 'ASME'
                            Fun_Gra = Esf_Asm;
                            Lab_Bar = 'Esfuerzos segun ASME';
                    end
            end
            
            v         = VideoWriter('animation');
            v.Quality = 100;
            open(v);
            h         = figure;
            h.Color   = [0 0 0];
            h.Visible = 'off';
            ax               = gca;
            ax.Color         = [0 0 0];
            ax.XColor        = [0 1 1];
            ax.XLabel.String = 'Y';
            ax.YColor        = [0 1 1];
            ax.YLabel.String = 'X';
            ax.ZColor        = [0 1 1];
            ax.ZLabel.String = 'Z';
            ax.NextPlot      = 'add';
            ax.View                = app.UIAxes16.View;
            ax.Projection          = app.UIAxes16.Projection;
            ax.CameraPosition      = app.UIAxes16.CameraPosition;
            ax.CameraPositionMode  = app.UIAxes16.CameraPositionMode;
            ax.CameraTarget        = app.UIAxes16.CameraTarget;
            ax.CameraTargetMode    = app.UIAxes16.CameraTargetMode;
            ax.CameraUpVector      = app.UIAxes16.CameraUpVector;
            ax.CameraUpVectorMode  = app.UIAxes16.CameraUpVectorMode;
            ax.CameraViewAngle     = app.UIAxes16.CameraViewAngle;
            ax.CameraViewAngleMode = app.UIAxes16.CameraViewAngleMode;
                        
            if bernotimo == 1
                Nod_Tot = [0 (cumsum(app.UITable1.DisplayData(:,1)))'];
                Elems = [0; cumsum(app.UITable1.Data(:,11) + 12 + 2)];
                for i = 1:(app.EditField1.Value - 1)
                    Fun_gra(Elems(i)+1:Elems(i+1)) = double(subs(Fun_Gra(i,1),linspace(Nod_Tot(i),Nod_Tot(i+1),app.UITable1.Data(i,11) + 12 + 2)));
                end
                Fun_Gra = Fun_gra;
                N_N  = app.UITable1.Data(:,11) + 12 + 2;
                N_P  = [0; cumsum(app.UITable1.Data(:,11) + 12 + 2)];
            elseif bernotimo == 2
                Fun_Gra = Fun_Gra';
                N_N  = app.UITable1.Data(:,11) + 2;
                N_P  = (1:app.EditField1.Value) + horzcat(0,cumsum(app.UITable1.Data(:,11)'));
            end
            N_F  = cumsum(app.UITable1.Data(:,1));
            N_I  = N_F - app.UITable1.Data(:,1);
            VCM  = linspace(0.1,1,app.EditField32.Value);
            k    = 0;
            for j = linspace(0,app.EditField31.Value,app.EditField32.Value)
                cla(ax)
                k = k + 1;
                app.EditField32.Value = k;
                for i = 1:app.EditField1.Value - 1
                    [x, y, z] = cylinder(app.UITable1.Data(i,2)/2);
                    if bernotimo == 1
                        x         = repmat(x(1,:),N_N(i),1) + (Des_y(linspace(N_P(i)+1,N_P(i+1),N_N(i)))') .* j;
                        y         = repmat(y(1,:),N_N(i),1) + (Des_z(linspace(N_P(i)+1,N_P(i+1),N_N(i)))') .* j;
                        ce = Fun_Gra(linspace(N_P(i)+1,N_P(i+1),N_N(i)))';
                    elseif bernotimo == 2    
                        x         = repmat(x(1,:),N_N(i),1) + (Des_y(linspace(N_P(i),N_P(i+1),N_N(i)))') .* j;
                        y         = repmat(y(1,:),N_N(i),1) + (Des_z(linspace(N_P(i),N_P(i+1),N_N(i)))') .* j;
                        ce = Fun_Gra(linspace(N_P(i),N_P(i+1),N_N(i)))';
                    end
                    z         = repmat(z(1,:),N_N(i),1) + linspace((N_I(i) + (app.UITable14.Data(i,1) .* j)),(N_F(i) + (app.UITable14.Data(i+1,1) .* j)),N_N(i))';
                    ce = repmat(ce,1,21) .* VCM(k);
                    surf(ax, x, z, y, ce, 'LineWidth', 1, 'EdgeColor', [0 0 0])
                    xlabel(ax,'Y')
                    ylabel(ax,'X')
                    zlabel(ax,'Z')
                    cb = colorbar(ax,"southoutside");
                    cb.FontSize = 12;
                    cb.TickLabelInterpreter = 'latex';
                    cb.Label.String = Lab_Bar;
                    cb.Label.Color = [0 1 1];
                    cb.Color = [0 1 1];
                end
                x = j .* app.UITable14.Data(:,2);
                y = [0 cumsum(app.UITable1.Data(:,1))'] + j .* app.UITable14.Data(:,1)';
                z = j .* app.UITable14.Data(:,3);
                r = max([[app.UITable1.Data(:,2)' 0];[0 app.UITable1.Data(:,2)']]);
                r1 = linspace(0, 2*pi, 50);
                for i = 1:app.EditField1.Value
                    r2 = (r(i)/2) * cos(r1) + x(i);
                    r3 = y(i) + zeros(size(r2));
                    r4 = (r(i)/2) * sin(r1) + z(i);
                    patch(ax,r2, r3, r4, linspace(min(Fun_Gra),max(Fun_Gra),length(r2))', 'EdgeColor', 'none')
                end
                if app.UITable1.Data(1,3) ~= 0
                    patch(ax, (app.UITable1.Data(1,3)/2) * cos(r1) + x(1), y(1) + zeros(size(r2)) - 0.001, (app.UITable1.Data(1,3)/2) * sin(r1) + z(1), 'k')
                end
                if app.UITable1.Data(app.EditField1.Value - 1,3) ~= 0
                    patch(ax, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * cos(r1) + x(app.EditField1.Value), y(length(y)) + zeros(size(r2)) + 0.001, (app.UITable1.Data(app.EditField1.Value - 1,3)/2) * sin(r1) + z(app.EditField1.Value), 'k')
                end
                axis(ax,'equal')
                M = getframe(h);
                writeVideo(v,M);
            end
            close(v);
            close(h);
            
            bar_pro.Message = 'Convirtiendo...';pause(2)
            n = VideoReader('animation.avi');
            v = VideoWriter('animacion');
            v.Quality = 100;
            open(v);
            for i = [1:n.NumFrames n.NumFrames:-1:1]
                writeVideo(v,read(n,i));
            end
            close(v)
            v = VideoReader('animacion.avi');
            filename  = 'animation.gif';
            h         = figure;
            h.Visible = 'off';
            ax        = gca;
            for i = 1:v.NumFrames
                imshow(read(v,i), 'Parent', ax)
                im = frame2im(getframe(gca));
                [imind,cm] = rgb2ind(im,256);
                if i == 1
                    imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1);
                else
                    imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1);
                end
            end
            close(h)
            
            bar_pro.Message = 'Grabacion finalizada';pause(2)
            close(bar_pro)
            
        end

        % Menu selected function: submenu11
        function submenu11Selected(app, event)
            % Agrega un tramo al eje en la parte final
            global Nodos
            
            app.UITable1.Data(app.EditField1.Value,:)                 = zeros(1,11);
            app.UITable1.RowName(app.EditField1.Value)                = {['Tramo ', num2str(app.EditField1.Value)]};
            app.UITable2.Data(app.EditField1.Value + 1,:)             = num2cell(zeros(1,7));
            app.UITable2.Data(app.EditField1.Value + 1,1)             = {'Definir'};
            app.UITable3.Data(app.EditField1.Value + 1,:)             = zeros(1,8);
            app.UITable14.Data(app.EditField1.Value + 1,:)            = zeros(1,8);
            app.UITable4.Data(app.EditField1.Value + 1,1:6)           = num2cell(zeros(1,6));
            app.UITable4.Data(app.EditField1.Value + 1,7:20)          = num2cell(ones(1,14));
            app.UITable4.Data(app.EditField1.Value + 1,[5,6])         = {'Definir'};
            app.UITable5.Data(app.EditField1.Value,:)                 = num2cell(zeros(1,8));
            app.UITable5.Data(app.EditField1.Value,1)                 = {'Definir'};
            app.UITable2.RowName(app.EditField1.Value + 1)            = {['Nodo ', num2str(app.EditField1.Value + 1)]};
            app.UITable3.RowName(app.EditField1.Value + 1)            = {['Nodo ', num2str(app.EditField1.Value + 1)]};
            app.UITable14.RowName(app.EditField1.Value + 1)           = {['Nodo ', num2str(app.EditField1.Value + 1)]};
            app.UITable4.RowName(app.EditField1.Value + 1)            = {['Nodo ', num2str(app.EditField1.Value + 1)]};
            app.UITable5.RowName(app.EditField1.Value)                = {['Tramo ', num2str(app.EditField1.Value)]};
            app.EditField1.Value                                      = app.EditField1.Value + 1;
            
            Nodos(app.EditField1.Value) = {['Nodo ', num2str(app.EditField1.Value)]};
            
        end

        % Menu selected function: submenu12
        function submenu12Selected(app, event)
            % Elimina el ultimo tramo del eje
            global Nodos
            
            if app.EditField1.Value ~= 2
                app.UITable1.Data    = app.UITable1.Data(1:app.EditField1.Value - 2,:);
                app.UITable2.Data    = app.UITable2.Data(1:app.EditField1.Value - 1,:);
                app.UITable3.Data    = app.UITable3.Data(1:app.EditField1.Value - 1,:);
                app.UITable14.Data   = app.UITable3.Data(1:app.EditField1.Value - 1,:);
                app.UITable4.Data    = app.UITable4.Data(1:app.EditField1.Value - 1,:);
                app.UITable5.Data    = app.UITable5.Data(1:app.EditField1.Value - 2,:);
                app.EditField1.Value = app.EditField1.Value - 1;
                
                Nodos(app.EditField1.Value + 1) = [];
            end
           
        end

        % Menu selected function: submenu13
        function submenu13MenuSelected(app, event)
            % Mismo diametro externo en la tabla de el modulo de parametros
            app.UITable1.Data(:,2)=app.UITable1.Data(1,2);
            UITable1DisplayDataChanged(app, event);
            
        end

        % Menu selected function: submenu14
        function submenu14MenuSelected(app, event)
            % Mismo diametro interno en la tabla de el modulo de parametros
            app.UITable1.Data(:,3)=app.UITable1.Data(1,3);
            UITable1DisplayDataChanged(app, event);
            
        end

        % Menu selected function: submenu15
        function submenu15MenuSelected(app, event)
            % Mismo E en la tabla de el modulo de parametros
            app.UITable1.Data(:,6)=app.UITable1.Data(1,6);
            
        end

        % Menu selected function: submenu16
        function submenu16MenuSelected(app, event)
            % Mismo G en la tabla de el modulo de parametros
            app.UITable1.Data(:,7)=app.UITable1.Data(1,7);
            
        end

        % Menu selected function: submenu17
        function submenu17MenuSelected(app, event)
            % Mismo esfuerzo de fluencia en la tabla de el modulo de parametros
            app.UITable1.Data(:,8)=app.UITable1.Data(1,8);
            
        end

        % Menu selected function: submenu18
        function submenu18MenuSelected(app, event)
            % Mismo esfuerzo de rotura en la tabla de el modulo de parametros
            app.UITable1.Data(:,9)=app.UITable1.Data(1,9);
            
        end

        % Menu selected function: submenu19
        function submenu19MenuSelected(app, event)
            % Misma densidad en la tabla de el modulo de parametros
            app.UITable1.Data(:,10) = app.UITable1.Data(1,10);
            
        end

        % Menu selected function: submenu20
        function submenu20MenuSelected(app, event)
            % Mismo numero de elementos en la tabla de el modulo de parametros
            app.UITable1.Data(:,11) = app.UITable1.Data(1,11);
            
        end

        % Menu selected function: submenu211
        function submenu211Selected(app, event)
            % Grafica esquematica 1
            grid(app.UIAxes1, 'On')
            
        end

        % Menu selected function: submenu212
        function submenu212Selected(app, event)
            % Grafica esquematica 1
            grid(app.UIAxes1, 'Off')
            
        end

        % Menu selected function: submenu221
        function submenu221MenuSelected(app, event)
            % Agrega la ubicacion de cada nodo en la 1 grafica esquematica
            global Nodos texto1
            
            x2 = cumsum(app.UITable1.DisplayData(:,1));
            texto1 = text(app.UIAxes1, [0 x2'], zeros(1,numel(x2)+ 1), Nodos, 'Fontsize', 10);
            set(texto1, 'Color', [1 1 1])

        end

        % Menu selected function: submenu222
        function submenu222MenuSelected(app, event)
            % Borra la ubicacion de cada nodo en la 1 grafica esquematica
            global texto1
            
            if exist('texto1', "var")
                delete(texto1)
            end
            
        end

        % Menu selected function: submenu231
        function submenu231MenuSelected(app, event)
            % Agrega las longitudes de cada tramo en la 1 grafica esquematica
            global texto2
            
            y1     = app.UITable1.DisplayData(:,2) ./ 2;
            x2     = cumsum(app.UITable1.DisplayData(:,1));
            x1     = x2 - app.UITable1.DisplayData(:,1);
            x3     = (x2 + x1) ./ 2;
            texto2 = text(app.UIAxes1, x3, y1, num2str(app.UITable1.DisplayData(:,1)), 'Fontsize', 20);
            set(texto2, 'Color', [1 1 1])
            
        end

        % Menu selected function: submenu232
        function submenu232MenuSelected(app, event)
            % Borra las longitudes de cada tramo en la 1 grafica esquematica
            global texto2
            
            if exist('texto2', "var")
                delete(texto2)
            end
            
        end

        % Menu selected function: submenu31
        function submenu31Selected(app, event)
            % Grafica de los diagramas de resultados del eje
            grid(app.UIAxes9, 'On')
            
        end

        % Menu selected function: submenu32
        function submenu32Selected(app, event)
            % Grafica de los diagramas de resultados del eje
            grid(app.UIAxes9, 'Off')
            
        end

        % Menu selected function: submenu41
        function submenu41MenuSelected(app, event)
            % Grafica del diagrama SN
            grid(app.UIAxes11,'on')
            
        end

        % Menu selected function: submenu42
        function submenu42MenuSelected(app, event)
            % Grafica del diagrama SN
            grid(app.UIAxes11,'off')
            
        end

        % Menu selected function: submenu51
        function submenu51Selected(app, event)
            % Mismo acabado superficial en la tabla de el modulo de fatiga
            app.UITable5.Data(:,1) = app.UITable5.Data(1,1);
            
        end

        % Value changing function: Slider1
        function Slider1ValueChanging(app, event)
            
            app.UIAxes16.View(1) = event.Value;
            app.UIAxes16.View(2) = app.Slider2.Value;
            
        end

        % Value changing function: Slider2
        function Slider2ValueChanging(app, event)

            app.UIAxes16.View(1) = app.Slider1.Value;
            app.UIAxes16.View(2) = event.Value;
            
        end

        % Button pushed function: Button28
        function Button28Pushed(app, event)
            
            app.UIAxes16.View(1) = 0;
            app.UIAxes16.View(2) = 90;
            
        end

        % Button pushed function: Button29
        function Button29Pushed(app, event)
            
            app.UIAxes16.View(1) = 180;
            app.UIAxes16.View(2) = 0;
            
        end

        % Button pushed function: Button30
        function Button30Pushed(app, event)
            
            app.UIAxes16.View(1) = 90;
            app.UIAxes16.View(2) = 0;
            
        end

        % Button pushed function: Button31
        function Button31Pushed(app, event)
            
            app.UIAxes16.View(1) = 35;
            app.UIAxes16.View(2) = 10;
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 100 1365 767];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Scrollable = 'on';
            app.UIFigure.WindowState = 'maximized';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.AutoResizeChildren = 'off';
            app.TabGroup.Position = [1 1 1365 767];

            % Create Tab1
            app.Tab1 = uitab(app.TabGroup);
            app.Tab1.AutoResizeChildren = 'off';
            app.Tab1.Title = 'PARAMETROS';
            app.Tab1.BackgroundColor = [0 0 0];

            % Create UIAxes1
            app.UIAxes1 = uiaxes(app.Tab1);
            title(app.UIAxes1, 'Esquema Grafico del Eje')
            xlabel(app.UIAxes1, 'Longitud del Eje')
            app.UIAxes1.AmbientLightColor = [0 0 0];
            app.UIAxes1.PlotBoxAspectRatio = [2.51243781094527 1 1];
            app.UIAxes1.FontName = 'Times';
            app.UIAxes1.XColor = [0 1 1];
            app.UIAxes1.XTickLabelRotation = 0;
            app.UIAxes1.YColor = [0 0 0];
            app.UIAxes1.YTickLabelRotation = 0;
            app.UIAxes1.ZTickLabelRotation = 0;
            app.UIAxes1.Color = [0 0 0];
            app.UIAxes1.GridColor = [0 1 1];
            app.UIAxes1.GridAlpha = 0.5;
            app.UIAxes1.Box = 'on';
            app.UIAxes1.NextPlot = 'add';
            app.UIAxes1.Position = [1 30 593 295];

            % Create UITable1
            app.UITable1 = uitable(app.Tab1);
            app.UITable1.ColumnName = {'Longitud'; 'Diametro Externo'; 'Diametro Interno'; 'Carga Distribuida Lineal XZ'; 'Carga Distribuida Lineal XY'; 'Modulo de Elasticidad'; 'Modulo de Rigidez'; 'Esfuerzo de Fluencia'; 'Esfuerzo de Rotura'; 'Densidad'; 'Elementos'};
            app.UITable1.RowName = {};
            app.UITable1.ColumnEditable = true;
            app.UITable1.CellSelectionCallback = createCallbackFcn(app, @UITable1CellSelection, true);
            app.UITable1.DisplayDataChangedFcn = createCallbackFcn(app, @UITable1DisplayDataChanged, true);
            app.UITable1.FontName = 'Times';
            app.UITable1.Position = [42 365 1265 267];

            % Create UITable2
            app.UITable2 = uitable(app.Tab1);
            app.UITable2.ColumnName = {'Tipo de Apoyo'; 'Fuerza X'; 'Fuerza Y'; 'Fuerza Z'; 'Momento X'; 'Momento Y'; 'Momento Z'};
            app.UITable2.RowName = {};
            app.UITable2.ColumnEditable = true;
            app.UITable2.CellEditCallback = createCallbackFcn(app, @UITable2CellEdit, true);
            app.UITable2.CellSelectionCallback = createCallbackFcn(app, @UITable2CellSelection, true);
            app.UITable2.FontName = 'Times';
            app.UITable2.Position = [611 62 696 244];

            % Create NodosLabel
            app.NodosLabel = uilabel(app.Tab1);
            app.NodosLabel.FontName = 'Times';
            app.NodosLabel.FontSize = 15;
            app.NodosLabel.FontColor = [0 1 1];
            app.NodosLabel.Position = [1207 687 49 22];
            app.NodosLabel.Text = 'Nodos';

            % Create EditField1
            app.EditField1 = uieditfield(app.Tab1, 'numeric');
            app.EditField1.Limits = [2 Inf];
            app.EditField1.ValueChangedFcn = createCallbackFcn(app, @EditField1ValueChanged, true);
            app.EditField1.FontName = 'Times';
            app.EditField1.FontSize = 15;
            app.EditField1.Position = [1258 687 49 22];
            app.EditField1.Value = 2;

            % Create Label2
            app.Label2 = uilabel(app.Tab1);
            app.Label2.FontName = 'Times';
            app.Label2.FontSize = 15;
            app.Label2.FontColor = [0 1 1];
            app.Label2.Position = [42 646 278 22];
            app.Label2.Text = 'Propiedades geométricas y mecánicas del eje';

            % Create Label3
            app.Label3 = uilabel(app.Tab1);
            app.Label3.FontName = 'Times';
            app.Label3.FontSize = 15;
            app.Label3.FontColor = [0 1 1];
            app.Label3.Position = [42 326 196 22];
            app.Label3.Text = 'Grafico esquemático del eje';

            % Create Label4
            app.Label4 = uilabel(app.Tab1);
            app.Label4.FontName = 'Times';
            app.Label4.FontSize = 15;
            app.Label4.FontColor = [0 1 1];
            app.Label4.Position = [611 326 236 22];
            app.Label4.Text = 'Apoyos, fuerzas y momentos en el eje';

            % Create Label1
            app.Label1 = uilabel(app.Tab1);
            app.Label1.FontName = 'Times';
            app.Label1.FontSize = 25;
            app.Label1.FontColor = [0 1 1];
            app.Label1.Position = [42 680 828 33];
            app.Label1.Text = 'Definición de los parámetros necesarios para el cálculo y diseño del eje';

            % Create CentrodeMasaLabel
            app.CentrodeMasaLabel = uilabel(app.Tab1);
            app.CentrodeMasaLabel.HorizontalAlignment = 'right';
            app.CentrodeMasaLabel.FontName = 'Times';
            app.CentrodeMasaLabel.FontColor = [0 1 1];
            app.CentrodeMasaLabel.Position = [263 322 52 30];
            app.CentrodeMasaLabel.Text = {'Centro de'; 'masa       '};

            % Create EditField27
            app.EditField27 = uieditfield(app.Tab1, 'numeric');
            app.EditField27.Editable = 'off';
            app.EditField27.FontName = 'Times';
            app.EditField27.Position = [333 328 80 22];

            % Create PesodelEjeLabel
            app.PesodelEjeLabel = uilabel(app.Tab1);
            app.PesodelEjeLabel.HorizontalAlignment = 'right';
            app.PesodelEjeLabel.FontName = 'Times';
            app.PesodelEjeLabel.FontColor = [0 1 1];
            app.PesodelEjeLabel.Position = [434 321 56 30];
            app.PesodelEjeLabel.Text = {'Peso del '; 'eje          '};

            % Create EditField28
            app.EditField28 = uieditfield(app.Tab1, 'numeric');
            app.EditField28.Editable = 'off';
            app.EditField28.FontName = 'Times';
            app.EditField28.Position = [499 329 80 22];

            % Create StateButton14
            app.StateButton14 = uibutton(app.Tab1, 'state');
            app.StateButton14.ValueChangedFcn = createCallbackFcn(app, @StateButton14ValueChanged, true);
            app.StateButton14.Text = 'Incluir el peso propio del eje';
            app.StateButton14.BackgroundColor = [0 0 0];
            app.StateButton14.FontName = 'Times';
            app.StateButton14.FontSize = 15;
            app.StateButton14.FontColor = [0 1 1];
            app.StateButton14.Position = [916 682 231 31];

            % Create Tab3
            app.Tab3 = uitab(app.TabGroup);
            app.Tab3.AutoResizeChildren = 'off';
            app.Tab3.Title = 'FACTORES';
            app.Tab3.BackgroundColor = [1 1 1];

            % Create UIAxes10
            app.UIAxes10 = uiaxes(app.Tab3);
            title(app.UIAxes10, 'Grafica Bidimensional del Eje')
            xlabel(app.UIAxes10, 'Longitud del Eje')
            app.UIAxes10.PlotBoxAspectRatio = [1.47445255474453 1 1];
            app.UIAxes10.FontName = 'Times';
            app.UIAxes10.XTickLabelRotation = 0;
            app.UIAxes10.YColor = [1 1 1];
            app.UIAxes10.YTickLabelRotation = 0;
            app.UIAxes10.ZTickLabelRotation = 0;
            app.UIAxes10.NextPlot = 'add';
            app.UIAxes10.Position = [879 303 451 329];

            % Create Label6
            app.Label6 = uilabel(app.Tab3);
            app.Label6.FontName = 'Times';
            app.Label6.FontSize = 25;
            app.Label6.Position = [42 680 565 33];
            app.Label6.Text = 'Factores de concentración de esfuerzos y fatiga';

            % Create UITable4
            app.UITable4 = uitable(app.Tab3);
            app.UITable4.ColumnName = {'Caso 1: r'; 'Caso 2: r'; 'Caso 2: d'; 'Caso 3: d'; 'Caso 4: a)'; 'Caso 4: b)'; 'Kt1: Axial'; 'Kt1: Flector'; 'Kt1: Torque'; 'Kt2: Axial'; 'Kt2: Flector'; 'Kt2: Torque'; 'Kt3: Axial'; 'Kt3: Flector'; 'Kt3: Torque'; 'Kt4: Axial'; 'Kt4: Flector'; 'Kt4: Torque'; 'Ktf: Dinamico'; 'Ktt: Dinamico'};
            app.UITable4.RowName = {};
            app.UITable4.ColumnEditable = [true true true true true true false false false false false false false false false false false false false false];
            app.UITable4.CellEditCallback = createCallbackFcn(app, @UITable4CellEdit, true);
            app.UITable4.CellSelectionCallback = createCallbackFcn(app, @UITable4CellSelection, true);
            app.UITable4.FontName = 'Times';
            app.UITable4.Position = [42 313 814 199];

            % Create Image1
            app.Image1 = uiimage(app.Tab3);
            app.Image1.Position = [42 553 156 111];
            app.Image1.ImageSource = fullfile(pathToMLAPP, 'M5RSC', 'cambio.png');

            % Create Image2
            app.Image2 = uiimage(app.Tab3);
            app.Image2.Position = [206 553 156 111];
            app.Image2.ImageSource = fullfile(pathToMLAPP, 'M5RSC', 'muesca.png');

            % Create Image3
            app.Image3 = uiimage(app.Tab3);
            app.Image3.Position = [369 562 156 111];
            app.Image3.ImageSource = fullfile(pathToMLAPP, 'M5RSC', 'agujero.png');

            % Create Image4
            app.Image4 = uiimage(app.Tab3);
            app.Image4.Position = [533 556 156 111];
            app.Image4.ImageSource = fullfile(pathToMLAPP, 'M5RSC', 'medio.png');

            % Create Image5
            app.Image5 = uiimage(app.Tab3);
            app.Image5.Position = [701 555 156 111];
            app.Image5.ImageSource = fullfile(pathToMLAPP, 'M5RSC', 'final.png');

            % Create Label45
            app.Label45 = uilabel(app.Tab3);
            app.Label45.FontName = 'Times';
            app.Label45.FontSize = 15;
            app.Label45.Position = [93 530 46 22];
            app.Label45.Text = 'Caso 1';

            % Create Label46
            app.Label46 = uilabel(app.Tab3);
            app.Label46.FontName = 'Times';
            app.Label46.FontSize = 15;
            app.Label46.Position = [254 530 46 22];
            app.Label46.Text = 'Caso 2';

            % Create Label47
            app.Label47 = uilabel(app.Tab3);
            app.Label47.FontName = 'Times';
            app.Label47.FontSize = 15;
            app.Label47.Position = [429 530 46 22];
            app.Label47.Text = 'Caso 3';

            % Create Label48
            app.Label48 = uilabel(app.Tab3);
            app.Label48.FontName = 'Times';
            app.Label48.FontSize = 15;
            app.Label48.Position = [549 530 110 22];
            app.Label48.Text = 'Caso 4: a) Profile';

            % Create Label49
            app.Label49 = uilabel(app.Tab3);
            app.Label49.FontName = 'Times';
            app.Label49.FontSize = 15;
            app.Label49.Position = [703 532 140 22];
            app.Label49.Text = 'Caso 4: b) Sled runner';

            % Create TemperaturadetrabajoLabel
            app.TemperaturadetrabajoLabel = uilabel(app.Tab3);
            app.TemperaturadetrabajoLabel.FontName = 'Times';
            app.TemperaturadetrabajoLabel.Position = [42 246 133 22];
            app.TemperaturadetrabajoLabel.Text = 'Temperatura de trabajo';

            % Create EditField24
            app.EditField24 = uieditfield(app.Tab3, 'numeric');
            app.EditField24.Limits = [0 550];
            app.EditField24.FontName = 'Times';
            app.EditField24.Position = [42 216 125 22];
            app.EditField24.Value = 25;

            % Create deconfiabilidadLabel
            app.deconfiabilidadLabel = uilabel(app.Tab3);
            app.deconfiabilidadLabel.FontName = 'Times';
            app.deconfiabilidadLabel.Position = [42 181 106 22];
            app.deconfiabilidadLabel.Text = '% de confiabilidad';

            % Create EditField25
            app.EditField25 = uieditfield(app.Tab3, 'numeric');
            app.EditField25.Limits = [50 100];
            app.EditField25.FontName = 'Times';
            app.EditField25.Position = [42 152 125 22];
            app.EditField25.Value = 50;

            % Create UITable5
            app.UITable5 = uitable(app.Tab3);
            app.UITable5.ColumnName = {'Acabado Superficial'; 'K: acabado superficial'; 'K: tamaño'; 'K: tipo de carga'; 'K: temperatura'; 'K: confiabilidad'; 'Se'''; 'Se'};
            app.UITable5.RowName = {};
            app.UITable5.ColumnEditable = [true false false false false false false false];
            app.UITable5.CellSelectionCallback = createCallbackFcn(app, @UITable5CellSelection, true);
            app.UITable5.FontName = 'Times';
            app.UITable5.Position = [197 26 659 237];

            % Create Label50
            app.Label50 = uilabel(app.Tab3);
            app.Label50.FontName = 'Times';
            app.Label50.FontSize = 15;
            app.Label50.FontWeight = 'bold';
            app.Label50.Position = [41 278 281 22];
            app.Label50.Text = 'Factores modificatorios del límite de fatiga';

            % Create AltociclajeLabel
            app.AltociclajeLabel = uilabel(app.Tab3);
            app.AltociclajeLabel.FontName = 'Times';
            app.AltociclajeLabel.Position = [42 116 66 22];
            app.AltociclajeLabel.Text = 'Alto ciclaje';

            % Create EditField26
            app.EditField26 = uieditfield(app.Tab3, 'numeric');
            app.EditField26.FontName = 'Times';
            app.EditField26.Position = [42 89 125 22];
            app.EditField26.Value = 1000000;

            % Create RPMdelejeLabel
            app.RPMdelejeLabel = uilabel(app.Tab3);
            app.RPMdelejeLabel.FontName = 'Times';
            app.RPMdelejeLabel.Position = [42 51 65 22];
            app.RPMdelejeLabel.Text = 'RPM del eje';

            % Create EditField29
            app.EditField29 = uieditfield(app.Tab3, 'numeric');
            app.EditField29.Limits = [0 Inf];
            app.EditField29.FontName = 'Times';
            app.EditField29.Position = [42 24 125 22];
            app.EditField29.Value = 100;

            % Create Button23
            app.Button23 = uibutton(app.Tab3, 'push');
            app.Button23.ButtonPushedFcn = createCallbackFcn(app, @Button23Pushed, true);
            app.Button23.BackgroundColor = [0.9412 0.9412 0.9412];
            app.Button23.FontName = 'Times';
            app.Button23.FontSize = 14;
            app.Button23.Position = [703 682 153 31];
            app.Button23.Text = 'Calcular factores';

            % Create Label51
            app.Label51 = uilabel(app.Tab3);
            app.Label51.FontName = 'Times';
            app.Label51.FontSize = 15;
            app.Label51.FontWeight = 'bold';
            app.Label51.Position = [903 278 64 22];
            app.Label51.Text = 'Chavetas';

            % Create UITable16
            app.UITable16 = uitable(app.Tab3);
            app.UITable16.ColumnName = {'Sy'; 'F.S.'; 'Torque'; 'Lados'; 'Longitud'};
            app.UITable16.RowName = {};
            app.UITable16.ColumnEditable = [true true true true false];
            app.UITable16.FontName = 'Times';
            app.UITable16.Position = [903 110 420 153];

            % Create HTML1
            app.HTML1 = uihtml(app.Tab3);
            app.HTML1.HTMLSource = '<marquee behavior="alternate"><a style="text-decoration:none" href="https://www.skfbearingselect.com/#/bearing-selection-start" target="_blank"><font color="black" face="Helvetica" size="6"><b>&nbsp;&nbsp;&nbsp;&nbsp;Selección de <br>Rodamientos SKF</b></font></a></marquee>';
            app.HTML1.Position = [903 19 421 74];

            % Create Tab4
            app.Tab4 = uitab(app.TabGroup);
            app.Tab4.AutoResizeChildren = 'off';
            app.Tab4.Title = 'RESULTADOS';
            app.Tab4.BackgroundColor = [0 0 0];

            % Create UIAxes8
            app.UIAxes8 = uiaxes(app.Tab4);
            title(app.UIAxes8, 'Grafico 3D del Eje')
            ylabel(app.UIAxes8, 'Dimensiones del Eje')
            app.UIAxes8.View = [60 30];
            app.UIAxes8.PlotBoxAspectRatio = [1.70029189899063 1.52690062479871 1];
            app.UIAxes8.FontName = 'Times';
            app.UIAxes8.TickLabelInterpreter = 'latex';
            app.UIAxes8.GridLineStyle = '--';
            app.UIAxes8.XColor = [0 1 1];
            app.UIAxes8.XTickLabelRotation = 0;
            app.UIAxes8.YColor = [0 1 1];
            app.UIAxes8.YTickLabelRotation = 0;
            app.UIAxes8.ZColor = [0 1 1];
            app.UIAxes8.ZTickLabelRotation = 0;
            app.UIAxes8.Color = [0 0 0];
            app.UIAxes8.GridColor = [0 0 0];
            app.UIAxes8.GridAlpha = 0.5;
            app.UIAxes8.ColorOrder = [0.502 0.502 0.502];
            app.UIAxes8.NextPlot = 'add';
            app.UIAxes8.Position = [257 347 545 299];

            % Create UIAxes9
            app.UIAxes9 = uiaxes(app.Tab4);
            title(app.UIAxes9, 'Title')
            xlabel(app.UIAxes9, 'Longitud del Eje')
            app.UIAxes9.PlotBoxAspectRatio = [1.92213114754098 1 1];
            app.UIAxes9.FontName = 'Times';
            app.UIAxes9.XColor = [0 1 1];
            app.UIAxes9.XTickLabelRotation = 0;
            app.UIAxes9.YColor = [0 1 1];
            app.UIAxes9.YTickLabelRotation = 0;
            app.UIAxes9.ZTickLabelRotation = 0;
            app.UIAxes9.Color = [0 0 0];
            app.UIAxes9.GridAlpha = 0.5;
            app.UIAxes9.XGrid = 'on';
            app.UIAxes9.YGrid = 'on';
            app.UIAxes9.NextPlot = 'add';
            app.UIAxes9.Position = [815 352 516 327];

            % Create UIAxes11
            app.UIAxes11 = uiaxes(app.Tab4);
            xlabel(app.UIAxes11, 'Numero de Ciclos')
            app.UIAxes11.PlotBoxAspectRatio = [1.92156862745098 1 1];
            app.UIAxes11.FontName = 'Times';
            app.UIAxes11.XColor = [0 1 1];
            app.UIAxes11.XTickLabelRotation = 0;
            app.UIAxes11.XScale = 'log';
            app.UIAxes11.XMinorTick = 'on';
            app.UIAxes11.YColor = [0 1 1];
            app.UIAxes11.YTickLabelRotation = 0;
            app.UIAxes11.YScale = 'log';
            app.UIAxes11.YMinorTick = 'on';
            app.UIAxes11.ZTickLabelRotation = 0;
            app.UIAxes11.Color = [0 0 0];
            app.UIAxes11.GridColor = [0 1 1];
            app.UIAxes11.MinorGridColor = [0 1 1];
            app.UIAxes11.GridAlpha = 0.8;
            app.UIAxes11.XGrid = 'on';
            app.UIAxes11.YGrid = 'on';
            app.UIAxes11.NextPlot = 'add';
            app.UIAxes11.Position = [803 31 528 293];

            % Create UITable3
            app.UITable3 = uitable(app.Tab4);
            app.UITable3.ColumnName = {'Fx'; 'Fy'; 'Fz'; 'Mx'; 'My'; 'Mz'; 'Esfuerzos Estaticos'; 'Factores de  Seguridad'};
            app.UITable3.RowName = {};
            app.UITable3.FontName = 'Times';
            app.UITable3.Position = [39 173 765 143];

            % Create Label7
            app.Label7 = uilabel(app.Tab4);
            app.Label7.FontName = 'Times';
            app.Label7.FontSize = 25;
            app.Label7.FontColor = [0 1 1];
            app.Label7.Position = [42 680 344 33];
            app.Label7.Text = 'Resultados del cálculo del eje';

            % Create Button1
            app.Button1 = uibutton(app.Tab4, 'push');
            app.Button1.ButtonPushedFcn = createCallbackFcn(app, @Button1Pushed, true);
            app.Button1.Icon = fullfile(pathToMLAPP, 'M5RSC', 'engrane.gif');
            app.Button1.BackgroundColor = [1 1 1];
            app.Button1.FontName = 'Times';
            app.Button1.FontSize = 14;
            app.Button1.Position = [408 682 183 27];
            app.Button1.Text = {'Bernoulli'; ''};

            % Create PlanoLabel
            app.PlanoLabel = uilabel(app.Tab4);
            app.PlanoLabel.HorizontalAlignment = 'center';
            app.PlanoLabel.FontName = 'Times';
            app.PlanoLabel.FontSize = 14;
            app.PlanoLabel.FontColor = [0 1 1];
            app.PlanoLabel.Position = [966 681 56 27];
            app.PlanoLabel.Text = 'Plano';

            % Create DropDown1
            app.DropDown1 = uidropdown(app.Tab4);
            app.DropDown1.Items = {'XZ', 'XY'};
            app.DropDown1.FontName = 'Times';
            app.DropDown1.FontSize = 14;
            app.DropDown1.Position = [1036 682 57 27];
            app.DropDown1.Value = 'XZ';

            % Create DropDown2
            app.DropDown2 = uidropdown(app.Tab4);
            app.DropDown2.Items = {'Fuerzas Cortantes', 'Momentos Flectores', 'Pendientes', 'Deflexiones', 'Esfuerzos Cortantes', 'Esfuerzos Flexionantes', 'Esfuerzos Cortantes Maximos', 'Esfuerzos Flexionantes Maximos', 'Fuerzas Axiales', 'Esfuerzos Axiales', 'Momentos Torsores', 'Esfuerzos Torsionales'};
            app.DropDown2.FontName = 'Times';
            app.DropDown2.FontSize = 14;
            app.DropDown2.Position = [1121 681 202 27];
            app.DropDown2.Value = 'Fuerzas Cortantes';

            % Create Button18
            app.Button18 = uibutton(app.Tab4, 'push');
            app.Button18.ButtonPushedFcn = createCallbackFcn(app, @Button18Pushed, true);
            app.Button18.BackgroundColor = [0 0 0];
            app.Button18.FontName = 'Times';
            app.Button18.FontSize = 14;
            app.Button18.FontColor = [0 1 1];
            app.Button18.Position = [39 618 170 28];
            app.Button18.Text = 'Desplazamientos';

            % Create Button19
            app.Button19 = uibutton(app.Tab4, 'push');
            app.Button19.ButtonPushedFcn = createCallbackFcn(app, @Button19Pushed, true);
            app.Button19.BackgroundColor = [0 0 0];
            app.Button19.FontName = 'Times';
            app.Button19.FontSize = 14;
            app.Button19.FontColor = [0 1 1];
            app.Button19.Position = [39 552 170 27];
            app.Button19.Text = 'Esfuerzos';

            % Create Button20
            app.Button20 = uibutton(app.Tab4, 'push');
            app.Button20.ButtonPushedFcn = createCallbackFcn(app, @Button20Pushed, true);
            app.Button20.BackgroundColor = [0 0 0];
            app.Button20.FontName = 'Times';
            app.Button20.FontSize = 14;
            app.Button20.FontColor = [0 1 1];
            app.Button20.Position = [39 478 170 33];
            app.Button20.Text = 'Factores de seguridad';

            % Create DropDown28
            app.DropDown28 = uidropdown(app.Tab4);
            app.DropDown28.Items = {'Lineales', 'Angulares'};
            app.DropDown28.FontName = 'Times';
            app.DropDown28.FontSize = 14;
            app.DropDown28.Position = [39 593 170 26];
            app.DropDown28.Value = 'Lineales';

            % Create DropDown29
            app.DropDown29 = uidropdown(app.Tab4);
            app.DropDown29.Items = {'Von Misses', 'Tresca', 'Rankine', 'Soderberg', 'Goodman', 'ASME'};
            app.DropDown29.FontName = 'Times';
            app.DropDown29.FontSize = 14;
            app.DropDown29.Position = [39 527 170 26];
            app.DropDown29.Value = 'Von Misses';

            % Create DropDown30
            app.DropDown30 = uidropdown(app.Tab4);
            app.DropDown30.Items = {'Von Misses', 'Tresca', 'Rankine', 'Soderberg', 'Goodman', 'ASME'};
            app.DropDown30.FontName = 'Times';
            app.DropDown30.FontSize = 14;
            app.DropDown30.Position = [39 451 170 26];
            app.DropDown30.Value = 'ASME';

            % Create Button21
            app.Button21 = uibutton(app.Tab4, 'push');
            app.Button21.ButtonPushedFcn = createCallbackFcn(app, @Button21Pushed, true);
            app.Button21.BackgroundColor = [0 0 0];
            app.Button21.FontName = 'Times';
            app.Button21.FontSize = 14;
            app.Button21.FontColor = [0 1 1];
            app.Button21.Position = [833 682 109 27];
            app.Button21.Text = 'Diagramas';

            % Create Button22
            app.Button22 = uibutton(app.Tab4, 'push');
            app.Button22.ButtonPushedFcn = createCallbackFcn(app, @Button22Pushed, true);
            app.Button22.Icon = fullfile(pathToMLAPP, 'M5RSC', 'engrane.gif');
            app.Button22.BackgroundColor = [1 1 1];
            app.Button22.FontName = 'Times';
            app.Button22.FontSize = 14;
            app.Button22.Position = [621 682 183 27];
            app.Button22.Text = {'Timoshenko'; ''};

            % Create Label54
            app.Label54 = uilabel(app.Tab4);
            app.Label54.HorizontalAlignment = 'center';
            app.Label54.FontName = 'Times';
            app.Label54.FontSize = 14;
            app.Label54.FontColor = [0 1 1];
            app.Label54.Position = [1014 325 132 29];
            app.Label54.Text = 'Diagrama S-N';

            % Create UITable14
            app.UITable14 = uitable(app.Tab4);
            app.UITable14.ColumnName = {'δx'; 'δy'; 'δz'; 'θx'; 'θy'; 'θz'; 'Esfuerzos Dinamicos'; 'Factores de seguridad'};
            app.UITable14.RowName = {};
            app.UITable14.FontName = 'Times';
            app.UITable14.Position = [39 31 765 143];

            % Create Button24
            app.Button24 = uibutton(app.Tab4, 'push');
            app.Button24.ButtonPushedFcn = createCallbackFcn(app, @Button24Pushed, true);
            app.Button24.BackgroundColor = [0 0 0];
            app.Button24.FontName = 'Times';
            app.Button24.FontSize = 14;
            app.Button24.FontColor = [0 1 1];
            app.Button24.Position = [39 398 170 33];
            app.Button24.Text = 'Máximos y Mínimos';

            % Create DropDown31
            app.DropDown31 = uidropdown(app.Tab4);
            app.DropDown31.Items = {'Von Misses', 'Tresca', 'Rankine'};
            app.DropDown31.FontName = 'Times';
            app.DropDown31.FontSize = 14;
            app.DropDown31.Position = [39 372 170 26];
            app.DropDown31.Value = 'Von Misses';

            % Create DropDown32
            app.DropDown32 = uidropdown(app.Tab4);
            app.DropDown32.Items = {'Soderberg', 'Goodman', 'ASME'};
            app.DropDown32.FontName = 'Times';
            app.DropDown32.FontSize = 14;
            app.DropDown32.Position = [39 346 170 26];
            app.DropDown32.Value = 'ASME';

            % Create Button25
            app.Button25 = uibutton(app.Tab4, 'push');
            app.Button25.ButtonPushedFcn = createCallbackFcn(app, @Button25Pushed, true);
            app.Button25.BackgroundColor = [0 0 0];
            app.Button25.FontName = 'Times';
            app.Button25.FontSize = 14;
            app.Button25.FontColor = [0 1 1];
            app.Button25.Position = [257 619 120 28];
            app.Button25.Text = 'Velocidad Crítica';

            % Create TextArea1
            app.TextArea1 = uitextarea(app.Tab4);
            app.TextArea1.FontName = 'Times';
            app.TextArea1.FontSize = 14;
            app.TextArea1.Position = [408 620 396 27];

            % Create Tab10
            app.Tab10 = uitab(app.TabGroup);
            app.Tab10.AutoResizeChildren = 'off';
            app.Tab10.Title = 'SIMULACION';
            app.Tab10.BackgroundColor = [0 0 0];

            % Create UIAxes16
            app.UIAxes16 = uiaxes(app.Tab10);
            title(app.UIAxes16, 'Simulacion 3D')
            ylabel(app.UIAxes16, 'Longitud del Eje')
            app.UIAxes16.View = [40 35];
            app.UIAxes16.PlotBoxAspectRatio = [1.70029189899063 1.52690062479871 1];
            app.UIAxes16.FontName = 'Times';
            app.UIAxes16.XColor = [0 1 1];
            app.UIAxes16.XTick = [];
            app.UIAxes16.XTickLabelRotation = 0;
            app.UIAxes16.YColor = [0 1 1];
            app.UIAxes16.YTick = [];
            app.UIAxes16.YTickLabelRotation = 0;
            app.UIAxes16.ZColor = [0 1 1];
            app.UIAxes16.ZTick = [];
            app.UIAxes16.ZTickLabelRotation = 0;
            app.UIAxes16.Color = [0 0 0];
            app.UIAxes16.GridColor = [0 1 1];
            app.UIAxes16.GridAlpha = 0.5;
            app.UIAxes16.XGrid = 'on';
            app.UIAxes16.YGrid = 'on';
            app.UIAxes16.ZGrid = 'on';
            app.UIAxes16.ColorOrder = [0.502 0.502 0.502];
            app.UIAxes16.NextPlot = 'add';
            app.UIAxes16.Position = [398 72 944 636];

            % Create Button26
            app.Button26 = uibutton(app.Tab10, 'push');
            app.Button26.ButtonPushedFcn = createCallbackFcn(app, @Button26Pushed, true);
            app.Button26.Icon = fullfile(pathToMLAPP, 'M5RSC', 'engrane.gif');
            app.Button26.FontName = 'Times';
            app.Button26.Position = [41 629 146 27];
            app.Button26.Text = 'Simulacion';

            % Create EscalaLabel
            app.EscalaLabel = uilabel(app.Tab10);
            app.EscalaLabel.FontName = 'Times';
            app.EscalaLabel.FontColor = [0 1 1];
            app.EscalaLabel.Position = [40 582 42 22];
            app.EscalaLabel.Text = 'Escala';

            % Create EditField31
            app.EditField31 = uieditfield(app.Tab10, 'numeric');
            app.EditField31.Limits = [1 Inf];
            app.EditField31.FontName = 'Times';
            app.EditField31.FontColor = [0 1 1];
            app.EditField31.BackgroundColor = [0 0 0];
            app.EditField31.Position = [122 582 65 22];
            app.EditField31.Value = 1;

            % Create FramesLabel
            app.FramesLabel = uilabel(app.Tab10);
            app.FramesLabel.FontName = 'Times';
            app.FramesLabel.FontColor = [0 1 1];
            app.FramesLabel.Position = [196 582 40 22];
            app.FramesLabel.Text = 'Frames';

            % Create EditField32
            app.EditField32 = uieditfield(app.Tab10, 'numeric');
            app.EditField32.Limits = [1 Inf];
            app.EditField32.FontName = 'Times';
            app.EditField32.FontColor = [0 1 1];
            app.EditField32.BackgroundColor = [0 0 0];
            app.EditField32.Position = [275 582 68 22];
            app.EditField32.Value = 1;

            % Create DropDown33
            app.DropDown33 = uidropdown(app.Tab10);
            app.DropDown33.Items = {'Desplazamientos', 'Esfuerzos'};
            app.DropDown33.FontName = 'Times';
            app.DropDown33.Position = [197 629 146 27];
            app.DropDown33.Value = 'Desplazamientos';

            % Create UITable15
            app.UITable15 = uitable(app.Tab10);
            app.UITable15.ColumnName = {'Criterio'};
            app.UITable15.RowName = {'Pendiente '; 'Deflexión '; 'F.S. Estatico '; 'F.S. Dinamico '; 'RPM criticó '; 'Horas de vida'};
            app.UITable15.FontName = 'Times';
            app.UITable15.Position = [43 246 302 164];

            % Create Button27
            app.Button27 = uibutton(app.Tab10, 'push');
            app.Button27.ButtonPushedFcn = createCallbackFcn(app, @Button27Pushed, true);
            app.Button27.Icon = fullfile(pathToMLAPP, 'M5RSC', 'Grabar.png');
            app.Button27.FontName = 'Times';
            app.Button27.Position = [41 533 302 27];
            app.Button27.Text = 'Grabar';

            % Create Slider1
            app.Slider1 = uislider(app.Tab10);
            app.Slider1.Limits = [-360 360];
            app.Slider1.ValueChangingFcn = createCallbackFcn(app, @Slider1ValueChanging, true);
            app.Slider1.FontName = 'Times';
            app.Slider1.FontColor = [0 1 1];
            app.Slider1.Position = [43 162 301 3];
            app.Slider1.Value = 35;

            % Create Slider2
            app.Slider2 = uislider(app.Tab10);
            app.Slider2.Limits = [-360 360];
            app.Slider2.ValueChangingFcn = createCallbackFcn(app, @Slider2ValueChanging, true);
            app.Slider2.FontName = 'Times';
            app.Slider2.FontColor = [0 1 1];
            app.Slider2.Position = [45 61 301 3];
            app.Slider2.Value = 10;

            % Create Label55
            app.Label55 = uilabel(app.Tab10);
            app.Label55.FontName = 'Times';
            app.Label55.FontSize = 25;
            app.Label55.FontColor = [0 1 1];
            app.Label55.Position = [42 680 128 33];
            app.Label55.Text = 'Simulación';

            % Create Label56
            app.Label56 = uilabel(app.Tab10);
            app.Label56.FontName = 'Times';
            app.Label56.FontSize = 15;
            app.Label56.FontColor = [0 1 1];
            app.Label56.Position = [45 435 186 22];
            app.Label56.Text = 'Cuadro resumen de resultados';

            % Create Label58
            app.Label58 = uilabel(app.Tab10);
            app.Label58.FontName = 'Times';
            app.Label58.FontSize = 15;
            app.Label58.FontColor = [0 1 1];
            app.Label58.Position = [165 91 62 22];
            app.Label58.Text = 'Elevation';

            % Create Label57
            app.Label57 = uilabel(app.Tab10);
            app.Label57.FontName = 'Times';
            app.Label57.FontSize = 15;
            app.Label57.FontColor = [0 1 1];
            app.Label57.Position = [167 196 60 22];
            app.Label57.Text = 'Azimuth';

            % Create Button28
            app.Button28 = uibutton(app.Tab10, 'push');
            app.Button28.ButtonPushedFcn = createCallbackFcn(app, @Button28Pushed, true);
            app.Button28.FontName = 'Times';
            app.Button28.Position = [41 487 69 23];
            app.Button28.Text = 'XY';

            % Create Button29
            app.Button29 = uibutton(app.Tab10, 'push');
            app.Button29.ButtonPushedFcn = createCallbackFcn(app, @Button29Pushed, true);
            app.Button29.FontName = 'Times';
            app.Button29.Position = [118 487 69 23];
            app.Button29.Text = 'YZ';

            % Create Button30
            app.Button30 = uibutton(app.Tab10, 'push');
            app.Button30.ButtonPushedFcn = createCallbackFcn(app, @Button30Pushed, true);
            app.Button30.FontName = 'Times';
            app.Button30.Position = [197 487 69 23];
            app.Button30.Text = 'ZX';

            % Create Button31
            app.Button31 = uibutton(app.Tab10, 'push');
            app.Button31.ButtonPushedFcn = createCallbackFcn(app, @Button31Pushed, true);
            app.Button31.FontName = 'Times';
            app.Button31.Position = [275 487 69 23];
            app.Button31.Text = 'XYZ';

            % Create ContextMenu1
            app.ContextMenu1 = uicontextmenu(app.UIFigure);

            % Create submenu11
            app.submenu11 = uimenu(app.ContextMenu1);
            app.submenu11.MenuSelectedFcn = createCallbackFcn(app, @submenu11Selected, true);
            app.submenu11.Text = 'Añadir Tramo';

            % Create submenu12
            app.submenu12 = uimenu(app.ContextMenu1);
            app.submenu12.MenuSelectedFcn = createCallbackFcn(app, @submenu12Selected, true);
            app.submenu12.Text = 'Eliminar Tramo';

            % Create submenu13
            app.submenu13 = uimenu(app.ContextMenu1);
            app.submenu13.MenuSelectedFcn = createCallbackFcn(app, @submenu13MenuSelected, true);
            app.submenu13.Text = 'Mismo Diametro Externo';

            % Create submenu14
            app.submenu14 = uimenu(app.ContextMenu1);
            app.submenu14.MenuSelectedFcn = createCallbackFcn(app, @submenu14MenuSelected, true);
            app.submenu14.Text = 'Mismo Diametro Interno';

            % Create submenu15
            app.submenu15 = uimenu(app.ContextMenu1);
            app.submenu15.MenuSelectedFcn = createCallbackFcn(app, @submenu15MenuSelected, true);
            app.submenu15.Text = 'Mismo Modulo E';

            % Create submenu16
            app.submenu16 = uimenu(app.ContextMenu1);
            app.submenu16.MenuSelectedFcn = createCallbackFcn(app, @submenu16MenuSelected, true);
            app.submenu16.Text = 'Mismo Modulo G';

            % Create submenu17
            app.submenu17 = uimenu(app.ContextMenu1);
            app.submenu17.MenuSelectedFcn = createCallbackFcn(app, @submenu17MenuSelected, true);
            app.submenu17.Text = 'Mismo Esfuerzo de Fluencia';

            % Create submenu18
            app.submenu18 = uimenu(app.ContextMenu1);
            app.submenu18.MenuSelectedFcn = createCallbackFcn(app, @submenu18MenuSelected, true);
            app.submenu18.Text = 'Mismo Esfuerzo de Rotura';

            % Create submenu19
            app.submenu19 = uimenu(app.ContextMenu1);
            app.submenu19.MenuSelectedFcn = createCallbackFcn(app, @submenu19MenuSelected, true);
            app.submenu19.Text = 'Misma Densidad';

            % Create submenu20
            app.submenu20 = uimenu(app.ContextMenu1);
            app.submenu20.MenuSelectedFcn = createCallbackFcn(app, @submenu20MenuSelected, true);
            app.submenu20.Text = 'Mismo N de elementos';
            
            % Assign app.ContextMenu1
            app.UITable1.ContextMenu = app.ContextMenu1;

            % Create ContextMenu2
            app.ContextMenu2 = uicontextmenu(app.UIFigure);

            % Create submenu21
            app.submenu21 = uimenu(app.ContextMenu2);
            app.submenu21.Text = 'Grilla';

            % Create submenu211
            app.submenu211 = uimenu(app.submenu21);
            app.submenu211.MenuSelectedFcn = createCallbackFcn(app, @submenu211Selected, true);
            app.submenu211.Text = 'Activar';

            % Create submenu212
            app.submenu212 = uimenu(app.submenu21);
            app.submenu212.MenuSelectedFcn = createCallbackFcn(app, @submenu212Selected, true);
            app.submenu212.Text = 'Desactivar';

            % Create submenu22
            app.submenu22 = uimenu(app.ContextMenu2);
            app.submenu22.Text = 'Nodos';

            % Create submenu221
            app.submenu221 = uimenu(app.submenu22);
            app.submenu221.MenuSelectedFcn = createCallbackFcn(app, @submenu221MenuSelected, true);
            app.submenu221.Text = 'Activar';

            % Create submenu222
            app.submenu222 = uimenu(app.submenu22);
            app.submenu222.MenuSelectedFcn = createCallbackFcn(app, @submenu222MenuSelected, true);
            app.submenu222.Text = 'Desactivar';

            % Create submenu23
            app.submenu23 = uimenu(app.ContextMenu2);
            app.submenu23.Text = 'Tramos';

            % Create submenu231
            app.submenu231 = uimenu(app.submenu23);
            app.submenu231.MenuSelectedFcn = createCallbackFcn(app, @submenu231MenuSelected, true);
            app.submenu231.Text = 'Activar';

            % Create submenu232
            app.submenu232 = uimenu(app.submenu23);
            app.submenu232.MenuSelectedFcn = createCallbackFcn(app, @submenu232MenuSelected, true);
            app.submenu232.Text = 'Desactivar';
            
            % Assign app.ContextMenu2
            app.UIAxes1.ContextMenu = app.ContextMenu2;

            % Create ContextMenu3
            app.ContextMenu3 = uicontextmenu(app.UIFigure);

            % Create submenu31
            app.submenu31 = uimenu(app.ContextMenu3);
            app.submenu31.MenuSelectedFcn = createCallbackFcn(app, @submenu31Selected, true);
            app.submenu31.Text = 'Activar Grilla';

            % Create submenu32
            app.submenu32 = uimenu(app.ContextMenu3);
            app.submenu32.MenuSelectedFcn = createCallbackFcn(app, @submenu32Selected, true);
            app.submenu32.Text = 'Desactivar Grilla';
            
            % Assign app.ContextMenu3
            app.UIAxes9.ContextMenu = app.ContextMenu3;

            % Create ContextMenu4
            app.ContextMenu4 = uicontextmenu(app.UIFigure);

            % Create submenu41
            app.submenu41 = uimenu(app.ContextMenu4);
            app.submenu41.MenuSelectedFcn = createCallbackFcn(app, @submenu41MenuSelected, true);
            app.submenu41.Text = 'Activar Grilla';

            % Create submenu42
            app.submenu42 = uimenu(app.ContextMenu4);
            app.submenu42.MenuSelectedFcn = createCallbackFcn(app, @submenu42MenuSelected, true);
            app.submenu42.Text = 'Desactivar Grilla';
            
            % Assign app.ContextMenu4
            app.UIAxes11.ContextMenu = app.ContextMenu4;

            % Create ContextMenu5
            app.ContextMenu5 = uicontextmenu(app.UIFigure);

            % Create submenu51
            app.submenu51 = uimenu(app.ContextMenu5);
            app.submenu51.MenuSelectedFcn = createCallbackFcn(app, @submenu51Selected, true);
            app.submenu51.Text = 'Mismo Acabado Superficial';
            
            % Assign app.ContextMenu5
            app.UITable5.ContextMenu = app.ContextMenu5;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Modulo5

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end