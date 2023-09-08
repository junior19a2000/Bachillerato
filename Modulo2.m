classdef Modulo2 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        TabGroup                       matlab.ui.container.TabGroup
        Tab8                           matlab.ui.container.Tab
        Label44                        matlab.ui.control.Label
        CheckBox2                      matlab.ui.control.CheckBox
        EditField82                    matlab.ui.control.NumericEditField
        DistanciaentreEjesLabel        matlab.ui.control.Label
        DropDown27                     matlab.ui.control.DropDown
        LongituddelacorreaLabel        matlab.ui.control.Label
        Switch5                        matlab.ui.control.ToggleSwitch
        VerificarSwitchLabel           matlab.ui.control.Label
        EditField81                    matlab.ui.control.NumericEditField
        RPMdelamaquinaLabel            matlab.ui.control.Label
        Knob1                          matlab.ui.control.Knob
        ToleranciaKnobLabel            matlab.ui.control.Label
        Button17                       matlab.ui.control.Button
        EditField77                    matlab.ui.control.NumericEditField
        RPMdelaMaquinaLabel            matlab.ui.control.Label
        DropDown26                     matlab.ui.control.DropDown
        DiametrodelaPoleaMayorLabel_2  matlab.ui.control.Label
        DropDown25                     matlab.ui.control.DropDown
        DiametrodelaPoleaMenorLabel_2  matlab.ui.control.Label
        DropDown24                     matlab.ui.control.DropDown
        CorreaSKDropDownLabel          matlab.ui.control.Label
        Label43                        matlab.ui.control.Label
        UITable13                      matlab.ui.control.Table
        Switch4                        matlab.ui.control.Switch
        SentidodegiroLabel             matlab.ui.control.Label
        Button16                       matlab.ui.control.Button
        DropDown23                     matlab.ui.control.DropDown
        HorasdeTrabajoLabel            matlab.ui.control.Label
        Image22                        matlab.ui.control.Image
        Image21                        matlab.ui.control.Image
        Image20                        matlab.ui.control.Image
        EditField80                    matlab.ui.control.NumericEditField
        DistanciaVerticalentreEjesLabel  matlab.ui.control.Label
        EditField79                    matlab.ui.control.NumericEditField
        DistanciaHorizontalentreEjesLabel  matlab.ui.control.Label
        EditField78                    matlab.ui.control.NumericEditField
        RelaciondeTransmicionLabel     matlab.ui.control.Label
        EditField76                    matlab.ui.control.NumericEditField
        RPMdelMotorLabel               matlab.ui.control.Label
        EditField75                    matlab.ui.control.NumericEditField
        PotenciaLabel_2                matlab.ui.control.Label
        DropDown22                     matlab.ui.control.DropDown
        CaracteristicadelaMaquinaLabel_2  matlab.ui.control.Label
        DropDown21                     matlab.ui.control.DropDown
        CaracteristicadelMotorLabel_2  matlab.ui.control.Label
        UIAxes14                       matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            I3 = imshow('M2RSC/correasSK.png','Parent',app.UIAxes14);
            app.UIAxes14.XLim = [0 I3.XData(2)];
            app.UIAxes14.YLim = [0 I3.YData(2)];
            
            app.UITable13.Data                 = zeros(19,1);
            app.UITable13.RowName              = {'Factor de Servicio', 'Factor de Angulo de Contacto', 'Factor de Desarrollo', 'Recorrido Minimo de Ajuste X (mm)', 'Recorrido Minimo de Ajuste Y (mm)',...
                'Angulo de Contacto de la Polea Menor (º)', 'Angulo de COntacto de la Polea Mayor (º)', 'Potencia Nominal por Correa (kW)', 'Numero de Correas Trapeciales',...
                'Velocidad de la Correa (m/s)', 'Frecuencia de Flexion de la Correa (s^-1)', 'Fuerza Estatica Minima por Correa (N)', 'Fuerza Axial Estatica Minima (N)',...
                'Profundidad de hundimiento del ramal (mm)', 'Angulo de Desfase (º)', 'Fx (N)', 'Fy (N)', 'Fz (N)', 'Mx (N.m)'};
            dpr = [63 71 80 85 90 95 100 112 125 132 140 150 160 180 200];
            dpm = [40 45 50 56 63 67 71 75 80 85 90 95 100 106 112 118 125 132 140 150 160 170 180 190 200 212 224 250 280 300 315 355 400 450 500 560 630 710];
            ldc = [487 512 562 587 612 630 637 662 670 687 710 722 737 750 762 772 787 800 812 825 837 850 862 875 887 900 912 925 937 950 962 987 1000 1012 1024,...
                1037 1047 1060 1077 1087 1112 1120 1137 1162 1180 1187 1202 1212 1237 1250 1262 1287 1312 1320 1337 1347 1362 1387 1400 1412 1437 1462 1487 1500 1512 1537 1562 1587 1600 1612,...
                1637 1662 1687 1700 1737 1762 1787 1800 1812 1837 1862 1887 1900 1937 1987 2000 2037 2120 2137 2150 2187 2240 2287 2360 2500 2540 2650 2690 2800 2840 3000 3150 3350 3550];
            app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
            app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
            app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
            
        end

        % Value changed function: DropDown24
        function DropDown24ValueChanged(app, event)
            
            global dpm dpr
            switch app.DropDown24.Value
                case 'SPZ'
                    dpr = [63 71 80 85 90 95 100 112 125 132 140 150 160 180 200];
                    dpm = [40 45 50 56 63 67 71 75 80 85 90 95 100 106 112 118 125 132 140 150 160 170 180 190 200 212 224 250 280 300 315 355 400 450 500 560 630 710];
                    ldc = [487 512 562 587 612 630 637 662 670 687 710 722 737 750 762 772 787 800 812 825 837 850 862 875 887 900 912 925 937 950 962 987 1000 1012 1024,...
                        1037 1047 1060 1077 1087 1112 1120 1137 1162 1180 1187 1202 1212 1237 1250 1262 1287 1312 1320 1337 1347 1362 1387 1400 1412 1437 1462 1487 1500 1512 1537 1562 1587 1600 1612,...
                        1637 1662 1687 1700 1737 1762 1787 1800 1812 1837 1862 1887 1900 1937 1987 2000 2037 2120 2137 2150 2187 2240 2287 2360 2500 2540 2650 2690 2800 2840 3000 3150 3350 3550];
                    app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
                    app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
                    app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
                case 'SPA'
                    dpr = [90 100 112 118 125 132 140 150 160 180 200 224 250 280 315];
                    dpm = [63 67 71 75 80 85 90 95 100 106 112 118 125 132 140 150 160 170 180 190 200 212 224 225 236 250 280 300 315 355 400 450 500 560 630 710 800 900 1000];
                    ldc = [732 757 782 800 807 832 850 857 882 900 907 932 950 957 982 1000 1007 1032 1060 1082 1107 1120 1132 1157 1180 1207 1232 1250 1257 1272 1282 1307 1320 1332 1357,...
                        1382 1400 1407 1432 1457 1482 1500 1507 1532 1557 1582 1600 1607 1632 1657 1682 1700 1707 1732 1757 1782 1800 1807 1832 1857 1882 1900 1907 1932 1957 1982 2000 2032 2057 2082,...
                        2120 2132 2182 2207 2232 2240 2282 2300 2307 2332 2360 2382 2432 2482 2500 2532 2582 2607 2632 2650 2682 2732 2782 2800 2832 2847 2882 2932 2982 3000 3032 3082 3150 3182 3282,...
                        3350 3382 3550 3750 4000 4250 4500];
                    app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
                    app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
                    app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
                case 'SPB'
                    dpr = [140 150 160 180 190 200 212 224 236 250 280 315 355 375 400];
                    dpm = [90 95 100 106 112 118 125 132 140:10:200 212 224 225 236 250 265 280 300 312 335 355 375 400 425 450 500 560 630 710 800 900 1000];
                    ldc = [1250 1320 1400 1450 1500 1600 1700 1750 1800 1850 1900 2000 2020 2060 2120 2150 2180 2240 2280 2360 2400 2500 2650 2680 2800 2840 2850 2900 3000 3150 3250 3350 3450 3550 3650,...
                        3750 3800 4000 4050 4250 4300 4500 4560 4750 4820 5000 5070 5300 5600 6000 6300 6700 7100 7500 8000];
                    app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
                    app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
                    app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
                case 'SPC'
                    dpr = [224 250 280 300 315 335 355 375 400 450 500 560 630 710];
                    dpm = [140 150 160 180 190 200 212 224 225 236 250 265 280 300 315 335 355 375 400 425 450 475 500 560 630 710 800 900 1000 1120 1250 1400 1600 1800 2000];
                    ldc = [2000 2120 2240 2360 2500 2650 2800 3000 3150 3350 3550 3750 4000 4250 4500 4750 5000 5300 5600 6000 6300 6700 7100 7500 8000 8500 9000 9500 10000 10600 11200 12500];
                    app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
                    app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
                    app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
            end
            
        end

        % Value changed function: DropDown25
        function DropDown25ValueChanged(app, event)
            
            global dpm
            P = str2double(app.DropDown25.Value) * app.EditField78.Value;
            P1= max(dpm(dpm <= P));
            P2= min(dpm(dpm >= P));
            if abs(P - P1) <= abs(P - P2)
                app.DropDown26.Value = num2str(P1);
            else
                app.DropDown26.Value = num2str(P2);
            end
            app.EditField78.Value = str2double(app.DropDown26.Value) / str2double(app.DropDown25.Value);
            app.EditField77.Value = app.EditField76.Value / app.EditField78.Value;
            
        end

        % Value changed function: DropDown26
        function DropDown26ValueChanged(app, event)
            
            app.EditField78.Value = str2double(app.DropDown26.Value) / str2double(app.DropDown25.Value);
            app.EditField77.Value = app.EditField76.Value / app.EditField78.Value;
            
        end

        % Button pushed function: Button17
        function Button17Pushed(app, event)
            
            global dpm dpr dp ldc
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Seleccionando correa optima';pause(2)
            
            cla(app.UIAxes14)
            syms x
            
            I = imshow('M2RSC/correasSK.png','Parent',app.UIAxes14);
            app.UIAxes14.XLim = [0 I.XData(2)];
            app.UIAxes14.YLim = [0 I.YData(2)];
            hold(app.UIAxes14,'on')
            
            xsk = [69.0000000000001	109.000000000000	150.000000000000	191.000000000000	230.000000000000	271.000000000000	311	352	393	433	474	515	556	596	636	676	717.000000000000	758.000000000000	799.000000000000	839.000000000000	879.000000000000	919.000000000000	959.000000000000	1000.00000000000];
            ysk = [520	483	447	410	375	339.000000000000	322.000000000000	303.000000000000	268.000000000000	231.000000000000	213.000000000000	195.000000000000	159.000000000000	123.000000000000	105.000000000000	87.0000000000001	51.0000000000001	15.0000000000001];
            xrk = [2 2.5 3.15 4 5 6.3 8 10 12.5 16 20 25 31.5 40 50 63 80 100 123 160 200 250 315 400];
            yrk = [200 250 315 400 500 630 700 800 950 1250 1450 1600 2000 2500 2850 3150 4000 5000];
            
            f1  = 6762608626984251/8796093022208 - (690112415233787*x)/562949953421312;
            f2  = 4270574849646133/4398046511104 - (67237*x)/57608;
            f3  = 1347775310181303/1099511627776 - (2555308240783501*x)/2251799813685248;
            ft  = [f1 f2 f3];
            
            switch app.DropDown21.Value
                case 'Par de Arranque Normal'
                    fc2 = [1.1 1.1 1.2;1.1 1.2 1.3;1.2 1.3 1.4;1.3 1.4 1.5];
                case 'Par de Arranque Elevado'
                    fc2 = [1.1 1.2 1.3;1.2 1.3 1.4;1.4 1.5 1.6;1.5 1.6 1.8];
            end
            switch app.DropDown22.Value
                case 'Transmicion Ligera'
                    fil = 1;
                case 'Transmicion Mediana'
                    fil = 2;
                case 'Transmicion Pesada'
                    fil = 3;
                case 'Transmicion muy Pesada'
                    fil = 4;
            end
            switch app.DropDown23.Value
                case 'Hasta 10 horas'
                    col = 1;
                case 'Mas de 10 pero menos de 16 horas'
                    col = 2;
                case 'Mas de 16 horas'
                    col = 3;
            end
            c2 = fc2(fil,col);
            x1 = app.EditField75.Value * c2;
            d1 = interp1(xrk,xsk,x1);
            d2 = interp1(yrk,ysk,app.EditField76.Value);
            
            d3 = double(subs(ft,d1));
            tc = {'SPZ' 'SPA' 'SPB' 'SPC'};
            tc = tc(find(d3 > d2,1));
            if isempty(tc)
                app.DropDown24.Value = 'SPC';
            else
                app.DropDown24.Value = char(tc);
            end
            
            switch app.DropDown24.Value
                case 'SPZ'
                    dpr = [63 71 80 85 90 95 100 112 125 132 140 150 160 180 200];
                    dpm = [40 45 50 56 63 67 71 75 80 85 90 95 100 106 112 118 125 132 140 150 160 170 180 190 200 212 224 250 280 300 315 355 400 450 500 560 630 710];
                    ldc = [487 512 562 587612 630 637 662 670 687 710 722 737 750 762 772 787 800 812 825 837 850 862 875 887 900 912 925 937 950 962 987 1000 1012 1024,...
                        1037 1047 1060 1077 1087 1112 1120 1137 1162 1180 1187 1202 1212 1237 1250 1262 1287 1312 1320 1337 1347 1362 1387 1400 1412 1437 1462 1487 1500 1512 1537 1562 1587 1600 1612,...
                        1637 1662 1687 1700 1737 1762 1787 1800 1812 1837 1862 1887 1900 1937 1987 2000 2037 2120 2137 2150 2187 2240 2287 2360 2500 2540 2650 2690 2800 2840 3000 3150 3350 3550];
                    app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
                    app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
                    app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
                case 'SPA'
                    dpr = [90 100 112 118 125 132 140 150 160 180 200 224 250 280 315];
                    dpm = [63 67 71 75 80 85 90 95 100 106 112 118 125 132 140 150 160 170 180 190 200 212 224 225 236 250 280 300 315 355 400 450 500 560 630 710 800 900 1000];
                    ldc = [732 757 782 800 807 832 850 857 882 900 907 932 950 957 982 1000 1007 1032 1060 1082 1107 1120 1132 1157 1180 1207 1232 1250 1257 1272 1282 1307 1320 1332 1357,...
                        1382 1400 1407 1432 1457 1482 1500 1507 1532 1557 1582 1600 1607 1632 1657 1682 1700 1707 1732 1757 1782 1800 1807 1832 1857 1882 1900 1907 1932 1957 1982 2000 2032 2057 2082,...
                        2120 2132 2182 2207 2232 2240 2282 2300 2307 2332 2360 2382 2432 2482 2500 2532 2582 2607 2632 2650 2682 2732 2782 2800 2832 2847 2882 2932 2982 3000 3032 3082 3150 3182 3282,...
                        3350 3382 3550 3750 4000 4250 4500];
                    app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
                    app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
                    app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
                case 'SPB'
                    dpr = [140 150 160 180 190 200 212 224 236 250 280 315 355 375 400];
                    dpm = [90 95 100 106 112 118 125 132 140:10:200 212 224 225 236 250 265 280 300 312 335 355 375 400 425 450 500 560 630 710 800 900 1000];
                    ldc = [1250 1320 1400 1450 1500 1600 1700 1750 1800 1850 1900 2000 2020 2060 2120 2150 2180 2240 2280 2360 2400 2500 2650 2680 2800 2840 2850 2900 3000 3150 3250 3350 3450 3550 3650,...
                        3750 3800 4000 4050 4250 4300 4500 4560 4750 4820 5000 5070 5300 5600 6000 6300 6700 7100 7500 8000];
                    app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
                    app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
                    app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
                case 'SPC'
                    dpr = [224 250 280 300 315 335 355 375 400 450 500 560 630 710];
                    dpm = [140 150 160 180 190 200 212 224 225 236 250 265 280 300 315 335 355 375 400 425 450 475 500 560 630 710 800 900 1000 1120 1250 1400 1600 1800 2000];
                    ldc = [2000 2120 2240 2360 2500 2650 2800 3000 3150 3350 3550 3750 4000 4250 4500 4750 5000 5300 5600 6000 6300 6700 7100 7500 8000 8500 9000 9500 10000 10600 11200 12500];
                    app.DropDown25.Items = arrayfun(@num2str,dpr,'un',0);
                    app.DropDown26.Items = arrayfun(@num2str,dpm,'un',0);
                    app.DropDown27.Items = arrayfun(@num2str,ldc,'un',0);
            end
            %             app.EditField78.Value = str2double(app.DropDown26.Value) / str2double(app.DropDown25.Value);
            %             app.EditField77.Value = app.EditField76.Value / app.EditField78.Value;
            
            %             L = 2 * sqrt(app.EditField79.Value^2 + app.EditField80.Value^2) + 1.57 * (str2double(app.DropDown26.Value) + str2double(app.DropDown25.Value)) + ((str2double(app.DropDown26.Value) - str2double(app.DropDown25.Value))^2)/(4 * sqrt(app.EditField79.Value^2 + app.EditField80.Value^2));
            %             L1= max(ldc(ldc <= L));
            %             L2= min(ldc(ldc >= L));
            %             if abs(L - L1) <= abs(L - L2)
            %                 app.DropDown27.Value = num2str(L1);
            %             else
            %                 app.DropDown27.Value = num2str(L2);
            %             end
            
            dp = drawpoint(app.UIAxes14,'Position',[d1 d2],'Color','r');
            comet(app.UIAxes14,[d1 d1],[520 15],0.9)
            comet(app.UIAxes14,[69 1000],[d2 d2],0.9)
            
            app.UITable13.Data(1,1) = c2;
            
            bar_pro.Message = 'Correa seleccionada exitosamente';pause(2)
            close(bar_pro)
            
        end

        % Value changed function: Switch5
        function Switch5ValueChanged(app, event)
            
            global dp ldc
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Verificando Velocidad y Frecuencia de flexion';pause(2)
            
            switch app.Switch5.Value
                case 'On'
                    if app.EditField77.Value > app.EditField81.Value - app.Knob1.Value && app.EditField77.Value < app.EditField81.Value + app.Knob1.Value
                        app.EditField77.BackgroundColor = [1 1 1];
                    else
                        app.EditField77.BackgroundColor = [1 0 0];
                    end
                    L = 2 * sqrt(app.EditField79.Value^2 + app.EditField80.Value^2) + 1.57 * (str2double(app.DropDown26.Value) + str2double(app.DropDown25.Value)) + ((str2double(app.DropDown26.Value) - str2double(app.DropDown25.Value))^2)/(4 * sqrt(app.EditField79.Value^2 + app.EditField80.Value^2));
                    L1= max(ldc(ldc <= L));
                    L2= min(ldc(ldc >= L));
                    if abs(L - L1) <= abs(L - L2)
                        app.DropDown27.Value = num2str(L1);
                    else
                        app.DropDown27.Value = num2str(L2);
                    end
                    app.EditField82.Value = (str2double(app.DropDown27.Value) - 0.5 * pi * (str2double(app.DropDown26.Value) + str2double(app.DropDown25.Value)))/4 + sqrt(((str2double(app.DropDown27.Value) - 0.5 * pi * (str2double(app.DropDown26.Value) + str2double(app.DropDown25.Value))) / 4)^2 - ((str2double(app.DropDown26.Value) - str2double(app.DropDown25.Value))^2) / 8);
                    v = (str2double(app.DropDown25.Value) * app.EditField76.Value) / 19100;
                    f = (2000 * v) / str2double(app.DropDown27.Value);
                    if v <= 45 && f < 100
                        dp.Label = 'La velocidad y frecuencia de flexion de la Correa son correctos';
                    else
                        dp.Label = 'La velocidad o frecuencia de flexion de la Correa esta fuera del rango permisible ';
                    end
            end
            app.Switch5.Value = 'Off';
            app.UITable13.Data(10,1) = v;
            app.UITable13.Data(11,1) = f;
            
            bar_pro.Message = 'Verificacion Finalizada';pause(2)
            close(bar_pro)
            
        end

        % Button pushed function: Button16
        function Button16Pushed(app, event)
            
            syms x1
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Calculando';pause(2)
            
            switch app.DropDown24.Value
                case 'SPZ'
                    ymi = [10 15 15 20 20 20 20 20 25 25 30 30 30 30];
                    ldc = [630 670 710 750 800 850 900 950 1000 1060 1120 1180 1250 1320 1400 1500 1600 1700 1800 1900 2000 2120 2240 2360 2500 2650 2800 3000 3150 3350 3550 3750 4000 4250 4500];
                    c3  = [0.83:0.01:0.96 0.98:0.01:1.13 1.15:0.01:1.19];
                    x   = [63 71 80 85 90 95 100 112 125 132 140 150 160 180 200];
                    z   = [0.5 0.68 0.88 1 1.11 1.22 1.33 1.6 1.88 2.03 2.2 2.42 2.63 3.05 3.47;...
                        0.63 0.87 1.14 1.29 1.44 1.59 1.74 2.08 2.46 2.66 2.89 3.17 3.45 4 4.54;...
                        0.87 1.23 1.62 1.84 2.06 2.27 2.49 3 3.54 3.83 4.16 4.56 4.96 5.75 6.51;...
                        1.38 2.03 2.74 3.13 3.52 3.9 4.27 5.15 6.07 6.55 7.08 7.72 8.34 9.5 10.55];
                    fip = [0.01 0.06 0.09 0.11;0.01 0.09 0.12 0.15;0.02 0.13 0.19 0.23;0.04 0.26 0.37 0.46];
                    k   = 0.074;
                    f   = - (7335865726165017*x1^3)/2417851639229258349412352 + (2438533562673395*x1^2)/295147905179352825856 - (5180313240213017*x1)/576460752303423488 + 8605862725467707/2251799813685248;
                case 'SPA'
                    ymi = [10 15 15 20 20 20 20 20 25 25 30 30 30 35];
                    ldc = [800 850 900 950 1000 1060 1120 1180 1250 1320 1400 1500 1600 1700 1800 1900 2000 2120 2240 2360 2500 2650 2800 3000 3150 3350 3550 3750 4000 4250 4500 4750 5000 5300 5600 6000];
                    c3  = [0.81:0.01:0.86 0.86 0.87:0.01:1.15];
                    x   = [90 100 112 118 125 132 140 150 160 180 200 224 250 280 315];
                    z   = [1.17 1.55 1.99 2.21 2.47 2.72 3.01 3.37 3.73 4.44 5.14 5.97 6.85 7.86 9.01;...
                        1.49 1.98 2.57 2.86 3.2 3.53 3.91 4.39 4.86 5.78 6.7 7.78 8.92 10.21 11.68;...
                        2.04 2.76 3.62 4.04 4.53 5.02 5.57 6.25 6.92 8.24 9.52 11.02 12.58 14.3 16.18;...
                        3.14 4.4 5.88 6.6 7.43 8.23 9.13 10.21 11.25 13.21 14.97 16.81 18.43 19.78 20.57];
                    fip = [0.02 0.15 0.21 0.26;0.03 0.2 0.29 0.36;0.05 0.31 0.44 0.54;0.09 0.61 0.87 1.07];
                    k   = 0.123;
                    f   = - (8899969440488079*x1^3)/9671406556917033397649408 + (622349025012727*x1^2)/147573952589676412928 - (2125913623823325*x1)/288230376151711744 + 5705052152119699/1125899906842624;
                case 'SPB'
                    ymi = [15 20 20 20 20 20 20 25 30 35 35 35 45 45];
                    ldc = [1250 1320 1400 1500 1600 1700 1800 1900 2000 2120 2240 2360 2500 2650 2800 3000 3150 3350 3550 3750 4000 4250 4500 4700 5000 5300 5600 6000 6300 6700 7100 7500 8000 8500 9000 9500 10000];
                    c3  = [0.83:0.01:0.93 0.93 0.94:0.01:1.04 1.04 1.05:0.01:1.17];
                    x   = [140 150 160 180 190 200 212 224 236 250 280 315 355 375 400];
                    z   = [3.46 4.04 4.62 5.77 6.34 6.91 7.59 8.26 8.92 9.7 11.33 13.21 15.3 16.33 17.59;...
                        4.42 5.19 5.95 7.46 8.2 8.94 9.82 10.69 11.56 12.56 14.66 17.04 19.67 20.94 22.5;...
                        6.09 7.2 8.29 10.44 11.49 12.53 13.76 14.96 16.15 17.5 20.3 23.36 26.59 28.08 29.83;...
                        9.07 10.83 12.53 15.71 17.18 18.57 20.13 21.57 22.87 24.21 26.4 27.68 33 36 39];
                    fip = [0.05 0.33 0.47 0.58;0.07 0.45 0.64 0.78;0.11 0.69 0.97 1.2;0.21 1.35 1.92 2.35];
                    k   = 0.195;
                    f   = - (3115913842744637*x1^3)/4835703278458516698824704 + (8653488753568381*x1^2)/2361183241434822606848 - (8935621972083699*x1)/1152921504606846976 + 867698691641363/140737488355328;
                case 'SPC'
                    ymi = [15 15 20 20 25 30 30 30 35 40 45 45 55 55];
                    ldc = [2000 2120 2240 2360 2500 2650 2800 3000 3150 3350 3550 3750 4000 4250 4500 4750 5000 5300 5600 6000 6300 6700 7100 7500 8000 8500 9000 9500 10000 10600 11200 11800 12500 13200 14000 15000];
                    c3  = [0.85 0.86 0.86:0.01:0.91 0.91 0.92:0.01:0.98 0.98 0.99:0.01:1.04 1.04:0.01:1.09 1.09 1.10:0.01:1.15];
                    x   = [224 250 280 300 315 335 355 375 400 450 500 560 630 710];
                    z   = [10.46 13.11 16.13 18.11 19.58 21.52 23.44 25.34 27.68 32.24 36.64 41.7 47.28 53.19;...
                        13.27 16.71 20.58 23.11 24.97 27.42 29.82 32.18 35.05 40.55 45.7 51.38 57.27 62.91;...
                        17.79 22.48 27.64 30.92 33.3 36.35 39.26 42.02 45.25 50.94 55.51 59.36 61.37 63.24;...
                        20.63 25.52 29.58 31.27 31.96 33 34 35 36 37 38 39 40 41];
                    fip = [0.14 0.9 1.28 1.57;0.19 1.22 1.73 2.13;0.29 1.86 2.65 3.25;0.57 3.67 5.2 6.38];
                    k   = 0.377;
                    f   = - (529477456896691*x1^3)/604462909807314587353088 + (640129173554453*x1^2)/147573952589676412928 - (4617824285029315*x1)/576460752303423488 + 2002362321571791/281474976710656;
            end
            
            app.EditField82.Value = (str2double(app.DropDown27.Value) - 0.5 * pi * (str2double(app.DropDown26.Value) + str2double(app.DropDown25.Value)))/4 + sqrt(((str2double(app.DropDown27.Value) - 0.5 * pi * (str2double(app.DropDown26.Value) + str2double(app.DropDown25.Value))) / 4)^2 - ((str2double(app.DropDown26.Value) - str2double(app.DropDown25.Value))^2) / 8);
            
            if app.EditField78.Value <= 1.06
                fip = fip(:,1);
            elseif app.EditField78.Value > 1.06 && app.EditField78.Value <= 1.27
                fip = fip(:,2);
            elseif app.EditField78.Value > 1.27 && app.EditField78.Value <= 1.57
                fip = fip(:,3);
            else
                fip = fip(:,4);
            end
            
            y   = [700 950 1450 2850];
            xmi = [10 15 20 25 25 35 45 55 70 85 110 135 150 190];
            lcm = [487 670 1000 1250 1800 2240 3000 4000 5000 6300 8000 10000 12500 15000;...
                670 1000 1250 1800 2240 3000 4000 5000 6300 8000 10000 12500 15000 18000]';
            for i = 1:length(lcm)
                if str2double(app.DropDown27.Value) > lcm(i,1) &&  str2double(app.DropDown27.Value) <= lcm(i,2)
                    xmi = xmi(i);
                    ymi = ymi(i);
                end
            end
            B1 = 2 * acosd((str2double(app.DropDown26.Value) - str2double(app.DropDown25.Value))/(2 * app.EditField82.Value));
            B2 = 2 * acosd((str2double(app.DropDown25.Value) - str2double(app.DropDown26.Value))/(2 * app.EditField82.Value));
            c1 = interp1([77 80 84 88 92 96 100 103 106 109 112 115 119 123 126 130 133 136 139 141 144 147 150 153 156 160 162 165 168 171 174 177 180],...
                [0.83 0.84 0.86 0.87 0.88 0.9 0.91 0.91 0.92 0.93 0.93 0.94 0.94 0.95 0.96 0.96 0.96 0.97 0.97 0.97 0.98 0.98 0.98 0.98 0.99 0.99 0.99 0.99 0.99 1 1 1 1],B1);
            c3 = interp1(ldc,c3,str2double(app.DropDown27.Value),'spline');
            Pn = interp2(x,y,z,str2double(app.DropDown25.Value),app.EditField76.Value) + interp1(y,fip',app.EditField76.Value);
            Nc = (app.EditField75.Value * app.UITable13.Data(1,1)) / (Pn * c1 * c3);
            
            if app.CheckBox2.Value
                pm = 1.3;
            else
                pm = 1;
            end
            
            T  = ((500 * (2.02 - c1) * app.UITable13.Data(1,1) * app.EditField75.Value)/(c1 * round(Nc) * app.UITable13.Data(10,1)) + k * app.UITable13.Data(10,1)^2) * pm;
            S  = (2 * T * sind(B1/2) * round(Nc)) * pm;
            E  = double(subs(f,T)) * app.EditField82.Value * sind(B1/2) * 0.01;
            
            phi = (360 - B2)/2;
            rho = acosd(app.EditField79.Value / (sqrt(app.EditField79.Value^2 + app.EditField80.Value^2)));
            bet = 90 + rho - phi;
            alf = 2 * rho - bet;
            
            Frs = T * round(Nc);
            Frc = ((app.EditField75.Value*30000)/(app.EditField77.Value * pi)) * (2000/str2double(app.DropDown26.Value)) + Frs;
            switch app.Switch4.Value
                case 'Horario'
                    Fy = Frc * cosd(alf) + Frs * cosd(bet);
                    Fz = Frc * sind(alf) + Frs * sind(bet);
                case 'Antihorario'
                    Fy = Frc * cosd(bet) + Frs * cosd(alf);
                    Fz = Frc * sind(bet) + Frs * sind(alf);
            end
            Tx = (Frc - Frs) * (str2double(app.DropDown26.Value) / 2000);
            
            app.UITable13.Data(2,1)  = c1;
            app.UITable13.Data(3,1)  = c3;
            app.UITable13.Data(4,1)  = xmi;
            app.UITable13.Data(5,1)  = ymi;
            app.UITable13.Data(6,1)  = B1;
            app.UITable13.Data(7,1)  = B2;
            app.UITable13.Data(8,1)  = Pn;
            app.UITable13.Data(9,1)  = Nc;
            app.UITable13.Data(12,1) = T;
            app.UITable13.Data(13,1) = S;
            app.UITable13.Data(14,1) = E;
            app.UITable13.Data(15,1) = rho;
            app.UITable13.Data(16,1) = S;
            app.UITable13.Data(17,1) = Fy;
            app.UITable13.Data(18,1) = Fz;
            app.UITable13.Data(19,1) = Tx;
            
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

            % Create Tab8
            app.Tab8 = uitab(app.TabGroup);
            app.Tab8.AutoResizeChildren = 'off';
            app.Tab8.Title = 'MODULO 2';
            app.Tab8.BackgroundColor = [1 1 1];

            % Create UIAxes14
            app.UIAxes14 = uiaxes(app.Tab8);
            app.UIAxes14.PlotBoxAspectRatio = [1.59803921568627 1 1];
            app.UIAxes14.XColor = 'none';
            app.UIAxes14.XTick = [];
            app.UIAxes14.XTickLabelRotation = 0;
            app.UIAxes14.YColor = 'none';
            app.UIAxes14.YTick = [];
            app.UIAxes14.YTickLabelRotation = 0;
            app.UIAxes14.ZTickLabelRotation = 0;
            app.UIAxes14.Color = 'none';
            app.UIAxes14.Position = [488 1 825 520];

            % Create CaracteristicadelMotorLabel_2
            app.CaracteristicadelMotorLabel_2 = uilabel(app.Tab8);
            app.CaracteristicadelMotorLabel_2.FontName = 'Times';
            app.CaracteristicadelMotorLabel_2.Position = [203 525 71 30];
            app.CaracteristicadelMotorLabel_2.Text = {'Característica'; 'del motor'};

            % Create DropDown21
            app.DropDown21 = uidropdown(app.Tab8);
            app.DropDown21.Items = {'Par de Arranque Normal', 'Par de Arranque Elevado'};
            app.DropDown21.FontName = 'Times';
            app.DropDown21.Position = [350 529 122 22];
            app.DropDown21.Value = 'Par de Arranque Normal';

            % Create CaracteristicadelaMaquinaLabel_2
            app.CaracteristicadelaMaquinaLabel_2 = uilabel(app.Tab8);
            app.CaracteristicadelaMaquinaLabel_2.FontName = 'Times';
            app.CaracteristicadelaMaquinaLabel_2.Position = [203 439 81 30];
            app.CaracteristicadelaMaquinaLabel_2.Text = {'Característica'; 'de la máquina'};

            % Create DropDown22
            app.DropDown22 = uidropdown(app.Tab8);
            app.DropDown22.Items = {'Transmicion Ligera', 'Transmicion Mediana', 'Transmicion Pesada', 'Transmicion muy Pesada'};
            app.DropDown22.FontName = 'Times';
            app.DropDown22.Position = [350 443 122 22];
            app.DropDown22.Value = 'Transmicion Ligera';

            % Create PotenciaLabel_2
            app.PotenciaLabel_2 = uilabel(app.Tab8);
            app.PotenciaLabel_2.FontName = 'Times';
            app.PotenciaLabel_2.Position = [203 609 75 22];
            app.PotenciaLabel_2.Text = 'Potencia [kW]';

            % Create EditField75
            app.EditField75 = uieditfield(app.Tab8, 'numeric');
            app.EditField75.FontName = 'Times';
            app.EditField75.Position = [350 609 122 22];

            % Create RPMdelMotorLabel
            app.RPMdelMotorLabel = uilabel(app.Tab8);
            app.RPMdelMotorLabel.FontName = 'Times';
            app.RPMdelMotorLabel.Position = [203 569 86 22];
            app.RPMdelMotorLabel.Text = 'RPM del motor';

            % Create EditField76
            app.EditField76 = uieditfield(app.Tab8, 'numeric');
            app.EditField76.FontName = 'Times';
            app.EditField76.Position = [350 569 122 22];

            % Create RelaciondeTransmicionLabel
            app.RelaciondeTransmicionLabel = uilabel(app.Tab8);
            app.RelaciondeTransmicionLabel.FontName = 'Times';
            app.RelaciondeTransmicionLabel.Position = [203 393 70 30];
            app.RelaciondeTransmicionLabel.Text = {'Relación de'; 'transmisión'};

            % Create EditField78
            app.EditField78 = uieditfield(app.Tab8, 'numeric');
            app.EditField78.FontName = 'Times';
            app.EditField78.Position = [350 397 122 22];

            % Create DistanciaHorizontalentreEjesLabel
            app.DistanciaHorizontalentreEjesLabel = uilabel(app.Tab8);
            app.DistanciaHorizontalentreEjesLabel.FontName = 'Times';
            app.DistanciaHorizontalentreEjesLabel.Position = [203 307 132 30];
            app.DistanciaHorizontalentreEjesLabel.Text = 'Distancia horizontal [mm]';

            % Create EditField79
            app.EditField79 = uieditfield(app.Tab8, 'numeric');
            app.EditField79.FontName = 'Times';
            app.EditField79.Position = [350 311 122 22];

            % Create DistanciaVerticalentreEjesLabel
            app.DistanciaVerticalentreEjesLabel = uilabel(app.Tab8);
            app.DistanciaVerticalentreEjesLabel.FontName = 'Times';
            app.DistanciaVerticalentreEjesLabel.Position = [203 261 119 30];
            app.DistanciaVerticalentreEjesLabel.Text = 'Distancia vertical [mm]';

            % Create EditField80
            app.EditField80 = uieditfield(app.Tab8, 'numeric');
            app.EditField80.FontName = 'Times';
            app.EditField80.Position = [350 265 122 22];

            % Create Image20
            app.Image20 = uiimage(app.Tab8);
            app.Image20.Position = [31 527 164 117];
            app.Image20.ImageSource = fullfile(pathToMLAPP, 'M2RSC', 'motor.png');

            % Create Image21
            app.Image21 = uiimage(app.Tab8);
            app.Image21.Position = [41 258 150 126];
            app.Image21.ImageSource = fullfile(pathToMLAPP, 'M2RSC', 'distancias.png');

            % Create Image22
            app.Image22 = uiimage(app.Tab8);
            app.Image22.Position = [31 391 157 123];
            app.Image22.ImageSource = fullfile(pathToMLAPP, 'M2RSC', 'Ventilador.png');

            % Create HorasdeTrabajoLabel
            app.HorasdeTrabajoLabel = uilabel(app.Tab8);
            app.HorasdeTrabajoLabel.FontName = 'Times';
            app.HorasdeTrabajoLabel.Position = [203 483 98 22];
            app.HorasdeTrabajoLabel.Text = 'Horas de trabajo';

            % Create DropDown23
            app.DropDown23 = uidropdown(app.Tab8);
            app.DropDown23.Items = {'Hasta 10 horas', 'Mas de 10 pero menos de 16 horas', 'Mas de 16 horas'};
            app.DropDown23.FontName = 'Times';
            app.DropDown23.Position = [350 483 122 22];
            app.DropDown23.Value = 'Hasta 10 horas';

            % Create Button16
            app.Button16 = uibutton(app.Tab8, 'push');
            app.Button16.ButtonPushedFcn = createCallbackFcn(app, @Button16Pushed, true);
            app.Button16.Icon = fullfile(pathToMLAPP, 'M2RSC', 'engrane.gif');
            app.Button16.FontName = 'Times';
            app.Button16.Position = [350 219 122 22];
            app.Button16.Text = 'Calcular';

            % Create SentidodegiroLabel
            app.SentidodegiroLabel = uilabel(app.Tab8);
            app.SentidodegiroLabel.HorizontalAlignment = 'center';
            app.SentidodegiroLabel.FontName = 'Times';
            app.SentidodegiroLabel.Position = [39 219 89 22];
            app.SentidodegiroLabel.Text = 'Sentido de giro';

            % Create Switch4
            app.Switch4 = uiswitch(app.Tab8, 'slider');
            app.Switch4.Items = {'Horario', 'Antihorario'};
            app.Switch4.FontName = 'Times';
            app.Switch4.Position = [204 220 45 20];
            app.Switch4.Value = 'Horario';

            % Create UITable13
            app.UITable13 = uitable(app.Tab8);
            app.UITable13.ColumnName = {'Resultados'};
            app.UITable13.RowName = {};
            app.UITable13.FontName = 'Times';
            app.UITable13.Position = [42 39 428 154];

            % Create Label43
            app.Label43 = uilabel(app.Tab8);
            app.Label43.FontName = 'Times';
            app.Label43.FontSize = 25;
            app.Label43.Position = [42 679 390 33];
            app.Label43.Text = 'Módulo de correas en V [OPTIBELT]';

            % Create CorreaSKDropDownLabel
            app.CorreaSKDropDownLabel = uilabel(app.Tab8);
            app.CorreaSKDropDownLabel.FontName = 'Times';
            app.CorreaSKDropDownLabel.Position = [509 609 56 22];
            app.CorreaSKDropDownLabel.Text = 'Correa SK';

            % Create DropDown24
            app.DropDown24 = uidropdown(app.Tab8);
            app.DropDown24.Items = {'SPZ', 'SPA', 'SPB', 'SPC'};
            app.DropDown24.ValueChangedFcn = createCallbackFcn(app, @DropDown24ValueChanged, true);
            app.DropDown24.FontName = 'Times';
            app.DropDown24.Position = [580 609 100 22];
            app.DropDown24.Value = 'SPZ';

            % Create DiametrodelaPoleaMenorLabel_2
            app.DiametrodelaPoleaMenorLabel_2 = uilabel(app.Tab8);
            app.DiametrodelaPoleaMenorLabel_2.FontName = 'Times';
            app.DiametrodelaPoleaMenorLabel_2.Position = [811 609 169 22];
            app.DiametrodelaPoleaMenorLabel_2.Text = 'Diámetro de la polea menor [mm]';

            % Create DropDown25
            app.DropDown25 = uidropdown(app.Tab8);
            app.DropDown25.Items = {};
            app.DropDown25.ValueChangedFcn = createCallbackFcn(app, @DropDown25ValueChanged, true);
            app.DropDown25.FontName = 'Times';
            app.DropDown25.Position = [981 609 100 22];
            app.DropDown25.Value = {};

            % Create DiametrodelaPoleaMayorLabel_2
            app.DiametrodelaPoleaMayorLabel_2 = uilabel(app.Tab8);
            app.DiametrodelaPoleaMayorLabel_2.FontName = 'Times';
            app.DiametrodelaPoleaMayorLabel_2.Position = [810 569 169 22];
            app.DiametrodelaPoleaMayorLabel_2.Text = 'Diámetro de la polea mayor [mm]';

            % Create DropDown26
            app.DropDown26 = uidropdown(app.Tab8);
            app.DropDown26.Items = {};
            app.DropDown26.ValueChangedFcn = createCallbackFcn(app, @DropDown26ValueChanged, true);
            app.DropDown26.FontName = 'Times';
            app.DropDown26.Position = [981 569 100 22];
            app.DropDown26.Value = {};

            % Create RPMdelaMaquinaLabel
            app.RPMdelaMaquinaLabel = uilabel(app.Tab8);
            app.RPMdelaMaquinaLabel.FontName = 'Times';
            app.RPMdelaMaquinaLabel.Position = [509 565 62 30];
            app.RPMdelaMaquinaLabel.Text = {'RPM de la'; 'máquina'};

            % Create EditField77
            app.EditField77 = uieditfield(app.Tab8, 'numeric');
            app.EditField77.Editable = 'off';
            app.EditField77.FontName = 'Times';
            app.EditField77.Position = [581 569 100 22];

            % Create Button17
            app.Button17 = uibutton(app.Tab8, 'push');
            app.Button17.ButtonPushedFcn = createCallbackFcn(app, @Button17Pushed, true);
            app.Button17.FontName = 'Times';
            app.Button17.Position = [701 608 94 23];
            app.Button17.Text = 'Definir';

            % Create ToleranciaKnobLabel
            app.ToleranciaKnobLabel = uilabel(app.Tab8);
            app.ToleranciaKnobLabel.HorizontalAlignment = 'center';
            app.ToleranciaKnobLabel.FontName = 'Times';
            app.ToleranciaKnobLabel.Position = [1129 614 55 22];
            app.ToleranciaKnobLabel.Text = 'Tolerancia';

            % Create Knob1
            app.Knob1 = uiknob(app.Tab8, 'continuous');
            app.Knob1.FontName = 'Times';
            app.Knob1.Position = [1128 543 57 57];

            % Create RPMdelamaquinaLabel
            app.RPMdelamaquinaLabel = uilabel(app.Tab8);
            app.RPMdelamaquinaLabel.FontName = 'Times';
            app.RPMdelamaquinaLabel.Position = [203 351 105 22];
            app.RPMdelamaquinaLabel.Text = 'RPM de la maquina';

            % Create EditField81
            app.EditField81 = uieditfield(app.Tab8, 'numeric');
            app.EditField81.FontName = 'Times';
            app.EditField81.Position = [350 351 122 22];

            % Create VerificarSwitchLabel
            app.VerificarSwitchLabel = uilabel(app.Tab8);
            app.VerificarSwitchLabel.HorizontalAlignment = 'center';
            app.VerificarSwitchLabel.FontName = 'Times';
            app.VerificarSwitchLabel.Position = [1230 616 49 22];
            app.VerificarSwitchLabel.Text = 'Verificar';

            % Create Switch5
            app.Switch5 = uiswitch(app.Tab8, 'toggle');
            app.Switch5.ValueChangedFcn = createCallbackFcn(app, @Switch5ValueChanged, true);
            app.Switch5.FontName = 'Times';
            app.Switch5.Position = [1244 548 20 45];

            % Create LongituddelacorreaLabel
            app.LongituddelacorreaLabel = uilabel(app.Tab8);
            app.LongituddelacorreaLabel.FontName = 'Times';
            app.LongituddelacorreaLabel.Position = [810 529 138 22];
            app.LongituddelacorreaLabel.Text = 'Longitud de la correa [mm]';

            % Create DropDown27
            app.DropDown27 = uidropdown(app.Tab8);
            app.DropDown27.Items = {};
            app.DropDown27.FontName = 'Times';
            app.DropDown27.Position = [981 529 100 22];
            app.DropDown27.Value = {};

            % Create DistanciaentreEjesLabel
            app.DistanciaentreEjesLabel = uilabel(app.Tab8);
            app.DistanciaentreEjesLabel.FontName = 'Times';
            app.DistanciaentreEjesLabel.Position = [509 525 77 30];
            app.DistanciaentreEjesLabel.Text = {'Distancia entre'; 'ejes [mm]'};

            % Create EditField82
            app.EditField82 = uieditfield(app.Tab8, 'numeric');
            app.EditField82.Editable = 'off';
            app.EditField82.FontName = 'Times';
            app.EditField82.Position = [581 529 100 22];

            % Create CheckBox2
            app.CheckBox2 = uicheckbox(app.Tab8);
            app.CheckBox2.Text = '';
            app.CheckBox2.Position = [741 530 25 22];

            % Create Label44
            app.Label44 = uilabel(app.Tab8);
            app.Label44.FontName = 'Times';
            app.Label44.Position = [707 569 87 22];
            app.Label44.Text = 'Primer Montaje';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Modulo2

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