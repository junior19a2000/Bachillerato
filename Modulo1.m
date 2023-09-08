classdef Modulo1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        TabGroup                      matlab.ui.container.TabGroup
        Tab6                          matlab.ui.container.Tab
        Switch2                       matlab.ui.control.Switch
        SentidodegiroLabel            matlab.ui.control.Label
        DropDown16                    matlab.ui.control.DropDown
        RecubrimientoDropDownLabel    matlab.ui.control.Label
        Label40                       matlab.ui.control.Label
        Image16                       matlab.ui.control.Image
        DropDown15                    matlab.ui.control.DropDown
        TipodeMotorLabel              matlab.ui.control.Label
        Label39                       matlab.ui.control.Label
        Label38                       matlab.ui.control.Label
        Button15                      matlab.ui.control.Button
        Image15                       matlab.ui.control.Image
        Label37                       matlab.ui.control.Label
        Label36                       matlab.ui.control.Label
        UITable11                     matlab.ui.control.Table
        Label35                       matlab.ui.control.Label
        Label34                       matlab.ui.control.Label
        Label33                       matlab.ui.control.Label
        EditField66                   matlab.ui.control.NumericEditField
        C4Label                       matlab.ui.control.Label
        EditField65                   matlab.ui.control.NumericEditField
        Fu_nomLabel                   matlab.ui.control.Label
        EditField64                   matlab.ui.control.NumericEditField
        FuLabel                       matlab.ui.control.Label
        EditField63                   matlab.ui.control.NumericEditField
        DistanciaentreCentrosDVLabel  matlab.ui.control.Label
        EditField62                   matlab.ui.control.NumericEditField
        DistanciaentreCentrosDHLabel  matlab.ui.control.Label
        EditField61                   matlab.ui.control.NumericEditField
        DiametrodelaPoleaMenorLabel   matlab.ui.control.Label
        EditField60                   matlab.ui.control.NumericEditField
        DiametrodelaPoleaMayorLabel   matlab.ui.control.Label
        EditField59                   matlab.ui.control.NumericEditField
        RPMLabel                      matlab.ui.control.Label
        EditField58                   matlab.ui.control.NumericEditField
        PotenciaLabel                 matlab.ui.control.Label
        Image14                       matlab.ui.control.Image
        Image13                       matlab.ui.control.Image
        Image12                       matlab.ui.control.Image
        Button14                      matlab.ui.control.Button
        DropDown14                    matlab.ui.control.DropDown
        GamaLabel                     matlab.ui.control.Label
        UIAxes12                      matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            I1 = imshow('M1RSC/Poliamida_Lamina.png','Parent',app.UIAxes12);
            app.UIAxes12.XLim = [0 I1.XData(2)];
            app.UIAxes12.YLim = [0 I1.YData(2)];

            app.UITable11.Data                 = zeros(21,1);
            app.UITable11.RowName              = {'Angulo de Contacto de la Polea Menor (º)', 'Angulo de Contacto de la Polea Menor (º)', 'Velocidad de la Correa (m/s)',...
                'Fuerza Tangencia a transmitir (N)', 'Factor de Funcionamiento', 'Fuerza de Referencia (N)', 'Ancho de la correa plana (mm)',...
                'Ancho de las Poleas (mm)', 'Longitud total de la Correa (mm)', 'Elongacion extra para fuerza centrifuga (%)', 'Elongacion de montaje (%)',...
                'Fuerza Estatica (N)', 'Fuerza Dinamica (N)', 'Fuerza de Arranque (N)', 'Fuerza en el ramal con Traccion (N)', 'Fuerza en el ramal sin traccion (N)',...
                'Angulo de Desfase (º)', 'Fx (N)', 'Fy (N)', 'Fz (N)', 'Mx (N.m)'};
            
        end

        % Value changed function: DropDown14
        function DropDown14ValueChanged(app, event)
            
            switch app.DropDown14.Value
                case 'Poliamida Lamina'
                    app.DropDown16.Items = {'Elastómero' 'Cuero al cromo' 'Novo' 'High/Medium Grip' 'Tejido' 'Poliuretano'};
                    I = imshow('M1RSC/Poliamida_Lamina.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                    app.Image15.ImageSource = 'M1RSC/GamaPoliamida.png';
                    app.Image16.ImageSource = 'M1RSC/G.png';
                case 'Poliester Tejido'
                    app.DropDown16.Items = {'Elastómero' 'Novo' 'High/Medium Grip' 'Tejido' 'Poliuretano'};
                    I = imshow('M1RSC/Poliester_Tejido.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                    app.Image15.ImageSource = 'M1RSC/GamaPoliester.png';
                    app.Image16.ImageSource = 'M1RSC/G.png';
                case 'Poliester Cuerda'
                    app.DropDown16.Items = {'Elastómero' 'Cuero al cromo' 'Tejido' 'Poliuretano'};
                    I = imshow('M1RSC/Poliester_Cuerda.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                    app.Image15.ImageSource = 'M1RSC/GamaPoliester.png';
                    app.Image16.ImageSource = 'M1RSC/G.png';
                case 'Aramida Tejido'
                    app.DropDown16.Items = {'Elastómero' 'Poliuretano'};
                    I = imshow('M1RSC/Aramida_Tejido.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                    app.Image15.ImageSource = 'M1RSC/GamaAramida.png';
                    app.Image16.ImageSource = 'M1RSC/G.png';
                case 'Aramida Cuerda'
                    app.DropDown16.Items = {'Elastómero' 'Cuero al cromo' 'Tejido'};
                    I = imshow('M1RSC/Aramida_Cuerda.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                    app.Image15.ImageSource = 'M1RSC/GamaAramida.png';
                    app.Image16.ImageSource = 'M1RSC/G.png';
            end
            
        end

        % Button pushed function: Button14
        function Button14Pushed(app, event)
            
            cla(app.UIAxes12)
            app.EditField64.BackgroundColor = [1 1 1];
            app.EditField64.FontColor       = [0 0 0];
            app.EditField65.BackgroundColor = [1 1 1];
            app.EditField65.FontColor       = [0 0 0];
            app.EditField66.BackgroundColor = [1 1 1];
            app.EditField66.FontColor       = [0 0 0];
            B1 = 2 * acosd((app.EditField60.Value - app.EditField61.Value)/(2 * sqrt(app.EditField62.Value^2 + app.EditField63.Value^2)));
            
            switch app.DropDown14.Value
                case 'Poliamida Lamina'
                    I = imshow('M1RSC/Poliamida_Lamina.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                case 'Poliester Tejido'
                    I = imshow('M1RSC/Poliester_Tejido.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                case 'Poliester Cuerda'
                    I = imshow('M1RSC/Poliester_Cuerda.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                case 'Aramida Tejido'
                    I = imshow('M1RSC/Aramida_Tejido.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
                case 'Aramida Cuerda'
                    I = imshow('M1RSC/Aramida_Cuerda.png','Parent',app.UIAxes12);
                    app.UIAxes12.XLim = [0 I.XData(2)];
                    app.UIAxes12.YLim = [0 I.YData(2)];
            end
            hold(app.UIAxes12,'On')
            for i = 1:3
                cor_pun = drawpoint(app.UIAxes12,'Color','r');
                xco_pun = cor_pun.Position(1);
                yco_pun = cor_pun.Position(2);
                if i == 1
                    plot(app.UIAxes12,[xco_pun,xco_pun],[30 540],'-r')
                    cor_pun.Label = ['Haga click en el angulo ',num2str(B1),'º'];
                elseif i == 2
                    plot(app.UIAxes12,[50,920],[yco_pun,yco_pun],'-r')
                    cor_pun.Label = 'Click en la interseccion a la derecha';
                else
                    plot(app.UIAxes12,[xco_pun,xco_pun],[30 540],'-r')
                    cor_pun.Label = 'Ingrese F''u, F''u_nom y c4 en los cuadros de negro';
                    app.EditField64.BackgroundColor = [0 0 0];
                    app.EditField64.FontColor       = [0 1 1];
                    app.EditField65.BackgroundColor = [0 0 0];
                    app.EditField65.FontColor       = [0 1 1];
                    app.EditField66.BackgroundColor = [0 0 0];
                    app.EditField66.FontColor       = [0 1 1];
                end
            end
            
        end

        % Button pushed function: Button15
        function Button15Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Calculando';pause(2)
            
            B1 = 2 * acosd((app.EditField60.Value - app.EditField61.Value)/(2 * sqrt(app.EditField62.Value^2 + app.EditField63.Value^2)));
            B2 = 2 * acosd((app.EditField61.Value - app.EditField60.Value)/(2 * sqrt(app.EditField62.Value^2 + app.EditField63.Value^2)));
            v  = (pi * app.EditField61.Value * app.EditField59.Value) / 60000;
            Fu = (app.EditField58.Value * 1000) / v;
            
            FS = find(strcmp(app.DropDown15.Items,app.DropDown15.Value) == 1);
            if FS == 1
                C2 = 1;
            elseif FS == 7
                C2 = 1.7;
            else
                C2 = 1.3;
            end
            
            Fb = Fu * C2;
            b0 = [20:5:100 120:20:220 250 280 300 320 350 380 400:50:800 900 1000];
            bo = Fb / app.EditField64.Value;
            bo = b0(find(b0 > bo,1));
            b  = interp1(b0,...
                [25 32 40 40 50 50 63 63 71 71 80 90 90 100 100 112 112 140 160 180 200:25:250,...
                280 315 315 355 400 400 450 500 560 630 630 710 800 800 900 1000 1120],bo,'spline');
            L  = pi/360 * (app.EditField61.Value * B1 + app.EditField60.Value * B2) + 2 * sqrt(app.EditField62.Value^2 + app.EditField63.Value^2 - ((app.EditField60.Value - app.EditField61.Value)^2)/4);
            
            switch app.DropDown14.Value
                case 'Poliamida Lamina'
                    Ci = 2.2;
                    switch app.DropDown16.Value
                        case 'Elastómero'
                            x = 20:10:70;
                            y = [6 10 14 20 28 40 54 80];
                            z = [0.2 0.3 0.7 1 1 1.1;...
                                0.2 0.3 0.6 0.9 1 1.1;...
                                0.1 0.3 0.5 0.8 1 1.1;...
                                0.1 0.3 0.4 0.7 1 1;...
                                0.1 0.2 0.4 0.6 0.8 1;...
                                0.1 0.2 0.3 0.5 0.7 1;...
                                0.1 0.2 0.3 0.5 0.7 0.9;...
                                0.1 0.2 0.3 0.4 0.6 0.8];
                        otherwise
                            x = 20:10:70;
                            y = [6 10 14 20 28 40 54 65 80];
                            z = [0.3 0.6 1 1 1.1 1.2;...
                                0.2 0.5 0.8 1 1 1.1;...
                                0.2 0.4 0.6 1 1 1.1;...
                                0.1 0.3 0.5 0.9 1 1;...
                                0.1 0.2 0.4 0.7 0.9 1;...
                                0.1 0.2 0.3 0.6 0.8 1;...
                                0.1 0.2 0.3 0.5 0.8 1;...
                                0.1 0.2 0.3 0.5 0.7 0.9;...
                                0.1 0.2 0.3 0.5 0.7 0.9];
                    end
                case 'Poliester Tejido'
                    Ci = 1.8;
                    x = 30:10:50;
                    y = [6 10 15 20 25 30 40];
                    z = repmat([0.1 0.15 0.2],7,1);
                case 'Poliester Cuerda'
                    Ci = 1.5;
                    switch app.DropDown16.Value
                        case 'Elastómero'
                            x = 40:10:60;
                            y = [10 14 20 28 40];
                            z = repmat([0.1 0.2 0.3],5,1);
                        case 'Poliuretano'
                            x = 40:10:60;
                            y = [10 14 20 28 40];
                            z = repmat([0.1 0.2 0.3],5,1);
                        otherwise
                            x = 30:10:60;
                            y = [10 14 20 28 40];
                            z = repmat([0.1 0.15 0.2 0.25],5,1);
                    end
                case 'Aramida Tejido'
                    Ci = 1.4;
                    x  = [40 50];
                    y  = [15 25 40];
                    z  = repmat(0.05,3,2);
                case 'Aramida Cuerda'
                    Ci = 1.5;
                    x  = [40 50 60];
                    y  = [54 80];
                    z  = repmat([0.05 0.05 0.1],2,1);
            end
            C5  = interp2(x,y,z,v,app.EditField65.Value);
            
            e   = C5 + app.EditField66.Value;
            Fwe = app.EditField65.Value * e * bo;
            Fwd = app.EditField66.Value * app.EditField65.Value * bo;
            Fwi = Ci * Fwe;
            Frc = (Fwe + Fu)/2;
            Frs = (Fwe - Fu)/2;
            phi = (360 - B2)/2;
            rho = acosd(app.EditField62.Value / (sqrt(app.EditField62.Value^2 + app.EditField63.Value^2)));
            bet = 90 + rho - phi;
            alf = 2 * rho - bet;
            
            switch app.Switch2.Value
                case 'Horario'
                    Fy = Frc * cosd(alf) + Frs * cosd(bet);
                    Fz = Frc * sind(alf) + Frs * sind(bet);
                case 'Antihorario'
                    Fy = Frc * cosd(bet) + Frs * cosd(alf);
                    Fz = Frc * sind(bet) + Frs * sind(alf);
            end
            Tx = (Frc - Frs) * app.EditField60.Value / 2000;
            
            app.UITable11.Data(1,1)  = B1;
            app.UITable11.Data(2,1)  = B2;
            app.UITable11.Data(3,1)  = v;
            app.UITable11.Data(4,1)  = Fu;
            app.UITable11.Data(5,1)  = C2;
            app.UITable11.Data(6,1)  = Fb;
            app.UITable11.Data(7,1)  = bo;
            app.UITable11.Data(8,1)  = b;
            app.UITable11.Data(9,1)  = L;
            app.UITable11.Data(10,1) = C5;
            app.UITable11.Data(11,1) = e;
            app.UITable11.Data(12,1) = Fwe;
            app.UITable11.Data(13,1) = Fwd;
            app.UITable11.Data(14,1) = Fwi;
            app.UITable11.Data(15,1) = Frc;
            app.UITable11.Data(16,1) = Frs;
            app.UITable11.Data(17,1) = rho;
            app.UITable11.Data(18,1) = 0;
            app.UITable11.Data(19,1) = Fy;
            app.UITable11.Data(20,1) = Fz;
            app.UITable11.Data(21,1) = Tx;
            
            bar_pro.Message = 'Calculo finalizado exitosamente';pause(2)
            close(bar_pro)

        end

        % Value changed function: DropDown16
        function DropDown16ValueChanged(app, event)
            
            switch app.DropDown16.Value
                case 'Elastómero'
                    app.Image16.ImageSource = 'M1RSC/G.png';
                case 'Cuero al cromo'
                    app.Image16.ImageSource = 'M1RSC/L.png';
                case 'Novo'
                    app.Image16.ImageSource = 'M1RSC/N.png';
                case 'High/Medium Grip'
                    app.Image16.ImageSource = 'M1RSC/R.png';
                case 'Tejido'
                    app.Image16.ImageSource = 'M1RSC/T.png';
                case 'Poliuretano'
                    app.Image16.ImageSource = 'M1RSC/U.png';
            end
            
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

            % Create Tab6
            app.Tab6 = uitab(app.TabGroup);
            app.Tab6.AutoResizeChildren = 'off';
            app.Tab6.Title = 'MODULO 1';
            app.Tab6.BackgroundColor = [0.9294 0.9294 0.9294];

            % Create UIAxes12
            app.UIAxes12 = uiaxes(app.Tab6);
            app.UIAxes12.DataAspectRatio = [0.4 1 0.9];
            app.UIAxes12.XColor = [0.9412 0.9412 0.9412];
            app.UIAxes12.XTickLabelRotation = 0;
            app.UIAxes12.YColor = [0.9412 0.9412 0.9412];
            app.UIAxes12.YTickLabelRotation = 0;
            app.UIAxes12.ZTickLabelRotation = 0;
            app.UIAxes12.Box = 'on';
            app.UIAxes12.Position = [296 10 940 512];

            % Create GamaLabel
            app.GamaLabel = uilabel(app.Tab6);
            app.GamaLabel.HorizontalAlignment = 'right';
            app.GamaLabel.FontName = 'Times';
            app.GamaLabel.Position = [1132 416 34 22];
            app.GamaLabel.Text = 'Gama';

            % Create DropDown14
            app.DropDown14 = uidropdown(app.Tab6);
            app.DropDown14.Items = {'Poliamida Lamina', 'Poliester Tejido', 'Poliester Cuerda', 'Aramida Tejido', 'Aramida Cuerda'};
            app.DropDown14.ValueChangedFcn = createCallbackFcn(app, @DropDown14ValueChanged, true);
            app.DropDown14.FontName = 'Times';
            app.DropDown14.Position = [1181 416 145 22];
            app.DropDown14.Value = 'Poliamida Lamina';

            % Create Button14
            app.Button14 = uibutton(app.Tab6, 'push');
            app.Button14.ButtonPushedFcn = createCallbackFcn(app, @Button14Pushed, true);
            app.Button14.FontName = 'Times';
            app.Button14.Position = [789 538 100 23];
            app.Button14.Text = 'Definir';

            % Create Image12
            app.Image12 = uiimage(app.Tab6);
            app.Image12.Position = [31 527 164 117];
            app.Image12.ImageSource = fullfile(pathToMLAPP, 'M1RSC', 'motor.png');

            % Create Image13
            app.Image13 = uiimage(app.Tab6);
            app.Image13.Position = [41 258 150 126];
            app.Image13.ImageSource = fullfile(pathToMLAPP, 'M1RSC', 'distancias.png');

            % Create Image14
            app.Image14 = uiimage(app.Tab6);
            app.Image14.Position = [31 391 157 123];
            app.Image14.ImageSource = fullfile(pathToMLAPP, 'M1RSC', 'poleaplana.png');

            % Create PotenciaLabel
            app.PotenciaLabel = uilabel(app.Tab6);
            app.PotenciaLabel.FontName = 'Times';
            app.PotenciaLabel.Position = [202 581 75 22];
            app.PotenciaLabel.Text = 'Potencia [kW]';

            % Create EditField58
            app.EditField58 = uieditfield(app.Tab6, 'numeric');
            app.EditField58.FontName = 'Times';
            app.EditField58.Position = [314 581 68 22];

            % Create RPMLabel
            app.RPMLabel = uilabel(app.Tab6);
            app.RPMLabel.HorizontalAlignment = 'right';
            app.RPMLabel.FontName = 'Times';
            app.RPMLabel.Position = [198 538 30 22];
            app.RPMLabel.Text = 'RPM';

            % Create EditField59
            app.EditField59 = uieditfield(app.Tab6, 'numeric');
            app.EditField59.FontName = 'Times';
            app.EditField59.Position = [314 538 68 22];

            % Create DiametrodelaPoleaMayorLabel
            app.DiametrodelaPoleaMayorLabel = uilabel(app.Tab6);
            app.DiametrodelaPoleaMayorLabel.FontName = 'Times';
            app.DiametrodelaPoleaMayorLabel.Position = [202 448 94 30];
            app.DiametrodelaPoleaMayorLabel.Text = {'Diámetro de la'; 'polea mayor [mm]'};

            % Create EditField60
            app.EditField60 = uieditfield(app.Tab6, 'numeric');
            app.EditField60.FontName = 'Times';
            app.EditField60.Position = [314 452 68 22];

            % Create DiametrodelaPoleaMenorLabel
            app.DiametrodelaPoleaMenorLabel = uilabel(app.Tab6);
            app.DiametrodelaPoleaMenorLabel.FontName = 'Times';
            app.DiametrodelaPoleaMenorLabel.Position = [202 399 94 30];
            app.DiametrodelaPoleaMenorLabel.Text = {'Diámetro de la'; 'polea menor [mm]'};

            % Create EditField61
            app.EditField61 = uieditfield(app.Tab6, 'numeric');
            app.EditField61.FontName = 'Times';
            app.EditField61.Position = [314 403 68 22];

            % Create DistanciaentreCentrosDHLabel
            app.DistanciaentreCentrosDHLabel = uilabel(app.Tab6);
            app.DistanciaentreCentrosDHLabel.FontName = 'Times';
            app.DistanciaentreCentrosDHLabel.Position = [202 307 138 30];
            app.DistanciaentreCentrosDHLabel.Text = {'Distancia '; 'horizontal [mm]'};

            % Create EditField62
            app.EditField62 = uieditfield(app.Tab6, 'numeric');
            app.EditField62.FontName = 'Times';
            app.EditField62.Position = [314 311 68 22];

            % Create DistanciaentreCentrosDVLabel
            app.DistanciaentreCentrosDVLabel = uilabel(app.Tab6);
            app.DistanciaentreCentrosDVLabel.FontName = 'Times';
            app.DistanciaentreCentrosDVLabel.Position = [202 258 86 30];
            app.DistanciaentreCentrosDVLabel.Text = {'Distancia '; 'vertical [mm]'};

            % Create EditField63
            app.EditField63 = uieditfield(app.Tab6, 'numeric');
            app.EditField63.FontName = 'Times';
            app.EditField63.Position = [314 262 68 22];

            % Create FuLabel
            app.FuLabel = uilabel(app.Tab6);
            app.FuLabel.FontName = 'Times';
            app.FuLabel.Position = [443 29 25 22];
            app.FuLabel.Text = '''Fu''';

            % Create EditField64
            app.EditField64 = uieditfield(app.Tab6, 'numeric');
            app.EditField64.FontName = 'Times';
            app.EditField64.Position = [472 29 100 22];

            % Create Fu_nomLabel
            app.Fu_nomLabel = uilabel(app.Tab6);
            app.Fu_nomLabel.FontName = 'Times';
            app.Fu_nomLabel.Position = [903 538 52 22];
            app.Fu_nomLabel.Text = 'F''u_nom';

            % Create EditField65
            app.EditField65 = uieditfield(app.Tab6, 'numeric');
            app.EditField65.FontName = 'Times';
            app.EditField65.Position = [962 538 100 22];

            % Create C4Label
            app.C4Label = uilabel(app.Tab6);
            app.C4Label.FontName = 'Times';
            app.C4Label.Position = [763 29 25 22];
            app.C4Label.Text = 'C4';

            % Create EditField66
            app.EditField66 = uieditfield(app.Tab6, 'numeric');
            app.EditField66.FontName = 'Times';
            app.EditField66.Position = [801 29 100 22];

            % Create Label33
            app.Label33 = uilabel(app.Tab6);
            app.Label33.FontName = 'Times';
            app.Label33.FontSize = 15;
            app.Label33.FontWeight = 'bold';
            app.Label33.Position = [201 624 160 22];
            app.Label33.Text = 'Parametros del motor';

            % Create Label34
            app.Label34 = uilabel(app.Tab6);
            app.Label34.FontName = 'Times';
            app.Label34.FontSize = 15;
            app.Label34.FontWeight = 'bold';
            app.Label34.Position = [201 495 163 22];
            app.Label34.Text = 'Parametros de las poleas';

            % Create Label35
            app.Label35 = uilabel(app.Tab6);
            app.Label35.FontName = 'Times';
            app.Label35.FontSize = 15;
            app.Label35.FontWeight = 'bold';
            app.Label35.Position = [201 354 181 22];
            app.Label35.Text = 'Parametros de Distancia';

            % Create UITable11
            app.UITable11 = uitable(app.Tab6);
            app.UITable11.ColumnName = {'Resultados'};
            app.UITable11.RowName = {};
            app.UITable11.FontName = 'Times';
            app.UITable11.Position = [41 29 341 164];

            % Create Label36
            app.Label36 = uilabel(app.Tab6);
            app.Label36.FontName = 'Times';
            app.Label36.FontSize = 15;
            app.Label36.FontWeight = 'bold';
            app.Label36.Position = [202 213 75 22];
            app.Label36.Text = 'Resultados';

            % Create Label37
            app.Label37 = uilabel(app.Tab6);
            app.Label37.FontName = 'Times';
            app.Label37.FontSize = 25;
            app.Label37.Position = [42 679 375 33];
            app.Label37.Text = 'Módulo de correas planas [FORBO]';

            % Create Image15
            app.Image15 = uiimage(app.Tab6);
            app.Image15.Position = [1100 473 244 235];
            app.Image15.ImageSource = fullfile(pathToMLAPP, 'M1RSC', 'GamaPoliamida.png');

            % Create Button15
            app.Button15 = uibutton(app.Tab6, 'push');
            app.Button15.ButtonPushedFcn = createCallbackFcn(app, @Button15Pushed, true);
            app.Button15.Icon = fullfile(pathToMLAPP, 'M1RSC', 'engrane.gif');
            app.Button15.FontName = 'Times';
            app.Button15.Position = [1177 28 100 23];
            app.Button15.Text = 'Calcular';

            % Create Label38
            app.Label38 = uilabel(app.Tab6);
            app.Label38.FontWeight = 'bold';
            app.Label38.Position = [1146 453 159 22];
            app.Label38.Text = 'Caracteristicas de la Gama';

            % Create Label39
            app.Label39 = uilabel(app.Tab6);
            app.Label39.FontName = 'Times';
            app.Label39.FontSize = 15;
            app.Label39.FontWeight = 'bold';
            app.Label39.Position = [424 538 362 22];
            app.Label39.Text = 'Gráfica para la selección de los parámetros de cálculo';

            % Create TipodeMotorLabel
            app.TipodeMotorLabel = uilabel(app.Tab6);
            app.TipodeMotorLabel.HorizontalAlignment = 'right';
            app.TipodeMotorLabel.FontName = 'Times';
            app.TipodeMotorLabel.Position = [424 581 73 22];
            app.TipodeMotorLabel.Text = 'Tipo de motor';

            % Create DropDown15
            app.DropDown15 = uidropdown(app.Tab6);
            app.DropDown15.Items = {'Motores eléctricos de velocidad variable ', 'Motores eléctricos con conmutación de estrella-triángulo', 'Motores eléctricos con acoplamiento mecánico o hidrodinámico', 'Motores eléctricos con conmutación de polos', 'Motores de combustión', 'Turbinas hidráulicas', 'Motores eléctricos de encendido directo sin embrague de arranque'};
            app.DropDown15.FontName = 'Times';
            app.DropDown15.Position = [512 581 263 22];
            app.DropDown15.Value = 'Motores eléctricos de velocidad variable ';

            % Create Image16
            app.Image16 = uiimage(app.Tab6);
            app.Image16.Position = [1100 145 244 235];
            app.Image16.ImageSource = fullfile(pathToMLAPP, 'M1RSC', 'G.png');

            % Create Label40
            app.Label40 = uilabel(app.Tab6);
            app.Label40.FontName = 'Times';
            app.Label40.FontWeight = 'bold';
            app.Label40.Position = [1127 121 201 22];
            app.Label40.Text = 'Caracteristicas del Recubrimiento';

            % Create RecubrimientoDropDownLabel
            app.RecubrimientoDropDownLabel = uilabel(app.Tab6);
            app.RecubrimientoDropDownLabel.HorizontalAlignment = 'right';
            app.RecubrimientoDropDownLabel.FontName = 'Times';
            app.RecubrimientoDropDownLabel.Position = [1129 84 83 22];
            app.RecubrimientoDropDownLabel.Text = 'Recubrimiento';

            % Create DropDown16
            app.DropDown16 = uidropdown(app.Tab6);
            app.DropDown16.Items = {'Elastómero', 'Cuero al cromo', 'Novo', 'High/Medium Grip', 'Tejido', 'Poliuretano'};
            app.DropDown16.ValueChangedFcn = createCallbackFcn(app, @DropDown16ValueChanged, true);
            app.DropDown16.FontName = 'Times';
            app.DropDown16.Position = [1227 84 100 22];
            app.DropDown16.Value = 'Elastómero';

            % Create SentidodegiroLabel
            app.SentidodegiroLabel = uilabel(app.Tab6);
            app.SentidodegiroLabel.HorizontalAlignment = 'center';
            app.SentidodegiroLabel.FontName = 'Times';
            app.SentidodegiroLabel.Position = [785 581 89 22];
            app.SentidodegiroLabel.Text = 'Sentido de giro';

            % Create Switch2
            app.Switch2 = uiswitch(app.Tab6, 'slider');
            app.Switch2.Items = {'Horario', 'Antihorario'};
            app.Switch2.FontName = 'Times';
            app.Switch2.Position = [949 582 45 20];
            app.Switch2.Value = 'Horario';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Modulo1

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