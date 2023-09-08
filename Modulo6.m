classdef Modulo6 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                 matlab.ui.Figure
        TabGroup                 matlab.ui.container.TabGroup
        Tab11                    matlab.ui.container.Tab
        Button9                  matlab.ui.control.Button
        DropDown5                matlab.ui.control.DropDown
        DropDown4                matlab.ui.control.DropDown
        DropDown3                matlab.ui.control.DropDown
        TextArea2                matlab.ui.control.TextArea
        MensajesLabel            matlab.ui.control.Label
        Switch1                  matlab.ui.control.Switch
        Tipodesuperficie2DLabel  matlab.ui.control.Label
        EditField4               matlab.ui.control.NumericEditField
        FramesEditFieldLabel     matlab.ui.control.Label
        EditField3               matlab.ui.control.NumericEditField
        EscalaLabel_2            matlab.ui.control.Label
        Spinner1                 matlab.ui.control.Spinner
        MallaLabel               matlab.ui.control.Label
        EditField2               matlab.ui.control.NumericEditField
        PuntosLabel              matlab.ui.control.Label
        EditField5               matlab.ui.control.NumericEditField
        LineasLabel              matlab.ui.control.Label
        Button7                  matlab.ui.control.Button
        Button6                  matlab.ui.control.Button
        Button5                  matlab.ui.control.Button
        Button4                  matlab.ui.control.Button
        Button2                  matlab.ui.control.Button
        UITable8                 matlab.ui.control.Table
        Button3                  matlab.ui.control.Button
        Button8                  matlab.ui.control.Button
        Label8                   matlab.ui.control.Label
        UITable7                 matlab.ui.control.Table
        UITable6                 matlab.ui.control.Table
        UIAxes2                  matlab.ui.control.UIAxes
        UIAxes3                  matlab.ui.control.UIAxes
        ContextMenu6             matlab.ui.container.ContextMenu
        submenu61                matlab.ui.container.Menu
        submenu62                matlab.ui.container.Menu
        submenu63                matlab.ui.container.Menu
        submenu64                matlab.ui.container.Menu
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            app.UITable8.Data                  = zeros(2,2);
            
        end

        % Button pushed function: Button8
        function Button8Pushed(app, event)
            
            [filename, pathname] = uigetfile({'*.png';'*.jpg'},'File Selector');
            fullpathname         = strcat(pathname, filename);
            
            if isequal(filename,0)
                app.TextArea2.Value = 'No ha sido seleccionada ninguna imagen';
            else
                app.TextArea2.Value = ['La imagen seleccionada es: ', filename];
                img1                = imread(fullpathname);
                imshow(img1,'Parent',app.UIAxes2)
            end
            
        end

        % Button pushed function: Button3
        function Button3Pushed(app, event)
            
            global x1 y1
            
            app.TextArea2.Value = 'Seleccione dos puntos en la imagen para establecer el sistema de escalamiento';
            x1 = zeros(2,1);
            y1 = zeros(2,1);
            for i = 1:2
                poi = drawpoint(app.UIAxes2,'Color','r');
                x1(i,1) = poi.Position(1);
                y1(i,1) = poi.Position(2);
                pause(1)
                delete(poi)
            end
            app.TextArea2.Value = 'Ingrese los pares coordenados seleccionados';
            
        end

        % Button pushed function: Button2
        function Button2Pushed(app, event)
            
            global pois
            
            pois     = num2cell(zeros(1,app.EditField5.Value*app.EditField2.Value));
            for i = 1:app.EditField5.Value*app.EditField2.Value
                pois{i} = ['poi_',num2str(i)];
                pois{i} = drawpoint(app.UIAxes2,'Color','c');
            end
            app.TextArea2.Value = 'Dibujo finalizado';
            
        end

        % Button pushed function: Button4
        function Button4Pushed(app, event)
            
            global pois x0 y0 x1 y1
            cla(app.UIAxes3)
            
            cor = [app.UITable8.Data(1,:);app.UITable8.Data(2,:)];
            x0  = zeros(app.EditField2.Value,app.EditField5.Value);
            y0  = zeros(app.EditField2.Value,app.EditField5.Value);
            k   = 0;
            for i = 1:app.EditField5.Value
                for j = 1:app.EditField2.Value
                    k = k + 1;
                    x0(j,i) = pois{k}.Position(1);
                    y0(j,i) = pois{k}.Position(2);
                end
                x0(:,i) = spline(x1, cor(:,1), x0(:,i));
                y0(:,i) = spline(y1, cor(:,2), y0(:,i));
            end
            
            if strcmp(app.Switch1.Value,'Cerrada')
                x0(end+1,:) = x0(1,:);
                y0(end+1,:) = y0(1,:);
            end
            
            plot(app.UIAxes3,x0,y0,'c')
            plot(app.UIAxes3,x0',y0','c')
            title(app.UIAxes3,'Aproximacion geometrica','Color',[0 1 1]);
            axis(app.UIAxes3,'equal')
            app.TextArea2.Value = 'Aproximacion geometrica finalizada';
            
        end

        % Button pushed function: Button5
        function Button5Pushed(app, event)
            
            global x0 y0 e fil col x_tra y_tra 
            cla(app.UIAxes3)
            
            if strcmp(app.Switch1.Value,'Cerrada')
                v1 = 0;
                x6 = [];
                y6 = [];
            elseif strcmp(app.Switch1.Value,'Abierta')
                v1 = -1;
            end
            
            x3 = num2cell(zeros(1,app.EditField2.Value + v1));
            x4 = zeros((app.Spinner1.Value+2)*(app.EditField2.Value + v1),app.EditField5.Value);
            y3 = num2cell(zeros(1,app.EditField2.Value + v1));
            y4 = zeros((app.Spinner1.Value+2)*(app.EditField2.Value + v1),app.EditField5.Value);
            for i = 1:app.EditField5.Value
                for j = 1:app.EditField2.Value + v1
                    if x0(j,i) == x0(j+1,i)
                        x3{j} = repelem(x0(j,i),app.Spinner1.Value+2)';
                        y3{j} = linspace(y0(j,i),y0(j+1,i),app.Spinner1.Value+2)';
                    else
                        x3{j} = linspace(x0(j,i),x0(j+1,i),app.Spinner1.Value+2)';
                        y3{j} = interp1([x0(j,i),x0(j+1,i)],[y0(j,i),y0(j+1,i)],x3{j});
                    end
                end
                x4(:,i) = cell2mat(x3');
                y4(:,i) = cell2mat(y3');
            end
            x4(app.Spinner1.Value+2:app.Spinner1.Value+2:size(x4,1) + v1,:) = [];
            y4(app.Spinner1.Value+2:app.Spinner1.Value+2:size(y4,1) + v1,:) = [];
            
            if strcmp(app.Switch1.Value,'Cerrada')
                x6(1,:) = x4(size(x4,1),:);
                x6(2,:) = x4(1,:);
                x6 = x6(:);
                y6(1,:) = y4(size(y4,1),:);
                y6(2,:) = y4(1,:);
                y6 = y6(:);
                plot(app.UIAxes3,x6,y6,'c')
            end
            
            plot(app.UIAxes3,x4,y4,'c')
            for i = 1:app.EditField5.Value-1
                x5 = x4(:,i:i+1)';
                x5 = x5(:);
                y5 = y4(:,i:i+1)';
                y5 = y5(:);
                plot(app.UIAxes3,x5,y5,'c')
            end
            text(app.UIAxes3,x4(:),y4(:),arrayfun(@num2str,1:numel(x4),'UniformOutput',0),'Color','yellow','FontSize',10)
            
            app.UITable6.Data = num2cell(zeros(numel(x4),7));
            Nodos = num2cell(zeros(1,numel(x4)));
            for i = 1:numel(x4)
                Nodos(i) = {['Nodo ',num2str(i)]};
            end
            app.UITable6.RowName = Nodos;
            app.UITable6.Data(:,1) = {'Definir'};
            app.UITable6.ColumnFormat(:,1) = ({{'Libre' 'Fijo'}});
            
            [fil, col] = size(y4);
            x_tra = x4(:);
            y_tra = y4(:);
            k  = 0;
            
            if strcmp(app.Switch1.Value,'Cerrada')
                x7 = [];
                e  = num2cell(zeros(1,fil*(2*(app.EditField5.Value-1))));
            elseif strcmp(app.Switch1.Value,'Abierta')
                e = num2cell(zeros(1,(app.EditField2.Value-1)*app.Spinner1.Value+(app.EditField2.Value-1)));
            end
            
            for i = 1:app.EditField5.Value-1
                for j = fil*(i-1)+1:fil*i-1
                    k = k + 1;
                    e{k}(1:3,1) = x_tra([j,j+1,j+fil]);
                    e{k}(1:3,2) = y_tra([j,j+1,j+fil]);
                    e{k}(1:3,3) = [j,j+1,j+fil];
                end
                for j = fil*(i)+1:fil*(i+1)-1
                    k = k + 1;
                    e{k}([2,1,3],1) = x_tra([j,j+1,j-(fil-1)]);
                    e{k}([2,1,3],2) = y_tra([j,j+1,j-(fil-1)]);
                    e{k}([2,1,3],3) = [j,j+1,j-(fil-1)];
                end
            end
            
            if strcmp(app.Switch1.Value,'Cerrada')
                x7(1,:) = linspace(fil,fil*col,col);
                x7(2,:) = linspace(1,fil*(col-1)+1,col);
                x7 = x7(:);
                for i = 1:2*(app.EditField5.Value-1)
                    k = k + 1;
                    if rem(i,2) ~= 0
                        e{k} = [x6(i:i+2),y6(i:i+2),x7(i:i+2)];
                    else
                        e{k} = [fliplr(x6(i:i+2)');fliplr(y6(i:i+2)');fliplr(x7(i:i+2)')]';
                    end
                end
            end
            
            app.UITable7.Data = zeros(numel(e),6);
            Elementos = num2cell(zeros(1,numel(e)));
            bcx       = zeros(1,numel(e));
            bcy       = zeros(1,numel(e));
            for i = 1:numel(e)
                Elementos(i) = {['Elemento ',num2str(i)]};
                bcx(i)       = mean(e{i}(:,1));
                bcy(i)       = mean(e{i}(:,2));
            end
            text(app.UIAxes3,bcx,bcy,arrayfun(@num2str,1:numel(e),'UniformOutput',0),'Color','red','FontSize',10,"HorizontalAlignment","center")
            app.UITable7.RowName = Elementos;
            title(app.UIAxes3,['Mallado nivel ',num2str(app.Spinner1.Value)],'Color',[0 1 1]);
            axis(app.UIAxes3,'equal')
            app.TextArea2.Value = 'Mallado finalizado';
            
        end

        % Button pushed function: Button6
        function Button6Pushed(app, event)
            
            global e fil col x_des2D y_des2D Esf_Cor2D Esf_No12D Esf_No22D Des_Xpr2D Des_Ypr2D Des_Mag2D Esf_VoM2D Fac_VoM2D
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Calculando esfuerzos y desplazamientos ...';pause(1)
            app.UITable6.Data(strcmp(app.UITable6.Data(:,1),'Definir'),1) = {'Libre'};
            Nod_Fij = 1:size(app.UITable6.Data,1);
            Nod_Fij = Nod_Fij(strcmp(app.UITable6.Data(:,1),'Fijo'));
            Fue_Nod = [cell2mat(app.UITable6.Data(:,2))';cell2mat(app.UITable6.Data(:,3))'];
            Fue_Nod = Fue_Nod(:);
            D = num2cell(zeros(1,numel(e)));
            B = num2cell(zeros(1,numel(e)));
            K = zeros(fil*col,fil*col,numel(e));
            for i = 1:numel(e)
                b1 = e{i}(2,2) - e{i}(3,2);
                b2 = e{i}(3,2) - e{i}(1,2);
                b3 = e{i}(1,2) - e{i}(2,2);
                a1 = e{i}(3,1) - e{i}(2,1);
                a2 = e{i}(1,1) - e{i}(3,1);
                a3 = e{i}(2,1) - e{i}(1,1);
                A  = abs((sum(e{i}(1:3,1).*[e{i}(2:3,2);e{i}(1,2)]) - sum([e{i}(2:3,1);e{i}(1,1)].*e{i}(1:3,2))) ./ 2);
                v  = app.UITable7.Data(i,1);
                D{i}  = app.UITable7.Data(i,2)/(1-v^2) .* [1 v 0;v 1 0;0 0 (1-v)/2];
                B{i}  = [b1 0 b2 0 b3 0;0 a1 0 a2 0 a3;a1 b1 a2 b2 a3 b3] ./ (2*A);
                k  = app.UITable7.Data(i,3) * A * B{i}' * D{i} * B{i};
                K([2*(e{i}(1,3))-1,2*(e{i}(1,3)),2*(e{i}(2,3))-1,2*(e{i}(2,3)),2*(e{i}(3,3))-1,2*(e{i}(3,3))],[2*(e{i}(1,3))-1,2*(e{i}(1,3)),2*(e{i}(2,3))-1,2*(e{i}(2,3)),2*(e{i}(3,3))-1,2*(e{i}(3,3))],i) = k;
            end
            K = sum(K,3);
            Fil_Col = 1:2*(fil*col);
            Fil_Col([Nod_Fij.*2-1,Nod_Fij.*2]) = [];
            Mat_Des = zeros(2*fil*col,1);
            opts.SYM = true;
            d = linsolve(K(Fil_Col,Fil_Col),Fue_Nod(Fil_Col,1),opts);
            Mat_Des(Fil_Col,1) = d;
            app.UITable6.Data(:,6:7) = num2cell(reshape(Mat_Des,2,size(Mat_Des,1)/2)');
            Mat_Fue = K * Mat_Des;
            app.UITable6.Data(:,4:5) = num2cell(reshape(Mat_Fue,2,size(Mat_Fue,1)/2)');
            x_des2D   = Mat_Des(1:2:2*fil*col,1);
            y_des2D   = Mat_Des(2:2:2*fil*col,1);
            Mat_Esf   = num2cell(zeros(1,numel(e)));
            Esf_Cor2D = zeros(1,numel(e));
            Esf_No12D = zeros(1,numel(e));
            Esf_No22D = zeros(1,numel(e));
            Des_Xpr2D = zeros(1,numel(e));
            Des_Ypr2D = zeros(1,numel(e));
            Des_Mag2D = zeros(1,numel(e));
            Esf_VoM2D = zeros(1,numel(e));
            Fac_VoM2D = zeros(1,numel(e));
            for i = 1:numel(e)
                Mat_Esf{i}   = D{i} * B{i} * Mat_Des([2*(e{i}(1,3))-1,2*(e{i}(1,3)),2*(e{i}(2,3))-1,2*(e{i}(2,3)),2*(e{i}(3,3))-1,2*(e{i}(3,3))]);
                Esf_Cor2D(i) = sqrt(((Mat_Esf{i}(1) - Mat_Esf{i}(2))/2)^2 + Mat_Esf{i}(3)^2);
                Esf_No12D(i) = abs((Mat_Esf{i}(1) + Mat_Esf{i}(2))/2 + Esf_Cor2D(i));
                Esf_No22D(i) = abs((Mat_Esf{i}(1) + Mat_Esf{i}(2))/2 - Esf_Cor2D(i));
                Des_Xpr2D(i) = mean(abs(x_des2D(e{i}(:,3))));
                Des_Ypr2D(i) = mean(abs(y_des2D(e{i}(:,3))));
                Des_Mag2D(i) = sqrt(Des_Xpr2D(i)^2 + Des_Ypr2D(i)^2);
                Esf_VoM2D(i) = sqrt((Esf_No12D(i)^2 + Esf_No22D(i)^2 + (Esf_No12D(i) - Esf_No22D(i))^2) / 2); 
                Fac_VoM2D(i) = app.UITable7.Data(i,4) / Esf_VoM2D(i); 
            end
            app.UITable7.Data(:,5) = Esf_VoM2D';
            app.UITable7.Data(:,6) = Fac_VoM2D';
            close(bar_pro)
            
        end

        % Button pushed function: Button9
        function Button9Pushed(app, event)
            
            global e x_tra y_tra x_des2D y_des2D Esf_Cor2D Esf_No12D Esf_No22D Des_Xpr2D Des_Ypr2D Des_Mag2D Esf_VoM2D
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Graficando','Indeterminate','on');
            bar_pro.Message = 'Graficando resultados ...';pause(1)
            cla(app.UIAxes3)
            X   = x_tra + x_des2D.*app.EditField3.Value;
            Y   = y_tra + y_des2D.*app.EditField3.Value;
            cmp = colormap(app.UIAxes3,'jet');
            switch app.DropDown5.Value
                case 'Desplazamientos'
                    switch app.DropDown3.Value
                        case 'Desplazamientos X'
                            Res_Sim = Des_Xpr2D;
                            Nom_Sim = 'Desplazamientos en X (m)';
                        case 'Desplazamientos Y'
                            Res_Sim = Des_Ypr2D;
                            Nom_Sim = 'Desplazamientos en Y (m)';
                        case 'Desplazamientos'
                            Res_Sim = Des_Mag2D;
                            Nom_Sim = 'Desplazamientos resultantes (m)';
                    end
                case 'Esfuerzos'
                    switch app.DropDown4.Value
                        case 'Normal maximo'
                            Res_Sim = Esf_No12D;
                            Nom_Sim = 'Esfuerzo normal maximo (Pa)';
                        case 'Normal minimo'
                            Res_Sim = Esf_No22D;
                            Nom_Sim = 'Esfuerzo normal minimo (Pa)';
                        case 'Cortante'
                            Res_Sim = Esf_Cor2D;
                            Nom_Sim = 'Esfuerzo cortante (Pa)';
                        case 'Von Misses'
                            Res_Sim = Esf_VoM2D;
                            Nom_Sim = 'Esfuerzo de Von Misses (Pa)';
                    end
            end
            title(app.UIAxes3,'Resultados','Color',[0 1 1]);
            cde = round(interp1([min(Res_Sim) max(Res_Sim)],[1 256],Res_Sim));
            bcx = zeros(1,numel(e));
            bcy = zeros(1,numel(e));
            for i = 1:numel(e)
                patch(app.UIAxes3,X(e{i}(:,3)),Y(e{i}(:,3)),cmp(cde(i),:))
                bcx(i) = mean(X(e{i}(:,3)));
                bcy(i) = mean(Y(e{i}(:,3)));
            end
            caxis(app.UIAxes3,[min(Res_Sim),max(Res_Sim)])
            cb = colorbar(app.UIAxes3,"east","AxisLocation","in","FontSize",10);
            cb.Ticks = linspace(min(Res_Sim),max(Res_Sim),10);
            cb.Label.String = Nom_Sim;
            cb.Color = [0 1 1];
            cb.TickDirection = 'out';
            text(app.UIAxes3,bcx,bcy,arrayfun(@num2str,1:numel(e),'UniformOutput',0),'Color','red','FontSize',10,"HorizontalAlignment","center")
            text(app.UIAxes3,X,Y,arrayfun(@num2str,1:numel(X),'UniformOutput',0),'Color','yellow','FontSize',10)
            axis(app.UIAxes3,'equal')
            close(bar_pro)
            
        end

        % Button pushed function: Button7
        function Button7Pushed(app, event)
            
            global e x_tra y_tra x_des2D y_des2D Esf_Cor2D Esf_No12D Esf_No22D Des_Xpr2D Des_Ypr2D Des_Mag2D Esf_VoM2D
            
            cmp = colormap(app.UIAxes3,'jet');
            switch app.DropDown5.Value
                case 'Desplazamientos'
                    switch app.DropDown3.Value
                        case 'Desplazamientos X'
                            Res_Sim = Des_Xpr2D;
                            Nom_Sim = 'Desplazamientos en X (m)';
                        case 'Desplazamientos Y'
                            Res_Sim = Des_Ypr2D;
                            Nom_Sim = 'Desplazamientos en Y (m)';
                        case 'Desplazamientos'
                            Res_Sim = Des_Mag2D;
                            Nom_Sim = 'Desplazamientos resultantes (m)';
                    end
                case 'Esfuerzos'
                    switch app.DropDown4.Value
                        case 'Normal maximo'
                            Res_Sim = Esf_No12D;
                            Nom_Sim = 'Esfuerzo normal maximo (Pa)';
                        case 'Normal minimo'
                            Res_Sim = Esf_No22D;
                            Nom_Sim = 'Esfuerzo normal minimo (Pa)';
                        case 'Cortante'
                            Res_Sim = Esf_Cor2D;
                            Nom_Sim = 'Esfuerzo cortante (Pa)';
                        case 'Von Misses'
                            Res_Sim = Esf_VoM2D;
                            Nom_Sim = 'Esfuerzo de Von Misses (Pa)';
                    end
            end
            caxis(app.UIAxes3,[min(Res_Sim),max(Res_Sim)])
            cb = colorbar(app.UIAxes3,"east","AxisLocation","in","FontSize",10);            
            cb.Label.String = Nom_Sim;
            cb.Ticks = linspace(min(Res_Sim),max(Res_Sim),10);
            cb.Color = [0 1 1];
            cde   = round(interp1([min(Res_Sim) max(Res_Sim)],[1 256],Res_Sim));
            frame = 0;
            title(app.UIAxes3,'Simulacion','Color',[0 1 1]);
            frames = app.EditField4.Value;
            for j = repmat([linspace(0,app.EditField3.Value,frames) linspace(app.EditField3.Value,0,frames)],1,1)
                cla(app.UIAxes3)
                X = x_tra + x_des2D.*j;
                Y = y_tra + y_des2D.*j;
                for i = 1:numel(e)
                    patch(app.UIAxes3,X(e{i}(:,3)),Y(e{i}(:,3)),cmp(cde(i),:))
                end
                drawnow
                axis(app.UIAxes3,'equal')
                frame = frame + 1;
                app.EditField4.Value = frame;
            end
            
        end

        % Menu selected function: submenu61
        function submenu61MenuSelected(app, event)
           
            app.UITable7.Data(:,1) = app.UITable7.Data(1,1);
            
        end

        % Menu selected function: submenu62
        function submenu62MenuSelected(app, event)
            
            app.UITable7.Data(:,2) = app.UITable7.Data(1,2);
            
        end

        % Menu selected function: submenu63
        function submenu63MenuSelected(app, event)
            
            app.UITable7.Data(:,3) = app.UITable7.Data(1,3);
            
        end

        % Menu selected function: submenu64
        function submenu64MenuSelected(app, event)
            
            app.UITable7.Data(:,4) = app.UITable7.Data(1,4);
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

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

            % Create Tab11
            app.Tab11 = uitab(app.TabGroup);
            app.Tab11.AutoResizeChildren = 'off';
            app.Tab11.Title = 'MODULO 6';
            app.Tab11.BackgroundColor = [0 0 0];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.Tab11);
            app.UIAxes3.PlotBoxAspectRatio = [1.0178970917226 1 1];
            app.UIAxes3.FontName = 'Times';
            app.UIAxes3.XColor = 'none';
            app.UIAxes3.XTick = [];
            app.UIAxes3.XTickLabelRotation = 0;
            app.UIAxes3.YColor = 'none';
            app.UIAxes3.YTick = [];
            app.UIAxes3.YTickLabelRotation = 0;
            app.UIAxes3.ZTickLabelRotation = 0;
            app.UIAxes3.Color = [0 0 0];
            app.UIAxes3.NextPlot = 'add';
            app.UIAxes3.Position = [856 216 465 457];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.Tab11);
            app.UIAxes2.PlotBoxAspectRatio = [1.0178970917226 1 1];
            app.UIAxes2.FontName = 'Times';
            app.UIAxes2.XColor = 'none';
            app.UIAxes2.XTick = [];
            app.UIAxes2.XTickLabelRotation = 0;
            app.UIAxes2.YColor = 'none';
            app.UIAxes2.YTick = [];
            app.UIAxes2.YTickLabelRotation = 0;
            app.UIAxes2.ZTickLabelRotation = 0;
            app.UIAxes2.Color = [0 0 0];
            app.UIAxes2.Position = [351 217 465 457];

            % Create UITable6
            app.UITable6 = uitable(app.Tab11);
            app.UITable6.ColumnName = {'Apoyo'; 'Fuerza X'; 'Fuerza Y'; 'Reaccion X'; 'Reaccion Y'; 'Desplazamiento X'; 'Desplazamiento Y'};
            app.UITable6.RowName = {};
            app.UITable6.ColumnEditable = [true true true false false false false];
            app.UITable6.FontName = 'Times';
            app.UITable6.Position = [39 30 620 166];

            % Create UITable7
            app.UITable7 = uitable(app.Tab11);
            app.UITable7.ColumnName = {'Poisson'; 'Elasticidad'; 'Espesor'; 'Fluencia'; 'Esfuerzo de Von Misses'; 'Factor de Seguridad'};
            app.UITable7.RowName = {};
            app.UITable7.ColumnEditable = [true true true true false false];
            app.UITable7.FontName = 'Times';
            app.UITable7.Position = [703 32 620 164];

            % Create Label8
            app.Label8 = uilabel(app.Tab11);
            app.Label8.FontName = 'Times';
            app.Label8.FontSize = 25;
            app.Label8.FontColor = [0 1 1];
            app.Label8.Position = [42 678 557 33];
            app.Label8.Text = 'Análisis de elementos bidimensionales de transmisión';

            % Create Button8
            app.Button8 = uibutton(app.Tab11, 'push');
            app.Button8.ButtonPushedFcn = createCallbackFcn(app, @Button8Pushed, true);
            app.Button8.BackgroundColor = [0 0 0];
            app.Button8.FontName = 'Times';
            app.Button8.FontColor = [0 1 1];
            app.Button8.Position = [39 585 100 23];
            app.Button8.Text = 'Imagen';

            % Create Button3
            app.Button3 = uibutton(app.Tab11, 'push');
            app.Button3.ButtonPushedFcn = createCallbackFcn(app, @Button3Pushed, true);
            app.Button3.BackgroundColor = [0 0 0];
            app.Button3.FontName = 'Times';
            app.Button3.FontColor = [0 1 1];
            app.Button3.Position = [39 557 100 23];
            app.Button3.Text = 'Escalar';

            % Create UITable8
            app.UITable8 = uitable(app.Tab11);
            app.UITable8.ColumnName = {'X (m)'; 'Y (m)'};
            app.UITable8.RowName = {'P1'; 'P2'};
            app.UITable8.ColumnEditable = true;
            app.UITable8.FontName = 'Times';
            app.UITable8.Position = [171 559 169 97];

            % Create Button2
            app.Button2 = uibutton(app.Tab11, 'push');
            app.Button2.ButtonPushedFcn = createCallbackFcn(app, @Button2Pushed, true);
            app.Button2.BackgroundColor = [0 0 0];
            app.Button2.FontName = 'Times';
            app.Button2.FontColor = [0 1 1];
            app.Button2.Position = [200 507 140 23];
            app.Button2.Text = 'Dibujar';

            % Create Button4
            app.Button4 = uibutton(app.Tab11, 'push');
            app.Button4.ButtonPushedFcn = createCallbackFcn(app, @Button4Pushed, true);
            app.Button4.BackgroundColor = [0 0 0];
            app.Button4.FontName = 'Times';
            app.Button4.FontColor = [0 1 1];
            app.Button4.Position = [200 463 140 23];
            app.Button4.Text = 'Aproximar';

            % Create Button5
            app.Button5 = uibutton(app.Tab11, 'push');
            app.Button5.ButtonPushedFcn = createCallbackFcn(app, @Button5Pushed, true);
            app.Button5.BackgroundColor = [0 0 0];
            app.Button5.FontName = 'Times';
            app.Button5.FontColor = [0 1 1];
            app.Button5.Position = [200 424 140 23];
            app.Button5.Text = 'Mallar';

            % Create Button6
            app.Button6 = uibutton(app.Tab11, 'push');
            app.Button6.ButtonPushedFcn = createCallbackFcn(app, @Button6Pushed, true);
            app.Button6.BackgroundColor = [0 0 0];
            app.Button6.FontName = 'Times';
            app.Button6.FontColor = [0 1 1];
            app.Button6.Position = [200 382 140 23];
            app.Button6.Text = 'Analizar';

            % Create Button7
            app.Button7 = uibutton(app.Tab11, 'push');
            app.Button7.ButtonPushedFcn = createCallbackFcn(app, @Button7Pushed, true);
            app.Button7.BackgroundColor = [0 0 0];
            app.Button7.FontName = 'Times';
            app.Button7.FontColor = [0 1 1];
            app.Button7.Position = [200 258 140 23];
            app.Button7.Text = 'Simular';

            % Create LineasLabel
            app.LineasLabel = uilabel(app.Tab11);
            app.LineasLabel.FontName = 'Times';
            app.LineasLabel.FontColor = [0 1 1];
            app.LineasLabel.Position = [39 509 104 23];
            app.LineasLabel.Text = {'Lineas'; ''};

            % Create EditField5
            app.EditField5 = uieditfield(app.Tab11, 'numeric');
            app.EditField5.FontName = 'Times';
            app.EditField5.FontColor = [0 1 1];
            app.EditField5.BackgroundColor = [0 0 0];
            app.EditField5.Position = [109 508 70 22];

            % Create PuntosLabel
            app.PuntosLabel = uilabel(app.Tab11);
            app.PuntosLabel.FontName = 'Times';
            app.PuntosLabel.FontColor = [0 1 1];
            app.PuntosLabel.Position = [39 466 106 23];
            app.PuntosLabel.Text = 'Puntos';

            % Create EditField2
            app.EditField2 = uieditfield(app.Tab11, 'numeric');
            app.EditField2.FontName = 'Times';
            app.EditField2.FontColor = [0 1 1];
            app.EditField2.BackgroundColor = [0 0 0];
            app.EditField2.Position = [109 464 70 22];

            % Create MallaLabel
            app.MallaLabel = uilabel(app.Tab11);
            app.MallaLabel.FontName = 'Times';
            app.MallaLabel.FontColor = [0 1 1];
            app.MallaLabel.Position = [39 424 77 23];
            app.MallaLabel.Text = 'Malla';

            % Create Spinner1
            app.Spinner1 = uispinner(app.Tab11);
            app.Spinner1.Limits = [0 5];
            app.Spinner1.FontName = 'Times';
            app.Spinner1.FontColor = [0 1 1];
            app.Spinner1.BackgroundColor = [0 0 0];
            app.Spinner1.Position = [109 425 70 22];

            % Create EscalaLabel_2
            app.EscalaLabel_2 = uilabel(app.Tab11);
            app.EscalaLabel_2.FontName = 'Times';
            app.EscalaLabel_2.FontColor = [0 1 1];
            app.EscalaLabel_2.Position = [38 300 42 22];
            app.EscalaLabel_2.Text = 'Escala';

            % Create EditField3
            app.EditField3 = uieditfield(app.Tab11, 'numeric');
            app.EditField3.FontName = 'Times';
            app.EditField3.FontColor = [0 1 1];
            app.EditField3.BackgroundColor = [0 0 0];
            app.EditField3.Position = [109 300 70 22];

            % Create FramesEditFieldLabel
            app.FramesEditFieldLabel = uilabel(app.Tab11);
            app.FramesEditFieldLabel.FontName = 'Times';
            app.FramesEditFieldLabel.FontColor = [0 1 1];
            app.FramesEditFieldLabel.Position = [39 259 40 22];
            app.FramesEditFieldLabel.Text = 'Frames';

            % Create EditField4
            app.EditField4 = uieditfield(app.Tab11, 'numeric');
            app.EditField4.FontName = 'Times';
            app.EditField4.FontColor = [0 1 1];
            app.EditField4.BackgroundColor = [0 0 0];
            app.EditField4.Position = [109 258 70 22];

            % Create Tipodesuperficie2DLabel
            app.Tipodesuperficie2DLabel = uilabel(app.Tab11);
            app.Tipodesuperficie2DLabel.HorizontalAlignment = 'center';
            app.Tipodesuperficie2DLabel.FontName = 'Times';
            app.Tipodesuperficie2DLabel.FontColor = [0 1 1];
            app.Tipodesuperficie2DLabel.Position = [37 641 110 22];
            app.Tipodesuperficie2DLabel.Text = 'Tipo de superficie 2D';

            % Create Switch1
            app.Switch1 = uiswitch(app.Tab11, 'slider');
            app.Switch1.Items = {'Abierta', 'Cerrada'};
            app.Switch1.FontName = 'Times';
            app.Switch1.FontColor = [0 1 1];
            app.Switch1.Position = [64 616 49 21];
            app.Switch1.Value = 'Abierta';

            % Create MensajesLabel
            app.MensajesLabel = uilabel(app.Tab11);
            app.MensajesLabel.FontName = 'Times';
            app.MensajesLabel.FontColor = [0 1 1];
            app.MensajesLabel.Position = [39 217 100 22];
            app.MensajesLabel.Text = 'Mensajes';

            % Create TextArea2
            app.TextArea2 = uitextarea(app.Tab11);
            app.TextArea2.FontName = 'Times';
            app.TextArea2.FontColor = [0 1 1];
            app.TextArea2.BackgroundColor = [0 0 0];
            app.TextArea2.Position = [109 217 232 22];

            % Create DropDown3
            app.DropDown3 = uidropdown(app.Tab11);
            app.DropDown3.Items = {'Desplazamientos', 'Desplazamientos X', 'Desplazamientos Y'};
            app.DropDown3.FontName = 'Times';
            app.DropDown3.Position = [39 383 140 22];
            app.DropDown3.Value = 'Desplazamientos';

            % Create DropDown4
            app.DropDown4 = uidropdown(app.Tab11);
            app.DropDown4.Items = {'Normal maximo', 'Normal minimo', 'Cortante', 'Von Misses'};
            app.DropDown4.FontName = 'Times';
            app.DropDown4.Position = [39 342 140 22];
            app.DropDown4.Value = 'Normal maximo';

            % Create DropDown5
            app.DropDown5 = uidropdown(app.Tab11);
            app.DropDown5.Items = {'Desplazamientos', 'Esfuerzos'};
            app.DropDown5.FontName = 'Times';
            app.DropDown5.Position = [200 342 140 22];
            app.DropDown5.Value = 'Desplazamientos';

            % Create Button9
            app.Button9 = uibutton(app.Tab11, 'push');
            app.Button9.ButtonPushedFcn = createCallbackFcn(app, @Button9Pushed, true);
            app.Button9.BackgroundColor = [0 0 0];
            app.Button9.FontName = 'Times';
            app.Button9.FontColor = [0 1 1];
            app.Button9.Position = [200 301 140 23];
            app.Button9.Text = 'Graficar';

            % Create ContextMenu6
            app.ContextMenu6 = uicontextmenu(app.UIFigure);

            % Create submenu61
            app.submenu61 = uimenu(app.ContextMenu6);
            app.submenu61.MenuSelectedFcn = createCallbackFcn(app, @submenu61MenuSelected, true);
            app.submenu61.Text = 'Mismo modulo de Poisson';

            % Create submenu62
            app.submenu62 = uimenu(app.ContextMenu6);
            app.submenu62.MenuSelectedFcn = createCallbackFcn(app, @submenu62MenuSelected, true);
            app.submenu62.Text = 'Mismo modulo de Elasticidad';

            % Create submenu63
            app.submenu63 = uimenu(app.ContextMenu6);
            app.submenu63.MenuSelectedFcn = createCallbackFcn(app, @submenu63MenuSelected, true);
            app.submenu63.Text = 'Mismo Espesor';

            % Create submenu64
            app.submenu64 = uimenu(app.ContextMenu6);
            app.submenu64.MenuSelectedFcn = createCallbackFcn(app, @submenu64MenuSelected, true);
            app.submenu64.Text = 'Mismo esfuerzo de Fluencia';
            
            % Assign app.ContextMenu6
            app.UITable7.ContextMenu = app.ContextMenu6;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Modulo6

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