classdef Modulo4 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        TabGroup                       matlab.ui.container.TabGroup
        Tab5                           matlab.ui.container.Tab
        Button4                        matlab.ui.control.Button
        DropDown13                     matlab.ui.control.DropDown
        Label32                        matlab.ui.control.Label
        EditField56                    matlab.ui.control.NumericEditField
        AlturadeTrabajoLabel           matlab.ui.control.Label
        EditField55                    matlab.ui.control.NumericEditField
        EspesordelaRuedaLabel          matlab.ui.control.Label
        EditField54                    matlab.ui.control.NumericEditField
        AlturadelDienteLabel_2         matlab.ui.control.Label
        EditField53                    matlab.ui.control.NumericEditField
        AdemdumLabel                   matlab.ui.control.Label
        EditField52                    matlab.ui.control.NumericEditField
        DistanciaentreCentrosLabel     matlab.ui.control.Label
        EditField57                    matlab.ui.control.NumericEditField
        DedendummmLabel                matlab.ui.control.Label
        Label31                        matlab.ui.control.Label
        Label30                        matlab.ui.control.Label
        UITable10                      matlab.ui.control.Table
        UITable9                       matlab.ui.control.Table
        EditField51                    matlab.ui.control.NumericEditField
        PotenciadelPionkWLabel         matlab.ui.control.Label
        Label29                        matlab.ui.control.Label
        Label28                        matlab.ui.control.Label
        UITable8                       matlab.ui.control.Table
        Button3                        matlab.ui.control.Button
        Label27                        matlab.ui.control.Label
        UITable7                       matlab.ui.control.Table
        DropDown12                     matlab.ui.control.DropDown
        TipodeEngranajesDropDownLabel  matlab.ui.control.Label
        Label26                        matlab.ui.control.Label
        Label25                        matlab.ui.control.Label
        EditField50                    matlab.ui.control.NumericEditField
        EditField49                    matlab.ui.control.NumericEditField
        EditField48                    matlab.ui.control.NumericEditField
        EditField47                    matlab.ui.control.NumericEditField
        Label24                        matlab.ui.control.Label
        Label23                        matlab.ui.control.Label
        Label22                        matlab.ui.control.Label
        Label21                        matlab.ui.control.Label
        Image11                        matlab.ui.control.Image
        Image10                        matlab.ui.control.Image
        Image9                         matlab.ui.control.Image
        Image8                         matlab.ui.control.Image
        Label20                        matlab.ui.control.Label
        Label19                        matlab.ui.control.Label
        Label18                        matlab.ui.control.Label
        EditField46                    matlab.ui.control.NumericEditField
        CiclosdeVidaLabel              matlab.ui.control.Label
        EditField45                    matlab.ui.control.NumericEditField
        RPMEditFieldLabel              matlab.ui.control.Label
        EditField44                    matlab.ui.control.NumericEditField
        NumerodeDientesEditFieldLabel  matlab.ui.control.Label
        EditField43                    matlab.ui.control.NumericEditField
        ModuloEditFieldLabel           matlab.ui.control.Label
        EditField42                    matlab.ui.control.NumericEditField
        AngulodeHliceLabel             matlab.ui.control.Label
        EditField41                    matlab.ui.control.NumericEditField
        RelaciondeTransmicionEditFieldLabel  matlab.ui.control.Label
        DropDown11                     matlab.ui.control.DropDown
        AngulodePresionLabel           matlab.ui.control.Label
        DropDown10                     matlab.ui.control.DropDown
        DropDown9                      matlab.ui.control.DropDown
        MaterialLabel                  matlab.ui.control.Label
        EditField40                    matlab.ui.control.NumericEditField
        AnchodelDientemmLabel          matlab.ui.control.Label
        EditField39                    matlab.ui.control.NumericEditField
        TemperaturadeOperacionCLabel   matlab.ui.control.Label
        EditField38                    matlab.ui.control.NumericEditField
        EditField37                    matlab.ui.control.NumericEditField
        ConfiabilidadLabel             matlab.ui.control.Label
        DropDown8                      matlab.ui.control.DropDown
        DropDown7                      matlab.ui.control.DropDown
        CalidadLabel                   matlab.ui.control.Label
        DropDown6                      matlab.ui.control.DropDown
        CargaenlaMaquinaDropDownLabel  matlab.ui.control.Label
        DropDown5                      matlab.ui.control.DropDown
        CargaenelMotorDropDownLabel    matlab.ui.control.Label
        EditField36                    matlab.ui.control.NumericEditField
        EditField35                    matlab.ui.control.NumericEditField
        DurezaHBLabel                  matlab.ui.control.Label
        Image7                         matlab.ui.control.Image
        EditField34                    matlab.ui.control.NumericEditField
        EditField33                    matlab.ui.control.NumericEditField
        EditField32                    matlab.ui.control.NumericEditField
        StFlexionMPaLabel              matlab.ui.control.Label
        DropDown4                      matlab.ui.control.DropDown
        EditField31                    matlab.ui.control.NumericEditField
        SacPicaduraLabel               matlab.ui.control.Label
        DropDown3                      matlab.ui.control.DropDown
        TratamientoTermicoDropDownLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            app.UITable7.Data                  = zeros(12,2);
            app.UITable8.Data                  = zeros(10,2);
            app.UITable9.Data                  = zeros(4,2);
            app.UITable10.Data                 = zeros(9,2);
            
        end

        % Value changed function: DropDown3
        function DropDown3ValueChanged(app, event)
            
            switch app.DropDown3.Value
                case 'Endurecido Interno'
                    app.EditField31.Tooltip = ['Deberia estar comprendido entre ',num2str(600),' y ',num2str(1200),' MPa'];
                    app.EditField32.Tooltip = ['Deberia estar comprendido entre ',num2str(182),' y ',num2str(394),' MPa'];
                case 'Endurecido por llama'
                    app.EditField31.Tooltip = ['Deberia estar comprendido entre ',num2str(1170),' y ',num2str(1345),' MPa'];
                    app.EditField32.Tooltip = ['Deberia estar comprendido entre ',num2str(310),' y ',num2str(380),' MPa'];
                case 'Templado, revenido y recocido'
                    app.EditField31.Tooltip = ['Deberia ser mayor a ',num2str(1443),' MPa'];
                    app.EditField32.Tooltip = ['Deberia ser mayor a ',num2str(387),' MPa'];
                case 'Carburizado'
                    app.EditField31.Tooltip = ['Deberia estar comprendido entre ',num2str(1240),' y ',num2str(1895),' MPa'];
                    app.EditField32.Tooltip = ['Deberia estar comprendido entre ',num2str(380),' y ',num2str(515),' MPa'];
                case 'Nitrado'
                    app.EditField31.Tooltip = ['Deberia estar comprendido entre ',num2str(1035),' y ',num2str(1240),' MPa'];
                    app.EditField32.Tooltip = ['Deberia estar comprendido entre ',num2str(237),' y ',num2str(364),' MPa'];
            end
            
        end

        % Value changed function: DropDown4
        function DropDown4ValueChanged(app, event)
            
            switch app.DropDown4.Value
                case 'Endurecido Interno'
                    app.EditField33.Tooltip = ['Deberia estar comprendido entre ',num2str(600),' y ',num2str(1200),' MPa'];
                    app.EditField34.Tooltip = ['Deberia estar comprendido entre ',num2str(182),' y ',num2str(394),' MPa'];
                case 'Enducrecido por llama'
                    app.EditField33.Tooltip = ['Deberia estar comprendido entre ',num2str(1170),' y ',num2str(1345),' MPa'];
                    app.EditField34.Tooltip = ['Deberia estar comprendido entre ',num2str(310),' y ',num2str(380),' MPa'];
                case 'Templado, revenido y recocido'
                    app.EditField33.Tooltip = ['Deberia ser mayor a ',num2str(1443),' MPa'];
                    app.EditField34.Tooltip = ['Deberia ser mayor a ',num2str(387),' MPa'];
                case 'Carburizado'
                    app.EditField33.Tooltip = ['Deberia estar comprendido entre ',num2str(1240),' y ',num2str(1895),' MPa'];
                    app.EditField34.Tooltip = ['Deberia estar comprendido entre ',num2str(380),' y ',num2str(515),' MPa'];
                case 'Nitrado'
                    app.EditField33.Tooltip = ['Deberia estar comprendido entre ',num2str(1035),' y ',num2str(1240),' MPa'];
                    app.EditField34.Tooltip = ['Deberia estar comprendido entre ',num2str(237),' y ',num2str(364),' MPa'];
            end
            
        end

        % Value changed function: EditField35
        function EditField35ValueChanged(app, event)
            
            switch app.DropDown3.Value
                case 'Templado, revenido y recocido'
                    app.EditField31.Value = 2.22 * app.EditField35.Value + 200;
                    app.EditField32.Value = 0.533 * app.EditField35.Value + 88.3;
                case 'Nitrado'
                    app.EditField32.Value = 0.568 * app.EditField35.Value + 83.8;
            end
            
        end

        % Value changed function: EditField36
        function EditField36ValueChanged(app, event)
            
            switch app.DropDown4.Value
                case 'Templado, revenido y recocido'
                    app.EditField33.Value = 2.22 * app.EditField36.Value + 200;
                    app.EditField34.Value = 0.533 * app.EditField36.Value + 88.3;
                case 'Nitrado'
                    app.EditField34.Value = 0.568 * app.EditField36.Value + 83.8;
            end
            
        end

        % Button pushed function: Button3
        function Button3Pushed(app, event)
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Calculando factores y fuerzas en los engranajes';pause(2)
            
            app.EditField49.Value = app.EditField44.Value * app.EditField41.Value;
            app.EditField47.Value = app.EditField45.Value * app.EditField41.Value;
            app.EditField50.Value = app.EditField43.Value;
            %%%
            switch app.DropDown12.Value
                case 'Conicos Rectos'
                otherwise
                    switch app.DropDown11.Value
                        case '14.5'
                            app.EditField53.Value = app.EditField43.Value;
                            app.EditField57.Value = 1.157 * app.EditField43.Value;
                            app.EditField54.Value = 2.157 * app.EditField43.Value;
                            app.EditField56.Value = 2 * app.EditField43.Value;
                        case '20'
                            app.EditField53.Value = 0.8 * app.EditField43.Value;
                            app.EditField57.Value = app.EditField43.Value;
                            app.EditField54.Value = 1.8 * app.EditField43.Value;
                            app.EditField56.Value = 1.6 * app.EditField43.Value;
                        case '25'
                            app.EditField53.Value = app.EditField43.Value;
                            app.EditField57.Value = 1.25 * app.EditField43.Value;
                            app.EditField54.Value = 2.25 * app.EditField43.Value;
                            app.EditField56.Value = 2 * app.EditField43.Value;
                    end
                    app.EditField52.Value = (app.EditField43.Value / 2) * (app.EditField44.Value + app.EditField49.Value);
            end
            
            app.UITable9.Data(3,1) = (app.EditField51.Value * 1000) / (app.EditField45.Value * (pi/60000) * app.EditField43.Value * app.EditField44.Value);
            app.UITable9.Data(3,2) = (app.EditField51.Value * 1000) / (app.EditField47.Value * (pi/60000) * app.EditField43.Value * app.EditField49.Value);
            app.UITable9.Data(4,1) = (app.UITable9.Data(3,1) * app.EditField43.Value * app.EditField44.Value) / 2000;
            app.UITable9.Data(4,2) = (app.UITable9.Data(3,2) * app.EditField43.Value * app.EditField49.Value) / 2000;
            switch app.DropDown12.Value
                case 'Rectos'
                    app.UITable9.Data(1,1) = 0;
                    app.UITable9.Data(1,2) = 0;
                    app.UITable9.Data(2,1) = app.UITable9.Data(3,1) * tand(str2double(app.DropDown11.Value));
                    app.UITable9.Data(2,2) = app.UITable9.Data(3,2) * tand(str2double(app.DropDown11.Value));
                    
                case 'Helicoidales'
                    app.UITable9.Data(1,1) = app.UITable9.Data(3,1) * tand(app.EditField42.Value);
                    app.UITable9.Data(1,2) = app.UITable9.Data(3,2) * tand(app.EditField42.Value);
                    app.UITable9.Data(2,1) = (app.UITable9.Data(3,1) * tand(str2double(app.DropDown11.Value))) / cosd(app.EditField42.Value);
                    app.UITable9.Data(2,2) = (app.UITable9.Data(3,2) * tand(str2double(app.DropDown11.Value))) / cosd(app.EditField42.Value);
                case 'Bihelicoidales'
                    app.UITable9.Data(1,1) = 0;
                    app.UITable9.Data(1,2) = 0;
                    app.UITable9.Data(2,1) = (app.UITable9.Data(3,1) * tand(str2double(app.DropDown11.Value))) / cosd(app.EditField42.Value);
                    app.UITable9.Data(2,2) = (app.UITable9.Data(3,2) * tand(str2double(app.DropDown11.Value))) / cosd(app.EditField42.Value);
                case 'Conicos Rectos'
                    app.UITable9.Data(1,1) = app.UITable9.Data(3,1) * tand(app.EditField42.Value) * sind(atand(app.EditField44.Value/app.EditField49.Value));
                    app.UITable9.Data(1,2) = app.UITable9.Data(3,2) * tand(app.EditField42.Value) * sind(atand(app.EditField49.Value/app.EditField44.Value));
                    app.UITable9.Data(2,1) = app.UITable9.Data(3,1) * tand(app.EditField42.Value) * cosd(atand(app.EditField44.Value/app.EditField49.Value));
                    app.UITable9.Data(2,2) = app.UITable9.Data(3,2) * tand(app.EditField42.Value) * cosd(atand(app.EditField49.Value/app.EditField44.Value));
                    app.UITable9.Data(3,1) = app.UITable9.Data(3,1) * tand(app.EditField42.Value);
                    app.UITable9.Data(3,2) = app.UITable9.Data(3,2) * tand(app.EditField42.Value);
            end
            
            Ze = [191 181 179 174 162 158;181 174 172 168 158 154;179 172 170 166 156 152;174 168 166 163 154 149;162 158 156 154 145 141;158 154 152 149 141 137];
            switch app.DropDown9.Value
                case 'Acero'
                    fil = 1;
                case 'Hierro Maleable'
                    fil = 2;
                case 'Hierro Nodular'
                    fil = 3;
                case 'Hierro Fundido'
                    fil = 4;
                case 'Bronce de Aluminio'
                    fil = 5;
                case 'Bronce de Estaño'
                    fil = 6;
            end
            switch app.DropDown10.Value
                case 'Acero'
                    col = 1;
                case 'Hierro Maleable'
                    col = 2;
                case 'Hierro Nodular'
                    col = 3;
                case 'Hierro Fundido'
                    col = 4;
                case 'Bronce de Aluminio'
                    col = 5;
                case 'Bronce de Estaño'
                    col = 6;
            end
            app.UITable7.Data(1,:) = Ze(fil,col);
            
            Ko = [1 1.25 1.5 1.75;1.1 1.35 1.6 1.85;1.25 1.5 1.75 2;1.5 1.75 2 2.25];
            switch app.DropDown5.Value
                case 'Uniforme'
                    fil = 1;
                case 'Impactos Leves'
                    fil = 2;
                case 'Impactos Moderados'
                    fil = 3;
                case 'Impactos Fuertes'
                    fil = 4;
            end
            switch app.DropDown6.Value
                case 'Uniforme'
                    col = 1;
                case 'Impactos Leves'
                    col = 2;
                case 'Impactos Moderados'
                    col = 3;
                case 'Impactos Fuertes'
                    col = 4;
            end
            app.UITable7.Data(2,:) = Ko(fil,col);
            
            Avp = 13 - find(strcmp(app.DropDown7.Items,app.DropDown7.Value) == 1);
            Ave = 13 - find(strcmp(app.DropDown8.Items,app.DropDown8.Value) == 1);
            Bp  = 0.25 * (Avp - 5) ^ 0.667;
            Be  = 0.25 * (Ave - 5) ^ 0.667;
            Cp  = 50 + 56*(1 - Bp);
            Ce  = 50 + 56*(1 - Be);
            Vp  = app.EditField45.Value * (pi/60000) * (app.EditField43.Value * app.EditField44.Value);
            Ve  = app.EditField47.Value * (pi/60000) * (app.EditField50.Value * app.EditField49.Value);
            if Avp <= 5
                app.UITable7.Data(3,1) = 1;
                A1 = 0.38e-1;
                B1 = 0.402e-3;
                C1 = -1.27e-7;
                app.UITable7.Data(6,1) = 1;
            elseif Avp > 5 && Avp <= 9
                app.UITable7.Data(3,1) = (Cp / (Cp + sqrt(196.85 * Vp))) ^ (-Bp);
                A1 = 0.675e-1;
                B1 = 0.504e-3;
                C1 = -1.44e-7;
                app.UITable7.Data(6,1) = 1.25;
            else
                app.UITable7.Data(3,1) = (Cp / (Cp + sqrt(196.85 * Vp))) ^ (-Bp);
                A1 = 1.27e-1;
                B1 = 0.622e-3;
                C1 = -1.69e-7;
                app.UITable7.Data(6,1) = 1.5;
            end
            if Ave <= 5
                app.UITable7.Data(3,2) = 1;
                A2 = 0.38e-1;
                B2 = 0.402e-3;
                C2 = -1.27e-7;
                app.UITable7.Data(6,2) = 1;
            elseif Ave > 5 && Ave <= 9
                app.UITable7.Data(3,2) = (Ce / (Ce + sqrt(196.85 * Ve))) ^ (-Be);
                A2 = 0.675e-1;
                B2 = 0.504e-3;
                C2 = -1.44e-7;
                app.UITable7.Data(6,2) = 1.25;
            else
                app.UITable7.Data(3,2) = (Ce / (Ce + sqrt(196.85 * Ve))) ^ (-Be);
                A2 = 1.27e-1;
                B2 = 0.622e-3;
                C2 = -1.69e-7;
                app.UITable7.Data(6,2) = 1.5;
            end
            
            if app.EditField43.Value >= 12
                app.UITable7.Data(4,:) = 1.25;
            else
                app.UITable7.Data(4,:) = 1.00;
            end
            
            if app.EditField40.Value/(10*app.EditField43.Value*app.EditField44.Value) < 0.05
                if app.EditField40.Value <= 25
                    Khpf = 0.05 - 0.025;
                elseif app.EditField40.Value > 25 && app.EditField40.Value <= 432
                    Khpf = 0.05 - 0.0375 + 0.000492 * app.EditField40.Value;
                else
                    Khpf = 0.05 - 0.1109 + 0.000815 * app.EditField40.Value - 0.000000353 * app.EditField40.Value ^ 2;
                end
            else
                if app.EditField40.Value <= 25
                    Khpf = app.EditField40.Value/(10*app.EditField43.Value*app.EditField44.Value) - 0.025;
                elseif app.EditField40.Value > 25 && app.EditField40.Value <= 432
                    Khpf = app.EditField40.Value/(10*app.EditField43.Value*app.EditField44.Value) - 0.0375 + 0.000492 * app.EditField40.Value;
                else
                    Khpf = app.EditField40.Value/(10*app.EditField43.Value*app.EditField44.Value) - 0.1109 + 0.000815 * app.EditField40.Value - 0.000000353 * app.EditField40.Value ^ 2;
                end
            end
            Khmap = A1 + B1*app.EditField40.Value + C1*app.EditField40.Value^2;
            Khmae = A2 + B2*app.EditField40.Value + C2*app.EditField40.Value^2;
            app.UITable7.Data(5,1) = 1 + 0.9*(1.05 * Khpf + 0.9 * Khmap);
            app.UITable7.Data(5,2) = 1 + 0.9*(1.05 * Khpf + 0.9 * Khmae);
            
            switch app.DropDown12.Value
                case 'Rectos'
                    switch app.DropDown11.Value
                        case '14.5'
                            x = 1:10;
                            y = [0.06 0.08 0.090 0.097 0.102 0.104 0.106 0.108 0.109 0.110];
                            app.UITable7.Data(7,:) = interp1(x,y,app.EditField41.Value,'spline');
                        otherwise
                            x = 1:10;
                            y = [16:4:24 30:10:50];
                            z = [0.076 0.090 0.096 0.103 0.105 0.108 0.109 0.110 0.110 0.110;...
                                0.076 0.090 0.096 0.103 0.105 0.108 0.109 0.110 0.110 0.110;...
                                0.080 0.100 0.110 0.115 0.119 0.121 0.124 0.125 0.125 0.126;...
                                0.083 0.104 0.114 0.120 0.125 0.128 0.130 0.131 0.132 0.133;...
                                0.084 0.106 0.118 0.125 0.130 0.134 0.136 0.138 0.139 0.140;...
                                0.085 0.110 0.122 0.130 0.135 0.139 0.141 0.143 0.144 0.145];
                            app.UITable7.Data(7,:) = interp2(x,y,z,app.EditField41.Value,app.EditField44.Value);
                    end
                case 'Conicos Rectos'
                    switch app.DropDown11.Value
                        case '20'
                            x = [15:5:50 60:10:100];
                            I = [0.057 0.063 0.068 0.071 0.074 0.076 0.077 0.078 0.081 0.084 0.087 0.090 0.094];
                            app.UITable7.Data(7,:) = interp1(x,I,app.EditField49.Value,'spline');
                        case '25'
                            x = [15:5:50 60:10:100];
                            I = [0.058 0.063 0.066 0.068 0.070 0.073 0.075 0.077 0.080 0.083 0.086 0.089 0.092];
                            app.UITable7.Data(7,:) = interp1(x,I,app.EditField49.Value,'spline');
                    end
                otherwise
                    switch app.DropDown11.Value
                        case '14.5'
                            x = 5:10:35;
                            y = [20 30 50 70 100 120 150 200 300];
                            z = [0.1025 0.1042 0.1095 0.1158;...
                                0.1140 0.1158 0.1190 0.1240;...
                                0.1240 0.1255 0.1280 0.1315;...
                                0.1300 0.1310 0.1330 0.1355;...
                                0.1350 0.1358 0.1375 0.1389;...
                                0.1370 0.1379 0.1390 0.1405;...
                                0.1400 0.1407 0.1415 0.1424;...
                                0.1420 0.1425 0.1430 0.1435;...
                                0.1449 0.1450 0.1452 0.1450];
                            Kp = interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            Ke = interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            app.UITable7.Data(7,:) = (app.EditField49.Value/(app.EditField44.Value + app.EditField49.Value)) * (Kp + Ke);
                        case '20'
                            x = 5:10:35;
                            y = [20 30 50 70 100 120 150 200 300];
                            z = [0.1190 0.1205 0.1230 0.1263;...
                                0.1265 0.1275 0.1295 0.1321;...
                                0.1340 0.1348 0.1360 0.1370;...
                                0.1380 0.1385 0.1393 0.1395;...
                                0.1415 0.1418 0.1420 0.1415;...
                                0.1430 0.1430 0.1430 0.1425;...
                                0.1445 0.1445 0.1443 0.1434;...
                                0.1460 0.1459 0.1455 0.1443;...
                                0.1477 0.1475 0.1468 0.1453];
                            Kp = interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            Ke = interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            app.UITable7.Data(7,:) = (app.EditField49.Value/(app.EditField44.Value + app.EditField49.Value)) * (Kp + Ke);
                        case '25'
                            x = 5:10:35;
                            y = [20 30 50 70 100 120 150 200 300];
                            z = [0.1285 0.1290 0.1305 0.1310;...
                                0.1340 0.1345 0.1350 0.1350;...
                                0.1398 0.1398 0.1396 0.1385;...
                                0.1425 0.1424 0.1419 0.1401;...
                                0.1450 0.1445 0.1438 0.1415;...
                                0.1459 0.1455 0.1445 0.1420;...
                                0.1468 0.1465 0.1451 0.1428;...
                                0.1479 0.1473 0.1460 0.1434;...
                                0.1489 0.1483 0.1467 0.1440];
                            Kp = interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            Ke = interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            app.UITable7.Data(7,:) = (app.EditField49.Value/(app.EditField44.Value + app.EditField49.Value)) * (Kp + Ke);
                    end
            end
            
            if app.EditField46.Value <= 10^4
                app.UITable7.Data(8,:) = 1.3;
                app.UITable8.Data(7,:) = 2;
            elseif app.EditField46.Value > 10^4 && app.EditField46.Value <= 10^7
                app.UITable7.Data(8,:) = 2.466 * (app.EditField46.Value ^ -0.056);
                app.UITable8.Data(7,:) = 4.9404 * (app.EditField46.Value ^ -0.1045);
            else
                app.UITable7.Data(8,:) = 1.4488 * (app.EditField46.Value ^ -0.023);
                app.UITable8.Data(7,:) = 1.3558 * (app.EditField46.Value ^ -0.0178);
            end
            
            
            if app.EditField35.Value/app.EditField36.Value < 1.2
                Azw = 0;
            elseif app.EditField35.Value/app.EditField36.Value > 1.7
                Azw = 0.00698;
            else
                Azw = 0.00898*(app.EditField35.Value/app.EditField36.Value) - 0.00829;
            end
            app.UITable7.Data(9,:) = 1 + Azw*(app.EditField41.Value - 1);
            
            app.UITable7.Data(10,:) = 1;
            app.UITable8.Data(8,:)  = 1;
            
            if app.EditField39.Value < 120
                app.UITable7.Data(11,:) = 1;
            else
                app.UITable7.Data(11,:) = (273 + app.EditField39.Value)/344;
            end
            
            app.UITable7.Data(12,1) = interp1([50 90 99 99.9 99.99],[0.7 0.85 1 1.25 1.5],app.EditField37.Value);
            app.UITable7.Data(12,2) = interp1([50 90 99 99.9 99.99],[0.7 0.85 1 1.25 1.5],app.EditField38.Value);
            
            app.UITable8.Data(1,:) = Ko(fil,col);
            app.UITable8.Data(2,1) = app.UITable7.Data(3,1);
            app.UITable8.Data(2,2) = app.UITable7.Data(3,2);
            app.UITable8.Data(3,:) = app.UITable7.Data(4,:);
            app.UITable8.Data(4,1) = app.UITable7.Data(5,1);
            app.UITable8.Data(4,2) = app.UITable7.Data(5,2);
            app.UITable8.Data(9,:) = app.UITable7.Data(11,:);
            app.UITable8.Data(10,:) = app.UITable7.Data(12,:);
            
            if app.EditField55.Value / app.EditField54.Value < 1.2
                app.UITable8.Data(5,:) = 1.6 * log(2.242/app.EditField55.Value / app.EditField54.Value);
            else
                app.UITable8.Data(5,:) = 1;
            end
            
            switch app.DropDown12.Value
                case 'Rectos'
                    switch app.DropDown11.Value
                        case '25'
                            x = [12 20 50 100 200 300];
                            y = [17 50 170 1000];
                            z = [0.32 0.39 0.48 0.51 0.53 0.54;...
                                0.33 0.41 0.51 0.55 0.57 0.58;...
                                0.34 0.42 0.53 0.57 0.60 0.61;...
                                0.35 0.43 0.54 0.58 0.61 0.62];
                            app.UITable8.Data(6,1) = interp2(x,y,z,app.EditField44.Value,app.EditField49.Value);
                            app.UITable8.Data(6,2) = interp2(x,y,z,app.EditField49.Value,app.EditField44.Value);
                        otherwise
                            x = [12 20 50 100 200 300];
                            y = [17 50 170 1000];
                            z = [0.21 0.31 0.39 0.43 0.45 0.45;...
                                0.21 0.33 0.43 0.47 0.49 0.50;...
                                0.21 0.34 0.45 0.49 0.51 0.52;...
                                0.21 0.35 0.46 0.50 0.53 0.54];
                            app.UITable8.Data(6,1) = interp2(x,y,z,app.EditField44.Value,app.EditField49.Value);
                            app.UITable8.Data(6,2) = interp2(x,y,z,app.EditField49.Value,app.EditField44.Value);
                    end
                case 'Conicos Rectos'
                    switch app.DropDown11.Value
                        case '20'
                            x = [13 15 20 25 30 35 40 45 50 60 70 80 90 100];
                            y = [0.175 0.190 0.210 0.230 0.240 0.245 0.250 0.255 0.260 0.265 0.270 0.275 0.280 0.290];
                            app.UITable8.Data(6,1) = spline(x,y,app.EditField49.Value);
                            app.UITable8.Data(6,2) = spline(x,y,app.EditField44.Value);
                        case '25'
                            x = [13 15 20 25 30 35 40 45 50 60 70 80 90 100];
                            y = [0.195 0.210 0.235 0.255 0.265 0.270 0.275 0.280 0.285 0.290 0.295 0.300 0.310 0.320];
                            app.UITable8.Data(6,1) = spline(x,y,app.EditField49.Value);
                            app.UITable8.Data(6,2) = spline(x,y,app.EditField44.Value);
                    end
                otherwise
                    switch app.DropDown11.Value
                        case '14.5'
                            x = 5:5:35;
                            y = [20 30 60 150 500];
                            z = [0.40 0.42 0.43 0.43 0.42 0.40 0.38;...
                                0.47 0.49 0.50 0.49 0.47 0.44 0.42;...
                                0.56 0.58 0.59 0.57 0.55 0.51 0.46;...
                                0.63 0.65 0.65 0.63 0.59 0.55 0.48;...
                                0.67 0.69 0.69 0.67 0.63 0.58 0.50];
                            p1= interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            e1= interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            z = [0.89 0.89 0.89 0.89 0.90 0.90 0.91;...
                                0.94 0.94 0.94 0.94 0.94 0.94 0.95;...
                                0.97 0.97 0.97 0.97 0.97 0.98 0.98;...
                                1.04 1.04 1.04 1.04 1.03 1.03 1.02;...
                                1.07 1.07 1.07 1.07 1.06 1.05 1.04];
                            p2= interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            e2= interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            app.UITable8.Data(6,1) = p1 * p2;
                            app.UITable8.Data(6,2) = e1 * e2;
                        case '20'
                            x = 5:5:35;
                            y = [20 30 60 150 500];
                            z = [0.44 0.46 0.47 0.47 0.45 0.43 0.40;...
                                0.49 0.51 0.51 0.51 0.49 0.46 0.43;...
                                0.54 0.57 0.57 0.56 0.54 0.50 0.45;...
                                0.59 0.61 0.62 0.61 0.57 0.53 0.47;...
                                0.61 0.64 0.64 0.63 0.59 0.54 0.48];
                            p1= interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            e1= interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            z = [0.93 0.93 0.93 0.93 0.94 0.94 0.95;...
                                0.96 0.96 0.96 0.96 0.96 0.97 0.97;...
                                0.98 0.98 0.98 0.98 0.98 0.99 0.99;...
                                1.02 1.02 1.02 1.02 1.02 1.01 1.01;...
                                1.04 1.04 1.04 1.04 1.03 1.03 1.02];
                            p2= interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            e2= interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            app.UITable8.Data(6,1) = p1 * p2;
                            app.UITable8.Data(6,2) = e1 * e2;
                        case '25'
                            x = 5:5:35;
                            y = [20 30 60 150 500];
                            z = [0.47 0.50 0.51 0.50 0.49 0.47 0.44;...
                                0.52 0.55 0.56 0.55 0.53 0.51 0.47;...
                                0.59 0.62 0.62 0.61 0.59 0.55 0.51;...
                                0.63 0.66 0.67 0.65 0.62 0.58 0.53;...
                                0.66 0.69 0.69 0.68 0.64 0.60 0.54];
                            p1= interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            e1= interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            z = [0.94 0.94 0.94 0.94 0.95 0.95 0.96;...
                                0.96 0.96 0.96 0.96 0.97 0.97 0.97;...
                                0.98 0.98 0.98 0.98 0.99 0.99 0.99;...
                                1.02 1.02 1.02 1.02 1.01 1.01 1.01;...
                                1.03 1.03 1.03 1.03 1.02 1.02 1.02];
                            p2= interp2(x,y,z,app.EditField42.Value,app.EditField49.Value);
                            e2= interp2(x,y,z,app.EditField42.Value,app.EditField44.Value);
                            app.UITable8.Data(6,1) = p1 * p2;
                            app.UITable8.Data(6,2) = e1 * e2;
                    end
            end
            
            bar_pro.Message = 'Calculo finalizado exitosamente';pause(2)
            close(bar_pro)
            
        end

        % Value changed function: DropDown12
        function DropDown12ValueChanged(app, event)
            
            switch app.DropDown12.Value
                case 'Rectos'
                    app.EditField42.Editable = 0;
                    app.EditField42.Value = 0;
                    app.EditField42.Tooltip  = '';
                    app.DropDown11.Items = {'14' '20' '25'};
                case 'Helicoidales'
                    app.EditField42.Editable = 1;
                    app.EditField42.Value    = 15;
                    app.EditField42.Tooltip  = 'Deberia estar comprendido entre 15º y 25º';
                    app.DropDown11.Items = {'14' '20' '25'};
                case 'Bihelicoidales'
                    app.EditField42.Editable = 1;
                    app.EditField42.Value    = 30;
                    app.EditField42.Tooltip  = 'Deberia estar comprendido entre 30º y 45º';
                    app.DropDown11.Items = {'14' '20' '25'};
                case 'Conicos Rectos'
                    app.EditField42.Editable = 0;
                    app.EditField42.Value = 0;
                    app.EditField42.Tooltip  = '';
                    app.DropDown11.Items = {'20' '25'};
            end
            
        end

        % Value changed function: EditField43
        function EditField43ValueChanged(app, event)
            
            switch app.DropDown12.Value
                case 'Rectos'
                    app.EditField40.Value    = 10 * app.EditField43.Value;
                    app.EditField48.Value    = app.EditField40.Value;
                    app.EditField40.Tooltip  = ['El ancho del diente deberia estar entre ',num2str(8 * app.EditField43.Value),' mm y ',num2str(12.5 * app.EditField43.Value),' mm'];
                case 'Helicoidales'
                    app.EditField40.Value    = (2 * pi * app.EditField43.Value)/tand(app.EditField42.Value);
                    app.EditField48.Value    = app.EditField40.Value;
                    app.EditField40.Tooltip  = ['El ancho minimo del diente debe ser ',num2str(app.EditField40.Value),' mm'];
                case 'Bihelicoidales'
                    app.EditField40.Value    = (2 * pi * app.EditField43.Value)/tand(app.EditField42.Value);
                    app.EditField48.Value    = app.EditField40.Value;
                    app.EditField40.Tooltip  = ['El ancho minimo del diente debe ser ',num2str(app.EditField40.Value),' mm'];
                case 'Conicos Rectos'
                    app.EditField40.Value    = 8 * app.EditField43.Value;
                    app.EditField48.Value    = app.EditField40.Value;
                    app.EditField40.Tooltip  = ['El ancho maximo del diente debe ser ',num2str(app.EditField40.Value),' mm'];
            end
            
        end

        % Value changed function: EditField40
        function EditField40ValueChanged(app, event)
            
            app.EditField48.Value = app.EditField40.Value;
            
        end

        % Value changed function: DropDown13
        function DropDown13ValueChanged(app, event)
            
            switch app.DropDown13.Value
                case 'Tabla de Resistencias I'
                    app.Image7.ImageSource = 'M4RSC/Madrid.png';
                case 'Tabla de Resistencias II'
                    app.Image7.ImageSource = 'M4RSC/Chile.png';
                case 'Geometria del Engranaje I'
                    app.Image7.ImageSource = 'M4RSC/partes.jpg';
                case 'Geometria del Engranaje II'
                    app.Image7.ImageSource = 'M4RSC/geometria2.png';
                case 'Factores de Seguridad'
                    app.Image7.ImageSource = 'M4RSC/FactordeSeguridad.png';
            end
            
        end

        % Value changed function: EditField44
        function EditField44ValueChanged(app, event)
            
            if ~strcmp(app.DropDown12.Value,'Conicos Rectos')
                x = [14.5 20 25];
                y = [0 15:25 30:45];
                z = [32 17 12;...
                    29 16 11;...
                    29 16 11;...
                    28 16 10;...
                    28 15 10;...
                    28 15 10;...
                    27 15 10;...
                    27 15 10;...
                    26 14 10;...
                    26 14 9;...
                    25 14 9;...
                    24 13 9;...
                    22 12 8;...
                    21 12 8;...
                    20 11 8;...
                    20 11 8;...
                    19 11 7;...
                    18 10 7;...
                    18 10 7;...
                    17 10 7;...
                    17 9 7;...
                    16 9 6;...
                    15 9 6;...
                    15 8 6;...
                    14 8 6;...
                    14 8 5;...
                    13 7 5;...
                    12 7 5];
                app.EditField44.Tooltip = ['El numero minimo de dientes deberia ser ',num2str(interp2(x,y,z,str2double(app.DropDown11.Value),app.EditField42.Value))];
            end
            
        end

        % Button pushed function: Button4
        function Button4Pushed(app, event)
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Calculando';pause(2)
            
            Kpp = prod(app.UITable7.Data(2:5,1));
            Kpe = prod(app.UITable7.Data(2:5,1));
            Kfp = prod(app.UITable8.Data(1:4,1));
            Kfe = prod(app.UITable8.Data(1:4,1));
            
            app.UITable10.Data(1,1) = (app.EditField31.Value * prod(app.UITable7.Data(8:9,1))) / prod(app.UITable7.Data(10:12,1));
            app.UITable10.Data(1,2) = (app.EditField33.Value * prod(app.UITable7.Data(8:9,2))) / prod(app.UITable7.Data(10:12,2));
            app.UITable10.Data(2,1) = (app.EditField32.Value * app.UITable8.Data(7,1)) / prod(app.UITable8.Data(8:10,1));
            app.UITable10.Data(2,2) = (app.EditField34.Value * app.UITable8.Data(7,2)) / prod(app.UITable8.Data(8:10,2));
            app.UITable10.Data(3,1) = app.UITable7.Data(1,1) * sqrt((app.UITable9.Data(3,1) * Kpp * app.UITable7.Data(6,1)) / (app.EditField43.Value * app.EditField44.Value * app.EditField40.Value * app.UITable7.Data(7,1)));
            app.UITable10.Data(3,2) = app.UITable7.Data(1,2) * sqrt((app.UITable9.Data(3,2) * Kpe * app.UITable7.Data(6,2)) / (app.EditField43.Value * app.EditField49.Value * app.EditField40.Value * app.UITable7.Data(7,2)));
            app.UITable10.Data(4,1) = (app.UITable9.Data(3,1) * Kfp * app.UITable8.Data(5,1)) / (app.EditField43.Value * app.EditField40.Value * app.UITable8.Data(6,1));
            app.UITable10.Data(4,2) = (app.UITable9.Data(3,2) * Kfe * app.UITable8.Data(5,2)) / (app.EditField43.Value * app.EditField40.Value * app.UITable8.Data(6,2));
            app.UITable10.Data(5,1) = ((pi * app.EditField45.Value * app.EditField40.Value * app.UITable7.Data(7,1)) / (6*1e4 * Kpp * app.UITable7.Data(6,1))) * ((app.EditField43.Value * app.EditField44.Value * app.EditField31.Value * prod(app.UITable7.Data(8:9,1)))/(app.UITable7.Data(1,1) * prod(app.UITable7.Data(10:12,1))))^2;
            app.UITable10.Data(5,2) = ((pi * app.EditField47.Value * app.EditField40.Value * app.UITable7.Data(7,2)) / (6*1e4 * Kpe * app.UITable7.Data(6,2))) * ((app.EditField43.Value * app.EditField49.Value * app.EditField33.Value * prod(app.UITable7.Data(8:9,2)))/(app.UITable7.Data(1,2) * prod(app.UITable7.Data(10:12,2))))^2;
            app.UITable10.Data(6,1) = (pi * app.EditField45.Value * app.EditField43.Value^2 * app.EditField44.Value * app.EditField40.Value * prod(app.UITable8.Data(6:7,1)) * app.EditField32.Value) / (6*1e4 * Kfp * app.UITable8.Data(5,1) * prod(app.UITable8.Data(8:10,1)));
            app.UITable10.Data(6,2) = (pi * app.EditField47.Value * app.EditField43.Value^2 * app.EditField49.Value * app.EditField40.Value * prod(app.UITable8.Data(6:7,2)) * app.EditField34.Value) / (6*1e4 * Kfe * app.UITable8.Data(5,2) * prod(app.UITable8.Data(8:10,2)));
            app.UITable10.Data(7,1) = app.UITable10.Data(1,1) / app.UITable10.Data(3,1);
            app.UITable10.Data(7,2) = app.UITable10.Data(1,2) / app.UITable10.Data(3,2);
            app.UITable10.Data(8,1) = app.UITable10.Data(2,1) / app.UITable10.Data(4,1);
            app.UITable10.Data(8,2) = app.UITable10.Data(2,2) / app.UITable10.Data(4,2);
            app.UITable10.Data(9,1) = min(app.UITable10.Data(5:6,1));
            app.UITable10.Data(9,2) = min(app.UITable10.Data(5:6,2));
            
            bar_pro.Message = 'Calculo finalizado exitosamente';pause(2)
            close(bar_pro)
            
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

            % Create Tab5
            app.Tab5 = uitab(app.TabGroup);
            app.Tab5.AutoResizeChildren = 'off';
            app.Tab5.Title = 'MODULO 4';
            app.Tab5.BackgroundColor = [1 1 1];

            % Create TratamientoTermicoDropDownLabel
            app.TratamientoTermicoDropDownLabel = uilabel(app.Tab5);
            app.TratamientoTermicoDropDownLabel.FontName = 'Times';
            app.TratamientoTermicoDropDownLabel.Position = [46 201 106 22];
            app.TratamientoTermicoDropDownLabel.Text = 'Tratamiento Termico';

            % Create DropDown3
            app.DropDown3 = uidropdown(app.Tab5);
            app.DropDown3.Items = {'Endurecido Interno', 'Enducrecido por llama', 'Templado, revenido y recocido', 'Carburizado', 'Nitrado'};
            app.DropDown3.ValueChangedFcn = createCallbackFcn(app, @DropDown3ValueChanged, true);
            app.DropDown3.FontName = 'Times';
            app.DropDown3.Position = [231 201 107 22];
            app.DropDown3.Value = 'Endurecido Interno';

            % Create SacPicaduraLabel
            app.SacPicaduraLabel = uilabel(app.Tab5);
            app.SacPicaduraLabel.FontName = 'Times';
            app.SacPicaduraLabel.Position = [46 129 101 22];
            app.SacPicaduraLabel.Text = 'Sac Picadura [MPa]';

            % Create EditField31
            app.EditField31 = uieditfield(app.Tab5, 'numeric');
            app.EditField31.FontName = 'Times';
            app.EditField31.Position = [231 129 107 22];

            % Create DropDown4
            app.DropDown4 = uidropdown(app.Tab5);
            app.DropDown4.Items = {'Endurecido Interno', 'Enducrecido por llama', 'Templado, revenido y recocido', 'Carburizado', 'Nitrado'};
            app.DropDown4.ValueChangedFcn = createCallbackFcn(app, @DropDown4ValueChanged, true);
            app.DropDown4.FontName = 'Times';
            app.DropDown4.Position = [414 201 107 22];
            app.DropDown4.Value = 'Endurecido Interno';

            % Create StFlexionMPaLabel
            app.StFlexionMPaLabel = uilabel(app.Tab5);
            app.StFlexionMPaLabel.FontName = 'Times';
            app.StFlexionMPaLabel.Position = [46 93 88 22];
            app.StFlexionMPaLabel.Text = 'St Flexion [MPa]';

            % Create EditField32
            app.EditField32 = uieditfield(app.Tab5, 'numeric');
            app.EditField32.FontName = 'Times';
            app.EditField32.Position = [231 93 107 22];

            % Create EditField33
            app.EditField33 = uieditfield(app.Tab5, 'numeric');
            app.EditField33.FontName = 'Times';
            app.EditField33.Position = [414 129 107 22];

            % Create EditField34
            app.EditField34 = uieditfield(app.Tab5, 'numeric');
            app.EditField34.FontName = 'Times';
            app.EditField34.Position = [414 93 107 22];

            % Create Image7
            app.Image7 = uiimage(app.Tab5);
            app.Image7.Position = [864 449 466 214];
            app.Image7.ImageSource = fullfile(pathToMLAPP, 'M4RSC', 'Madrid.png');

            % Create DurezaHBLabel
            app.DurezaHBLabel = uilabel(app.Tab5);
            app.DurezaHBLabel.FontName = 'Times';
            app.DurezaHBLabel.Position = [46 165 67 22];
            app.DurezaHBLabel.Text = 'Dureza [HB]';

            % Create EditField35
            app.EditField35 = uieditfield(app.Tab5, 'numeric');
            app.EditField35.ValueChangedFcn = createCallbackFcn(app, @EditField35ValueChanged, true);
            app.EditField35.FontName = 'Times';
            app.EditField35.Position = [231 165 107 22];

            % Create EditField36
            app.EditField36 = uieditfield(app.Tab5, 'numeric');
            app.EditField36.ValueChangedFcn = createCallbackFcn(app, @EditField36ValueChanged, true);
            app.EditField36.FontName = 'Times';
            app.EditField36.Position = [414 165 107 22];

            % Create CargaenelMotorDropDownLabel
            app.CargaenelMotorDropDownLabel = uilabel(app.Tab5);
            app.CargaenelMotorDropDownLabel.FontName = 'Times';
            app.CargaenelMotorDropDownLabel.Position = [572 449 102 22];
            app.CargaenelMotorDropDownLabel.Text = 'Carga en el Motor';

            % Create DropDown5
            app.DropDown5 = uidropdown(app.Tab5);
            app.DropDown5.Items = {'Uniforme', 'Impactos Leves', 'Impactos Moderados', 'Impactos Fuertes'};
            app.DropDown5.FontName = 'Times';
            app.DropDown5.Position = [726 449 107 22];
            app.DropDown5.Value = 'Uniforme';

            % Create CargaenlaMaquinaDropDownLabel
            app.CargaenlaMaquinaDropDownLabel = uilabel(app.Tab5);
            app.CargaenlaMaquinaDropDownLabel.FontName = 'Times';
            app.CargaenlaMaquinaDropDownLabel.Position = [572 417 117 22];
            app.CargaenlaMaquinaDropDownLabel.Text = 'Carga en la Maquina';

            % Create DropDown6
            app.DropDown6 = uidropdown(app.Tab5);
            app.DropDown6.Items = {'Uniforme', 'Impactos Leves', 'Impactos Moderados', 'Impactos Fuertes'};
            app.DropDown6.FontName = 'Times';
            app.DropDown6.Position = [726 417 107 22];
            app.DropDown6.Value = 'Uniforme';

            % Create CalidadLabel
            app.CalidadLabel = uilabel(app.Tab5);
            app.CalidadLabel.FontName = 'Times';
            app.CalidadLabel.Position = [46 57 50 22];
            app.CalidadLabel.Text = 'Calidad ';

            % Create DropDown7
            app.DropDown7 = uidropdown(app.Tab5);
            app.DropDown7.Items = {'A12', 'A11', 'A10', 'A9', 'A8', 'A7', 'A6', 'A5', 'A4', 'A3', 'A2'};
            app.DropDown7.FontName = 'Times';
            app.DropDown7.Position = [231 57 107 22];
            app.DropDown7.Value = 'A12';

            % Create DropDown8
            app.DropDown8 = uidropdown(app.Tab5);
            app.DropDown8.Items = {'A12', 'A11', 'A10', 'A9', 'A8', 'A7', 'A6', 'A5', 'A4', 'A3', 'A2'};
            app.DropDown8.FontName = 'Times';
            app.DropDown8.Position = [414 57 107 22];
            app.DropDown8.Value = 'A12';

            % Create ConfiabilidadLabel
            app.ConfiabilidadLabel = uilabel(app.Tab5);
            app.ConfiabilidadLabel.FontName = 'Times';
            app.ConfiabilidadLabel.Position = [46 21 92 22];
            app.ConfiabilidadLabel.Text = 'Confiabilidad [%]';

            % Create EditField37
            app.EditField37 = uieditfield(app.Tab5, 'numeric');
            app.EditField37.FontName = 'Times';
            app.EditField37.Position = [231 21 107 22];

            % Create EditField38
            app.EditField38 = uieditfield(app.Tab5, 'numeric');
            app.EditField38.FontName = 'Times';
            app.EditField38.Position = [414 21 107 22];

            % Create TemperaturadeOperacionCLabel
            app.TemperaturadeOperacionCLabel = uilabel(app.Tab5);
            app.TemperaturadeOperacionCLabel.FontName = 'Times';
            app.TemperaturadeOperacionCLabel.Position = [572 641 155 22];
            app.TemperaturadeOperacionCLabel.Text = 'Temperatura de Operacion [ºC]';

            % Create EditField39
            app.EditField39 = uieditfield(app.Tab5, 'numeric');
            app.EditField39.FontName = 'Times';
            app.EditField39.Position = [726 641 107 22];

            % Create AnchodelDientemmLabel
            app.AnchodelDientemmLabel = uilabel(app.Tab5);
            app.AnchodelDientemmLabel.FontName = 'Times';
            app.AnchodelDientemmLabel.Position = [46 309 119 22];
            app.AnchodelDientemmLabel.Text = 'Ancho del Diente [mm]';

            % Create EditField40
            app.EditField40 = uieditfield(app.Tab5, 'numeric');
            app.EditField40.ValueChangedFcn = createCallbackFcn(app, @EditField40ValueChanged, true);
            app.EditField40.FontName = 'Times';
            app.EditField40.Position = [231 309 107 22];

            % Create MaterialLabel
            app.MaterialLabel = uilabel(app.Tab5);
            app.MaterialLabel.FontName = 'Times';
            app.MaterialLabel.Position = [46 237 46 22];
            app.MaterialLabel.Text = 'Material';

            % Create DropDown9
            app.DropDown9 = uidropdown(app.Tab5);
            app.DropDown9.Items = {'Acero', 'Hierro Maleable', 'Hierro Nodular', 'Hierro Fundido', 'Bronce de Aluminio', 'Bronce de Estaño'};
            app.DropDown9.FontName = 'Times';
            app.DropDown9.Position = [231 237 107 22];
            app.DropDown9.Value = 'Acero';

            % Create DropDown10
            app.DropDown10 = uidropdown(app.Tab5);
            app.DropDown10.Items = {'Acero', 'Hierro Maleable', 'Hierro Nodular', 'Hierro Fundido', 'Bronce de Aluminio', 'Bronce de Estaño'};
            app.DropDown10.FontName = 'Times';
            app.DropDown10.Position = [414 237 107 22];
            app.DropDown10.Value = 'Acero';

            % Create AngulodePresionLabel
            app.AngulodePresionLabel = uilabel(app.Tab5);
            app.AngulodePresionLabel.FontName = 'Times';
            app.AngulodePresionLabel.Position = [572 513 109 22];
            app.AngulodePresionLabel.Text = 'Angulo de Presión [º]';

            % Create DropDown11
            app.DropDown11 = uidropdown(app.Tab5);
            app.DropDown11.Items = {'14.5', '20', '25'};
            app.DropDown11.FontName = 'Times';
            app.DropDown11.Position = [726 513 107 22];
            app.DropDown11.Value = '14.5';

            % Create RelaciondeTransmicionEditFieldLabel
            app.RelaciondeTransmicionEditFieldLabel = uilabel(app.Tab5);
            app.RelaciondeTransmicionEditFieldLabel.FontName = 'Times';
            app.RelaciondeTransmicionEditFieldLabel.Position = [572 609 137 22];
            app.RelaciondeTransmicionEditFieldLabel.Text = 'Relacion de Transmicion';

            % Create EditField41
            app.EditField41 = uieditfield(app.Tab5, 'numeric');
            app.EditField41.FontName = 'Times';
            app.EditField41.Position = [726 609 107 22];

            % Create AngulodeHliceLabel
            app.AngulodeHliceLabel = uilabel(app.Tab5);
            app.AngulodeHliceLabel.FontName = 'Times';
            app.AngulodeHliceLabel.Position = [572 481 104 22];
            app.AngulodeHliceLabel.Text = 'Angulo de Hélice [º]';

            % Create EditField42
            app.EditField42 = uieditfield(app.Tab5, 'numeric');
            app.EditField42.Editable = 'off';
            app.EditField42.FontName = 'Times';
            app.EditField42.Position = [726 481 107 22];

            % Create ModuloEditFieldLabel
            app.ModuloEditFieldLabel = uilabel(app.Tab5);
            app.ModuloEditFieldLabel.FontName = 'Times';
            app.ModuloEditFieldLabel.Position = [46 381 45 22];
            app.ModuloEditFieldLabel.Text = 'Modulo';

            % Create EditField43
            app.EditField43 = uieditfield(app.Tab5, 'numeric');
            app.EditField43.ValueChangedFcn = createCallbackFcn(app, @EditField43ValueChanged, true);
            app.EditField43.FontName = 'Times';
            app.EditField43.Position = [231 381 107 22];

            % Create NumerodeDientesEditFieldLabel
            app.NumerodeDientesEditFieldLabel = uilabel(app.Tab5);
            app.NumerodeDientesEditFieldLabel.FontName = 'Times';
            app.NumerodeDientesEditFieldLabel.Position = [46 345 109 22];
            app.NumerodeDientesEditFieldLabel.Text = 'Numero de Dientes';

            % Create EditField44
            app.EditField44 = uieditfield(app.Tab5, 'numeric');
            app.EditField44.ValueChangedFcn = createCallbackFcn(app, @EditField44ValueChanged, true);
            app.EditField44.FontName = 'Times';
            app.EditField44.Position = [231 345 107 22];

            % Create RPMEditFieldLabel
            app.RPMEditFieldLabel = uilabel(app.Tab5);
            app.RPMEditFieldLabel.FontName = 'Times';
            app.RPMEditFieldLabel.Position = [46 273 30 22];
            app.RPMEditFieldLabel.Text = 'RPM';

            % Create EditField45
            app.EditField45 = uieditfield(app.Tab5, 'numeric');
            app.EditField45.FontName = 'Times';
            app.EditField45.Position = [231 273 107 22];

            % Create CiclosdeVidaLabel
            app.CiclosdeVidaLabel = uilabel(app.Tab5);
            app.CiclosdeVidaLabel.FontName = 'Times';
            app.CiclosdeVidaLabel.Position = [572 577 75 22];
            app.CiclosdeVidaLabel.Text = 'Ciclos de Vida';

            % Create EditField46
            app.EditField46 = uieditfield(app.Tab5, 'numeric');
            app.EditField46.FontName = 'Times';
            app.EditField46.Position = [726 577 107 22];

            % Create Label18
            app.Label18 = uilabel(app.Tab5);
            app.Label18.FontName = 'Times';
            app.Label18.FontSize = 25;
            app.Label18.Position = [42 679 331 33];
            app.Label18.Text = {'Módulo de engranajes [AGMA]'; ''};

            % Create Label19
            app.Label19 = uilabel(app.Tab5);
            app.Label19.FontName = 'Times';
            app.Label19.FontSize = 15;
            app.Label19.FontWeight = 'bold';
            app.Label19.Position = [266 419 43 22];
            app.Label19.Text = 'Piñón';

            % Create Label20
            app.Label20 = uilabel(app.Tab5);
            app.Label20.FontName = 'Times';
            app.Label20.FontSize = 15;
            app.Label20.FontWeight = 'bold';
            app.Label20.Position = [438 419 66 22];
            app.Label20.Text = 'Engrane';

            % Create Image8
            app.Image8 = uiimage(app.Tab5);
            app.Image8.Position = [36 539 112 121];
            app.Image8.ImageSource = fullfile(pathToMLAPP, 'M4RSC', 'recto2.png');

            % Create Image9
            app.Image9 = uiimage(app.Tab5);
            app.Image9.Position = [166 539 112 121];
            app.Image9.ImageSource = fullfile(pathToMLAPP, 'M4RSC', 'helic.png');

            % Create Image10
            app.Image10 = uiimage(app.Tab5);
            app.Image10.Position = [290 539 112 121];
            app.Image10.ImageSource = fullfile(pathToMLAPP, 'M4RSC', 'bihelicoidales.png');

            % Create Image11
            app.Image11 = uiimage(app.Tab5);
            app.Image11.Position = [413 539 112 121];
            app.Image11.ImageSource = fullfile(pathToMLAPP, 'M4RSC', 'conico2.png');

            % Create Label21
            app.Label21 = uilabel(app.Tab5);
            app.Label21.FontName = 'Times';
            app.Label21.FontSize = 15;
            app.Label21.Position = [66 500 46 22];
            app.Label21.Text = 'Rectos';

            % Create Label22
            app.Label22 = uilabel(app.Tab5);
            app.Label22.FontName = 'Times';
            app.Label22.FontSize = 15;
            app.Label22.Position = [187 500 80 22];
            app.Label22.Text = 'Helicoidales';

            % Create Label23
            app.Label23 = uilabel(app.Tab5);
            app.Label23.FontName = 'Times';
            app.Label23.FontSize = 15;
            app.Label23.Position = [301 500 91 22];
            app.Label23.Text = 'Bihelicoidales';

            % Create Label24
            app.Label24 = uilabel(app.Tab5);
            app.Label24.FontName = 'Times';
            app.Label24.FontSize = 15;
            app.Label24.Position = [441 500 60 22];
            app.Label24.Text = 'Cónicos';

            % Create EditField47
            app.EditField47 = uieditfield(app.Tab5, 'numeric');
            app.EditField47.Editable = 'off';
            app.EditField47.FontName = 'Times';
            app.EditField47.Position = [414 273 107 22];

            % Create EditField48
            app.EditField48 = uieditfield(app.Tab5, 'numeric');
            app.EditField48.Editable = 'off';
            app.EditField48.FontName = 'Times';
            app.EditField48.Position = [414 309 107 22];

            % Create EditField49
            app.EditField49 = uieditfield(app.Tab5, 'numeric');
            app.EditField49.Editable = 'off';
            app.EditField49.FontName = 'Times';
            app.EditField49.Position = [414 345 107 22];

            % Create EditField50
            app.EditField50 = uieditfield(app.Tab5, 'numeric');
            app.EditField50.Editable = 'off';
            app.EditField50.FontName = 'Times';
            app.EditField50.Position = [414 381 107 22];

            % Create Label25
            app.Label25 = uilabel(app.Tab5);
            app.Label25.FontName = 'Times';
            app.Label25.FontSize = 15;
            app.Label25.FontWeight = 'bold';
            app.Label25.Position = [46 455 222 22];
            app.Label25.Text = 'Parametros de los Engranajes';

            % Create Label26
            app.Label26 = uilabel(app.Tab5);
            app.Label26.FontName = 'Times';
            app.Label26.FontSize = 15;
            app.Label26.FontWeight = 'bold';
            app.Label26.Position = [46 419 80 22];
            app.Label26.Text = 'Parametro';

            % Create TipodeEngranajesDropDownLabel
            app.TipodeEngranajesDropDownLabel = uilabel(app.Tab5);
            app.TipodeEngranajesDropDownLabel.FontName = 'Times';
            app.TipodeEngranajesDropDownLabel.Position = [572 545 98 22];
            app.TipodeEngranajesDropDownLabel.Text = 'Tipo de Engranajes';

            % Create DropDown12
            app.DropDown12 = uidropdown(app.Tab5);
            app.DropDown12.Items = {'Rectos', 'Helicoidales', 'Bihelicoidales', 'Conicos Rectos'};
            app.DropDown12.ValueChangedFcn = createCallbackFcn(app, @DropDown12ValueChanged, true);
            app.DropDown12.FontName = 'Times';
            app.DropDown12.Position = [726 545 107 22];
            app.DropDown12.Value = 'Rectos';

            % Create UITable7
            app.UITable7 = uitable(app.Tab5);
            app.UITable7.ColumnName = {'Piñon'; 'Engrane'};
            app.UITable7.RowName = {'Ze'; 'Ko'; 'Kv'; 'Ks'; 'Kh'; 'Zr'; 'Zi'; 'Zn'; 'Zw'; 'Sh'; 'Yo'; 'Yz'};
            app.UITable7.ColumnEditable = true;
            app.UITable7.FontName = 'Times';
            app.UITable7.Position = [571 187 262 115];

            % Create Label27
            app.Label27 = uilabel(app.Tab5);
            app.Label27.FontName = 'Times';
            app.Label27.FontSize = 15;
            app.Label27.FontWeight = 'bold';
            app.Label27.Position = [572 347 75 22];
            app.Label27.Text = 'Resultados';

            % Create Button3
            app.Button3 = uibutton(app.Tab5, 'push');
            app.Button3.ButtonPushedFcn = createCallbackFcn(app, @Button3Pushed, true);
            app.Button3.FontName = 'Times';
            app.Button3.Position = [727 346 107 23];
            app.Button3.Text = 'Calcular';

            % Create UITable8
            app.UITable8 = uitable(app.Tab5);
            app.UITable8.ColumnName = {'Piñon'; 'Engrane'};
            app.UITable8.RowName = {'Ko'; 'Kv'; 'Ks'; 'Kh'; 'Kb'; 'Yj'; 'Yn'; 'Sf'; 'Yo'; 'Yz'};
            app.UITable8.ColumnEditable = true;
            app.UITable8.FontName = 'Times';
            app.UITable8.Position = [571 21 262 115];

            % Create Label28
            app.Label28 = uilabel(app.Tab5);
            app.Label28.FontName = 'Times';
            app.Label28.FontWeight = 'bold';
            app.Label28.Position = [571 312 193 22];
            app.Label28.Text = 'Factores de Picadura Superficial';

            % Create Label29
            app.Label29 = uilabel(app.Tab5);
            app.Label29.FontName = 'Times';
            app.Label29.FontWeight = 'bold';
            app.Label29.Position = [571 144 105 22];
            app.Label29.Text = 'Factores de Flexion';

            % Create PotenciadelPionkWLabel
            app.PotenciadelPionkWLabel = uilabel(app.Tab5);
            app.PotenciadelPionkWLabel.FontName = 'Times';
            app.PotenciadelPionkWLabel.Position = [572 385 123 22];
            app.PotenciadelPionkWLabel.Text = 'Potencia del Piñon [kW]';

            % Create EditField51
            app.EditField51 = uieditfield(app.Tab5, 'numeric');
            app.EditField51.FontName = 'Times';
            app.EditField51.Position = [726 385 107 22];

            % Create UITable9
            app.UITable9 = uitable(app.Tab5);
            app.UITable9.ColumnName = {'Piñon'; 'Engrane'};
            app.UITable9.RowName = {'Fuerza Axial (N)'; 'Fuerza Radial (N)'; 'Fuerza Tangencial (N)'; 'Torque (N.m)'};
            app.UITable9.FontName = 'Times';
            app.UITable9.Position = [864 187 466 115];

            % Create UITable10
            app.UITable10 = uitable(app.Tab5);
            app.UITable10.ColumnName = {'Piñon'; 'Engrane'};
            app.UITable10.RowName = {'Esfuerzo Admisible por Picadura (MPa)'; 'Esfuerzo Admisible por Flexion (MPa)'; 'Esfuerzo por Picadura (MPa)'; 'Esfuerzo por Flexion (MPa)'; 'Potencia por Picadura (W)'; 'Potencia por Flexion (W)'; 'FS por Picadura'; 'FS por Flexion'; 'Potencia (W)'};
            app.UITable10.FontName = 'Times';
            app.UITable10.Position = [864 20 466 116];

            % Create Label30
            app.Label30 = uilabel(app.Tab5);
            app.Label30.FontName = 'Times';
            app.Label30.FontWeight = 'bold';
            app.Label30.Position = [864 309 209 22];
            app.Label30.Text = 'Fuerzas y Torques sobre los Engranajes';

            % Create Label31
            app.Label31 = uilabel(app.Tab5);
            app.Label31.FontName = 'Times';
            app.Label31.FontWeight = 'bold';
            app.Label31.Position = [864 144 316 22];
            app.Label31.Text = 'Esfuerzos y Potencias Admisibles por los Engranajes';

            % Create DedendummmLabel
            app.DedendummmLabel = uilabel(app.Tab5);
            app.DedendummmLabel.HorizontalAlignment = 'right';
            app.DedendummmLabel.FontName = 'Times';
            app.DedendummmLabel.Position = [951 380 87 22];
            app.DedendummmLabel.Text = 'Dedendum [mm]';

            % Create EditField57
            app.EditField57 = uieditfield(app.Tab5, 'numeric');
            app.EditField57.FontName = 'Times';
            app.EditField57.Position = [1075 380 51 22];

            % Create DistanciaentreCentrosLabel
            app.DistanciaentreCentrosLabel = uilabel(app.Tab5);
            app.DistanciaentreCentrosLabel.FontName = 'Times';
            app.DistanciaentreCentrosLabel.Position = [1131 348 147 22];
            app.DistanciaentreCentrosLabel.Text = 'Distancia entre Centros [mm]';

            % Create EditField52
            app.EditField52 = uieditfield(app.Tab5, 'numeric');
            app.EditField52.Editable = 'off';
            app.EditField52.FontName = 'Times';
            app.EditField52.Position = [1277 348 51 22];

            % Create AdemdumLabel
            app.AdemdumLabel = uilabel(app.Tab5);
            app.AdemdumLabel.HorizontalAlignment = 'right';
            app.AdemdumLabel.FontName = 'Times';
            app.AdemdumLabel.Position = [951 412 85 22];
            app.AdemdumLabel.Text = 'Ademdum [mm]';

            % Create EditField53
            app.EditField53 = uieditfield(app.Tab5, 'numeric');
            app.EditField53.FontName = 'Times';
            app.EditField53.Position = [1075 412 51 22];

            % Create AlturadelDienteLabel_2
            app.AlturadelDienteLabel_2 = uilabel(app.Tab5);
            app.AlturadelDienteLabel_2.HorizontalAlignment = 'right';
            app.AlturadelDienteLabel_2.FontName = 'Times';
            app.AlturadelDienteLabel_2.Position = [951 348 118 22];
            app.AlturadelDienteLabel_2.Text = 'Altura del Diente [mm]';

            % Create EditField54
            app.EditField54 = uieditfield(app.Tab5, 'numeric');
            app.EditField54.FontName = 'Times';
            app.EditField54.Position = [1075 348 51 22];

            % Create EspesordelaRuedaLabel
            app.EspesordelaRuedaLabel = uilabel(app.Tab5);
            app.EspesordelaRuedaLabel.FontName = 'Times';
            app.EspesordelaRuedaLabel.Position = [1131 380 132 22];
            app.EspesordelaRuedaLabel.Text = 'Espesor de la Rueda [mm]';

            % Create EditField55
            app.EditField55 = uieditfield(app.Tab5, 'numeric');
            app.EditField55.FontName = 'Times';
            app.EditField55.Position = [1277 380 51 22];

            % Create AlturadeTrabajoLabel
            app.AlturadeTrabajoLabel = uilabel(app.Tab5);
            app.AlturadeTrabajoLabel.FontName = 'Times';
            app.AlturadeTrabajoLabel.Position = [1131 412 119 22];
            app.AlturadeTrabajoLabel.Text = 'Altura de Trabajo [mm]';

            % Create EditField56
            app.EditField56 = uieditfield(app.Tab5, 'numeric');
            app.EditField56.FontName = 'Times';
            app.EditField56.Position = [1277 412 51 22];

            % Create Label32
            app.Label32 = uilabel(app.Tab5);
            app.Label32.FontName = 'Times';
            app.Label32.FontSize = 15;
            app.Label32.FontWeight = 'bold';
            app.Label32.Position = [864 347 97 37];
            app.Label32.Text = {'Parametros'; 'Geometricos'};

            % Create DropDown13
            app.DropDown13 = uidropdown(app.Tab5);
            app.DropDown13.Items = {'Tabla de Resistencias I', 'Tabla de Resistencias II', 'Geometria del Engranaje I', 'Geometria del Engranaje II', 'Factores de Seguridad'};
            app.DropDown13.ValueChangedFcn = createCallbackFcn(app, @DropDown13ValueChanged, true);
            app.DropDown13.FontName = 'Times';
            app.DropDown13.Position = [864 412 86 22];
            app.DropDown13.Value = 'Tabla de Resistencias I';

            % Create Button4
            app.Button4 = uibutton(app.Tab5, 'push');
            app.Button4.ButtonPushedFcn = createCallbackFcn(app, @Button4Pushed, true);
            app.Button4.Icon = fullfile(pathToMLAPP, 'M4RSC', 'engrane.gif');
            app.Button4.FontName = 'Times';
            app.Button4.Position = [1230 144 100 23];
            app.Button4.Text = 'Calcular';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Modulo4

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