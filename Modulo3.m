classdef Modulo3 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        Tab7                            matlab.ui.container.Tab
        Image17                         matlab.ui.control.Image
        Label42                         matlab.ui.control.Label
        CheckBox1                       matlab.ui.control.CheckBox
        EditField74                     matlab.ui.control.EditField
        TipodeLubricacionLabel          matlab.ui.control.Label
        EditField73                     matlab.ui.control.EditField
        PasodelacadenaLabel             matlab.ui.control.Label
        DropDown20                      matlab.ui.control.DropDown
        TipoDropDownLabel               matlab.ui.control.Label
        DropDown19                      matlab.ui.control.DropDown
        NormaDropDownLabel              matlab.ui.control.Label
        Switch3                         matlab.ui.control.Switch
        SentidodeGiroSwitchLabel_2      matlab.ui.control.Label
        Label41                         matlab.ui.control.Label
        Image19                         matlab.ui.control.Image
        Image18                         matlab.ui.control.Image
        EditField72                     matlab.ui.control.NumericEditField
        DistanciaentrecentrosverticalLabel  matlab.ui.control.Label
        UITable12                       matlab.ui.control.Table
        EditField70                     matlab.ui.control.NumericEditField
        RPMEditFieldLabel_2             matlab.ui.control.Label
        EditField69                     matlab.ui.control.NumericEditField
        PotenciakWLabel                 matlab.ui.control.Label
        EditField71                     matlab.ui.control.NumericEditField
        DistanciaentrecentroshorizontalLabel  matlab.ui.control.Label
        DropDown18                      matlab.ui.control.DropDown
        CaracteristicadelaMaquinaLabel  matlab.ui.control.Label
        DropDown17                      matlab.ui.control.DropDown
        CaracteristicadelMotorLabel     matlab.ui.control.Label
        EditField68                     matlab.ui.control.NumericEditField
        NumerodeDientesdelaCoronaLabel  matlab.ui.control.Label
        EditField67                     matlab.ui.control.NumericEditField
        NumerodeDientesdelPionLabel     matlab.ui.control.Label
        Button5                         matlab.ui.control.Button
        UIAxes13                        matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            I2 = imshow('M3RSC/ansi.png','Parent',app.UIAxes13);
            app.UIAxes13.XLim = [0 I2.XData(2)];
            app.UIAxes13.YLim = [0 I2.YData(2)];
            
            app.UITable12.Data                 = zeros(16,1);
            app.UITable12.RowName              = {'Relacion de Transmicion', 'Factor de Servicio', 'Factor de Dientes', 'Longitud de la Cadena (pasos)', 'Distancia entre Centros (mm)',...
                'Velocidad de la Cadena (m/s)', 'Fuerza Tangencial (N)', 'Fuerza Centripeta (N)', 'Factor de Seguridad', 'Presion de Contacto (MPa)',...
                'Angulo de Contacto de la Corona (º)', 'Angulo de Desfase (º)', 'Fx (N)', 'Fy (N)', 'Fz (N)', 'Torque (N.m)'};
            
        end

        % Button pushed function: Button5
        function Button5Pushed(app, event)
            
            syms x
            
            bar_pro = uiprogressdlg(app.UIFigure,'Title','Porfavor espere','Message','Iniciando Calculos','Indeterminate','on');
            bar_pro.Message = 'Calculando';pause(2)
            
            cla(app.UIAxes13)
            
            f1   = (5504412646287349*x^6)/2475880078570760549798248448 - (1094832308332115*x^5)/151115727451828646838272 + (5734977522332709*x^4)/590295810358705651712 - (7907234235072933*x^3)/1152921504606846976 + (6050486456208549*x^2)/2251799813685248 - (1219270376299303*x)/2199023255552 + 6562211562115593/137438953472;
            f2   = (8197348689024617*x^6)/39614081257132168796771975168 - (5128108490601379*x^5)/9671406556917033397649408 + (5237798816325737*x^4)/9444732965739290427392 - (5583538051842011*x^3)/18446744073709551616 + (3271403824035281*x^2)/36028797018963968 - (2093905877395595*x)/140737488355328 + 3645993863482015/2199023255552;
            f3   = (2747858956412185*x^6)/19807040628566084398385987584 - (5938075840561413*x^5)/19342813113834066795298816 + (5136088791045493*x^4)/18889465931478580854784 - (4536870154876333*x^3)/36893488147419103232 + (8606487034280221*x^2)/288230376151711744 - (308822735413773*x)/70368744177664 + 7858007637313231/8796093022208;
            f4   = (7512025359430989*x^6)/19807040628566084398385987584 - (68458726277739*x^5)/75557863725914323419136 + (1033033515537753*x^4)/1180591620717411303424 - (8035112247660091*x^3)/18446744073709551616 + (4229125541689571*x^2)/36028797018963968 - (593353255937325*x)/35184372088832 + 6794848683572751/4398046511104;
            f5   = (8522598725583911*x^6)/19807040628566084398385987584 - (2408591429558755*x^5)/2417851639229258349412352 + (8812327458078563*x^4)/9444732965739290427392 - (8323231772969815*x^3)/18446744073709551616 + (8533851201612011*x^2)/72057594037927936 - (2342725354679529*x)/140737488355328 + 3253148615790425/2199023255552;
            f6   = (873816993839205*x^6)/4951760157141521099596496896 - (7006858186372599*x^5)/19342813113834066795298816 + (2912850773912533*x^4)/9444732965739290427392 - (5208891974541671*x^3)/36893488147419103232 + (2665999714690229*x^2)/72057594037927936 - (3346185548762471*x)/562949953421312 + 7675939247200793/8796093022208;
            f7   = (8628999966905903*x^6)/39614081257132168796771975168 - (7515249578592705*x^5)/19342813113834066795298816 + (5098234054425197*x^4)/18889465931478580854784 - (6795177839695005*x^3)/73786976294838206464 + (4584808047274547*x^2)/288230376151711744 - (137577761557587*x)/70368744177664 + 4860403684921485/8796093022208;
            f8   = - (7578733895383813*x^6)/79228162514264337593543950336 + (2977278380268523*x^5)/9671406556917033397649408 - (815604218974681*x^4)/2361183241434822606848 + (6830246406791509*x^3)/36893488147419103232 - (1852643262250573*x^2)/36028797018963968 + (1810170116898805*x)/281474976710656 + 1613988255723849/17592186044416;
            f9   = (8685405917305987*x^6)/79228162514264337593543950336 - (5820481624162305*x^5)/38685626227668133590597632 + (5394132025756525*x^4)/75557863725914323419136 - (6722034354815229*x^3)/590295810358705651712 - (2292289382937301*x^2)/2305843009213693952 - (4093271207590295*x)/18014398509481984 + 3739772308654363/8796093022208;
            f10  = - (5270500249436613*x^6)/39614081257132168796771975168 + (8959070611942559*x^5)/19342813113834066795298816 - (2549251541530091*x^4)/4722366482869645213696 + (5484244300790595*x^3)/18446744073709551616 - (3046519593033047*x^2)/36028797018963968 + (1586042078132605*x)/140737488355328 - 8243403453341757/35184372088832;
            f11  = (5658177071273729*x^6)/9903520314283042199192993792 - (5166215827228589*x^5)/4835703278458516698824704 + (3868346587290373*x^4)/4722366482869645213696 - (94883001684875*x^3)/288230376151711744 + (5260352242334253*x^2)/72057594037927936 - (5159454846282123*x)/562949953421312 + 6911771939131817/8796093022208;
            f12  = (96*x)/127 + 478169889888109/8796093022208;
            f13  = (23*x)/34 - 2636653379073369/70368744177664;
            f14  = (121*x)/159 - 4840894754860459/17592186044416;
            
            f15 = (4938631369454709*x^6)/9903520314283042199192993792 - (8120456291679139*x^5)/4835703278458516698824704 + (5483967315112375*x^4)/2361183241434822606848 - (7780502613419483*x^3)/4611686018427387904 + (381820859649403*x^2)/562949953421312 - (5047805134694733*x)/35184372088832 + 7197916784964809/549755813888;
            f16 = (6752474062368089*x^6)/19807040628566084398385987584 - (4801609162082731*x^5)/4835703278458516698824704 + (1378623749712271*x^4)/1180591620717411303424 - (101987046049761*x^3)/144115188075855872 + (8375044306018749*x^2)/36028797018963968 - (5582035927580823*x)/140737488355328 + 3663738105843047/1099511627776;
            f17 = (6444574688762935*x^6)/39614081257132168796771975168 - (4089130018415029*x^5)/9671406556917033397649408 + (8279376128087533*x^4)/18889465931478580854784 - (4249622275881401*x^3)/18446744073709551616 + (1157194125528215*x^2)/18014398509481984 - (5321218877213581*x)/562949953421312 + 5013771525847441/4398046511104;
            f18 = (2135829940436945*x^6)/19807040628566084398385987584 - (5138495638629821*x^5)/19342813113834066795298816 + (1238828064823151*x^4)/4722366482869645213696 - (2440122755435283*x^3)/18446744073709551616 + (5149002663469767*x^2)/144115188075855872 - (6062893711320257*x)/1125899906842624 + 3926038367992707/4398046511104;
            f19 = (3147037820400163*x^6)/9903520314283042199192993792 - (1865431730791333*x^5)/2417851639229258349412352 + (1771989055299455*x^4)/2361183241434822606848 - (3433986641398533*x^3)/9223372036854775808 + (7116183974947451*x^2)/72057594037927936 - (7714204542030595*x)/562949953421312 + 5645506349949001/4398046511104;
            f20 = (5076728601383469*x^6)/9903520314283042199192993792 - (2816837076465163*x^5)/2417851639229258349412352 + (627349571243385*x^4)/590295810358705651712 - (4571744582302211*x^3)/9223372036854775808 + (2233929597324121*x^2)/18014398509481984 - (2280922452512717*x)/140737488355328 + 5835581585541447/4398046511104;
            f21 = (8812308650646207*x^6)/9903520314283042199192993792 - (4722559277772663*x^5)/2417851639229258349412352 + (8129276876009953*x^4)/4722366482869645213696 - (7161966939256063*x^3)/9223372036854775808 + (1695808890924071*x^2)/9007199254740992 - (6665216379006513*x)/281474976710656 + 3610123301677981/2199023255552;
            f22 = (5415419675118727*x^6)/4951760157141521099596496896 - (5660686783515717*x^5)/2417851639229258349412352 + (1192796214816081*x^4)/590295810358705651712 - (2068103805642325*x^3)/2305843009213693952 + (7750760170846927*x^2)/36028797018963968 - (3776883434013709*x)/140737488355328 + 7682636150884905/4398046511104;
            f23 = (5020800059510661*x^6)/4951760157141521099596496896 - (5061068726850429*x^5)/2417851639229258349412352 + (4115597755916959*x^4)/2361183241434822606848 - (1722531259504357*x^3)/2305843009213693952 + (6241968760405137*x^2)/36028797018963968 - (5926949888899499*x)/281474976710656 + 6236601595572755/4398046511104;
            f24 = (6965968045478001*x^6)/4951760157141521099596496896 - (53341843255501*x^5)/18889465931478580854784 + (2709245160955841*x^4)/1180591620717411303424 - (8886678662976359*x^3)/9223372036854775808 + (7916755306110631*x^2)/36028797018963968 - (7381900417006683*x)/281474976710656 + 3585398160982241/2199023255552;
            f25 = (8446365608208179*x^6)/9903520314283042199192993792 - (1850672435259815*x^5)/1208925819614629174706176 + (2620280813838649*x^4)/2361183241434822606848 - (7655248734036061*x^3)/18446744073709551616 + (379419971253485*x^2)/4503599627370496 - (653415428369971*x)/70368744177664 + 208475474401595/274877906944;
            f26 = - (4021218591100741*x^6)/79228162514264337593543950336 + (599001140206461*x^5)/2417851639229258349412352 - (1307416151232969*x^4)/4722366482869645213696 + (1235537497589965*x^3)/9223372036854775808 - (4652230010938469*x^2)/144115188075855872 + (1856743428035817*x)/562949953421312 + 784736462052451/4398046511104;
            f27 = (308*x)/515 + 6439608664948511/35184372088832;
            f28 = (86*x)/137 + 832248686078491/17592186044416;
            f29 = (260*x)/469 - 4969966835697723/70368744177664;
            
            f30 = (8474810671160297*x^6)/2361183241434822606848 - (4659500418008803*x^5)/4611686018427387904 + (4071193977824689*x^4)/36028797018963968 - (7203467883137139*x^3)/1125899906842624 + (6804266477894369*x^2)/35184372088832 - (3305098955591475*x)/1099511627776 + 1393264493887869/68719476736;
            
            switch app.DropDown19.Value
                case 'Americana'
                    I2 = imshow('M3RSC/ansi.png','Parent',app.UIAxes13);
                    app.UIAxes13.XLim = [0 I2.XData(2)];
                    app.UIAxes13.YLim = [0 I2.YData(2)];
                    rpm1 = [170.578903654485	216.655315614618	243.700166112957	283.766611295681	310.811461794020	333.849667774086	348.874584717608	364.901162790698	379.926079734219	390.944352159469	400.960963455150	442.029069767442	467.070598006645	506.135382059801	533.180232558140	555.216777408638	572.245016611296	585.266611295681	598.288205980066	610.308139534884	621.326411960133	663.396179401993	690.441029900332	726.500830564784	754.547342192691	776.583887043189	795.615448504983	812.643687707641	823.661960132890	833.678571428571	843.695182724253];
                    kwt1 = [567.938461538462	542.169230769231	519.492307692308	491.661538461538	470.015384615385	456.615384615385	446.307692307692	437.030769230769	427.753846153846	419.507692307692	408.169230769231	381.369230769231	361.784615384615	336.015384615385	313.338461538462	297.876923076923	285.507692307692	278.292307692308	270.046153846154	260.769230769231	249.430769230769	219.538461538462	198.923076923077	174.184615384615	153.569230769231	137.076923076923	125.738461538462	115.430769230769	106.153846153846	97.9076923076923	88.6307692307693	62.8615384615384	45.3384615384616];
                    rpm2 = [10 15 20:10:100 150 200:100:1000 1500 2000:1000:10000];
                    %                     kwtm = [2.66800664451828	5.19303709856035	8.71253229974164	13.8565414136786	20.2405177187154	35.7803156146180	50.7512836001209	74.5782576596529	88.4769518272426	130.094684385382	220];
                    pitch= [f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14];
                    paso = [6.35 9.525 12.70 15.875 19.05 25.40 31.75 38.10 44.45 50.80 63.50];
                    switch app.DropDown20.Value
                        case 'Simplex'
                            kwt2 = [0.1 0.15 0.2:0.1:1 1.5 2:10 15 20:10:100 150 200];
                            btw1 = [11 3500 0.12;...
                                26 7900 0.35;...
                                44 13900 0.6;...
                                70 218000 1;...
                                105 31300 1.47;...
                                177 55600 2.80;...
                                258 87000 4.20;...
                                390 125000 5.7;...
                                468 170000 7.8;...
                                639 123000 10.4;...
                                1077 347000 17.3];
                        case 'Duplex'
                            kwt2 = [0.17 0.26 0.34 0.51 0.68 0.85 1.02 1.19 1.36 1.53 1.7 2.6 3.4 5.1 6.8 8.5 10.2 11.9 13.6 15.3 17 26 34 51 68 85 102 119 136 153 170 255 340];
                            btw1 = [30 9000 0.2;...
                                53 15800 0.62;...
                                88 27800 1.20;...
                                141 43600 1.98;...
                                210 62600 2.91;...
                                355 111200 5.5;...
                                516 174000 8.4;...
                                781 250000 11;...
                                935 340000 15.5;...
                                1278 446000 20.6;...
                                2155 694000 34.4];
                        case 'Triplex'
                            kwt2 = [0.25 0.38 0.50:0.25:2.5 3.8 5:2.5:25 38 50:25:250 375 500];
                            btw1 = [40 13000 0.5;...
                                79 23700 0.93;...
                                132 41700 1.8;...
                                211 65400 2.96;...
                                315 93900 4.38;...
                                532 166800 8.3;...
                                774 261000 12.6;...
                                1171 375000 16.7;...
                                1403 510000 23.1;...
                                1916 669000 31.0;...
                                3232 1041000 51.2];
                            %                         case 'Cuadruplex'
                            %                             kwt2 = [0.33 0.5 0.66 0.99 1.32 1.61 1.98 2.31 2.64 2.97 3.3 5 6.6 9.9 13.2 16.5 19.8 23.1 26.4 29.7 33 50 66 99 132 165 198 231 264 297 330 495 660];
                    end
                case 'Europea'
                    I2 = imshow('M3RSC/euro.png','Parent',app.UIAxes13);
                    app.UIAxes13.XLim = [0 I2.XData(2)];
                    app.UIAxes13.YLim = [0 I2.YData(2)];
                    rpm1 = [150.545681063123	189.610465116279	218.658637873754	256.721760797342	287.773255813954	308.808139534884	326.838039867110	341.862956810631	355.886212624585	365.902823920266	376.921096345515	448.039036544851	488.105481727575	517.153654485050	538.188538205980	558.221760797342	572.245016611296	585.266611295681	598.288205980066	608.304817275748	678.421096345515	716.484219269103	745.532392026578	768.570598006645	784.597176079734	800.623754152824	813.645348837209	824.663621262459	835.681893687708];
                    kwt1 = [584.969269102990	542.899501661130	520.862956810631	503.834717607973	491.814784053156	480.796511627907	472.783222591362	464.769933554817	457.758305647841	450.746677740864	411.681893687708	390.647009966777	374.620431893688	360.597176079734	351.582225913621	341.565614617940	334.553986710963	326.540697674419	322.534053156146	283.469269102990	260.431063122924	244.404485049834	230.381229235880	221.366279069767	211.349667774086	205.339700996678	198.328073089701	191.316445182724	151.250000000000	129.213455149502];
                    rpm2 = [10 15 20:10:100 200:100:1000 2000:1000:10000];
                    %                     kwtm = [363.602159468438	311.515780730897	291.482558139535	279.462624584718	262.434385382060	238.394518272425	215.356312292359	184.304817275747	173.286544850498	168.278239202658	149.246677740864	125.206810631229];
                    pitch= [f15 f16 f17 f18 f19 f20 f21 f22 f23 f24 f25 f26 f27 f28 f29];
                    paso = [8 9.525 12.7 15.875 19.05 25.4 31.75 38.1 44.45 50.8 63.5 76.2];
                    switch app.DropDown20.Value
                        case 'Simplex'
                            kwt2 = [0.1:0.1:1 2:10 20:10:100 200 300];
                            btw1 = [11 4400 0.18;...
                                28 8900 0.39;...
                                50 17800 0.7;...
                                68 22200 0.96;...
                                89 28900 1.22;...
                                207 60000 2.8;...
                                290 95000 3.85;...
                                548 160000 7.45;...
                                735 200000 9.35;...
                                806 250000 10.1;...
                                1271 355000 16.5;...
                                1600 460000 22.0];
                        case 'Duplex'
                            kwt2 = [0.17 0.34 0.51 0.68 0.85 1.02 1.19 1.36 1.53 1.7 3.4 5.1 6.8 8.5 10.2 11.9 13.6 15.3 17 34 51 68 85 102 119 136 153 170 340 510];
                            btw1 = [22 7800 0.36;...
                                56 16900 0.78;...
                                100 31100 1.38;...
                                134 44500 1.69;...
                                178 57800 2.42;...
                                413 106000 5.5;...
                                587 170000 7.8;...
                                1103 280000 14.8;...
                                1471 360000 18.6;...
                                1613 450000 20.1;...
                                2542 630000 24.5;...
                                3600 820000 28.5];
                            
                        case 'Triplex'
                            kwt2 = [0.25:0.25:2.5 5:2.5:25 50:25:250 500 750];
                            btw1 = [33 11100 0.54;...
                                84 24900 1.11;...
                                150 44500 2.06;...
                                202 66700 2.54;...
                                267 86700 3.59;...
                                619 160000 8.15;...
                                885 250000 11.65;...
                                1658 425000 22.25;...
                                2206 530000 28;...
                                2419 670000 30;...
                                3813 950000 48.9;...
                                5300 1250000 68];
                    end
            end
            hold(app.UIAxes13,'on')
            
            app.UITable12.Data(1,1) = app.EditField68.Value / app.EditField67.Value;
            facs = [1 1.1 1.3;1.4 1.5 1.7;1.8 1.9 2.1];
            switch app.DropDown17.Value
                case 'Arranque Suave'
                    col = 1;
                case 'Choques Ligeros'
                    col = 2;
                case 'Choques Moderados'
                    col = 3;
            end
            switch app.DropDown18.Value
                case 'Arranque Suave'
                    fil = 1;
                case 'Choques Moderados'
                    fil = 2;
                case 'Choques Pesados'
                    fil = 3;
            end
            app.UITable12.Data(2,1) = facs(fil,col);
            app.UITable12.Data(3,1) = 19 / app.EditField67.Value;
            
            x1   = app.EditField70.Value;
            y1   = app.EditField69.Value * app.UITable12.Data(2,1) * app.UITable12.Data(3,1);
            
            rpm  = interp1(rpm2,rpm1,x1);
            kwt  = interp1(kwt2,kwt1,y1);
            rpm3 = subs(pitch,rpm);
            rpm4 = interp1(kwt1,kwt2,double(rpm3));
            
            tilu = {'Manual' 'Drip Feed' 'Oil Bath' 'Oil Stream'};
            switch app.DropDown19.Value
                case 'Americana'
                    P    = paso(find(rpm3(1:11) < kwt,1));
                    app.EditField73.Value = [num2str(P),' mm'];
                    tilu = tilu(find(rpm3(12:14) < kwt,1));
                    comet(app.UIAxes13,[rpm rpm],[567.93 35],0.9)
                    comet(app.UIAxes13,[170.57 843.69],[kwt kwt],0.9)
                    I    = paso == P;
                    V    = (app.EditField70.Value * P * app.EditField67.Value) / 60000;
                    F    = (y1 * 1000) / V;
                    switch app.DropDown20.Value
                        case 'Simplex'
                            Fd = btw1(I,3) * V^2;
                            Fs = btw1(I,2) / (F + Fd);
                            Bp = (F + Fd) / btw1(I,1);
                        case 'Duplex'
                            Fd = 2 * btw1(I,3) * V^2;
                            Fs = 2 * btw1(I,2) / (F + Fd);
                            Bp = (F + Fd) / btw1(I,1);
                        case 'Triplex'
                            Fd = 3 * btw1(I,3) * V^2;
                            Fs = 3 * btw1(I,2) / (F + Fd);
                            Bp = (F + Fd) / btw1(I,1);
                    end
                case 'Europea'
                    P    = paso(find(rpm3(1:12) < kwt,1));
                    app.EditField73.Value = [num2str(P),' mm'];
                    tilu = tilu(find(rpm3(13:15) < kwt,1));
                    comet(app.UIAxes13,[rpm rpm],[584.96 61.1],0.9)
                    comet(app.UIAxes13,[150.54 835.68],[kwt kwt],0.9)
                    I    = find(paso == P);
                    V    = (app.EditField70.Value * P * app.EditField67.Value) / 60000;
                    F    = (y1 * 1000) / V;
                    switch app.DropDown20.Value
                        case 'Simplex'
                            Fd = btw1(I,3) * V^2;
                            Fs = btw1(I,2) / (F + Fd);
                            Bp = (F + Fd) / btw1(I,1);
                        case 'Duplex'
                            Fd = 2 * btw1(I,3) * V^2;
                            Fs = 2 * btw1(I,2) / (F + Fd);
                            Bp = (F + Fd) / btw1(I,1);
                        case 'Triplex'
                            Fd = 3 * btw1(I,3) * V^2;
                            Fs = 3 * btw1(I,2) / (F + Fd);
                            Bp = (F + Fd) / btw1(I,1);
                    end
            end
            bar_pro.Message = 'Seleccionando paso de cadena optima';pause(2)
            dp = drawpoint(app.UIAxes13,'Position',[rpm kwt],'Color','r');
            
            if isempty(tilu)
                app.EditField74.Value = 'Oil Stream';
            else
                app.EditField74.Value = char(tilu);
            end
            
            L   = (app.EditField68.Value + app.EditField67.Value)/2 + (2 * sqrt(app.EditField72.Value^2 + app.EditField71.Value^2))/P + (P * ((app.EditField68.Value - app.EditField67.Value)/(2 * pi))^2)/sqrt(app.EditField72.Value^2 + app.EditField71.Value^2);
            if rem(round(L),2) ~= 0
                L = round(L) + 1;
            else
                L = round(L);
            end
            if app.CheckBox1.Value == 1
                L = L + 2;
            end
            C   = P/8 * (2*L - app.EditField68.Value - app.EditField67.Value + sqrt((2*L - app.EditField68.Value - app.EditField67.Value)^2 - ((pi/3.88) * (app.EditField68.Value - app.EditField67.Value)^2)));
            
            B2  = 2 * acosd((app.EditField68.Value - app.EditField67.Value)/(2 * sqrt(app.EditField71.Value^2 + app.EditField72.Value^2)));
            phi = (360 - B2)/2;
            rho = acosd(app.EditField71.Value / (sqrt(app.EditField71.Value^2 + app.EditField72.Value^2)));
            bet = 90 + rho - phi;
            alf = 2 * rho - bet;
            
            switch app.Switch3.Value
                case 'Horario'
                    Fy = F * cosd(alf);
                    Fz = F * sind(alf);
                case 'Antihorario'
                    Fy = F * cosd(bet);
                    Fz = F * sind(bet);
            end
            Tx  = (F * app.EditField68.Value) / 2000;
            
            Vc  = (app.EditField68.Value * P * double(subs(f30,P))) / 60000;
            if V <= 0.6 * Vc
                switch app.DropDown20.Value
                    case 'Simplex'
                        if Bp < 40
                            dp.Label = ['Cadena de Larga Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        elseif Bp >= 40 && Bp < 60
                            dp.Label = ['Cadena de Corta Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        else
                            dp.Label = ['Contacte con Renold y la cadena trabaja con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        end
                    otherwise
                        if Bp < 33
                            dp.Label = ['Cadena de Larga Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        elseif Bp >= 33 && Bp < 50
                            dp.Label = ['Cadena de Corta Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        else
                            dp.Label = ['Contacte con Renold y la cadena trabaja con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        end
                end
            elseif V > 0.6 * Vc && V <= 0.8 * Vc
                switch app.DropDown20.Value
                    case 'Simplex'
                        if Bp < 30
                            dp.Label = ['Cadena de Larga Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        elseif Bp >= 30 && Bp < 44
                            dp.Label = ['Cadena de Corta Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        else
                            dp.Label = ['Contacte con Renold y la cadena trabaja con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        end
                    otherwise
                        if Bp < 27
                            dp.Label = ['Cadena de Larga Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        elseif Bp >= 27 && Bp < 39
                            dp.Label = ['Cadena de Corta Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        else
                            dp.Label = ['Contacte con Renold y la cadena trabaja con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        end
                end
            else
                switch app.DropDown20.Value
                    case 'Simplex'
                        if Bp < 23
                            dp.Label = ['Cadena de Larga Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        elseif Bp >= 23 && Bp < 27
                            dp.Label = ['Cadena de Corta Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        else
                            dp.Label = ['Contacte con Renold y la cadena trabaja con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        end
                    otherwise
                        if Bp < 18
                            dp.Label = ['Cadena de Larga Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        elseif Bp >= 18 && Bp < 25
                            dp.Label = ['Cadena de Corta Vida con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        else
                            dp.Label = ['Contacte con Renold y la cadena trabaja con una capacidad del ',num2str((y1/rpm4(I))*100),' %'];
                        end
                end
            end
            
            app.UITable12.Data(4,1)  = L;
            app.UITable12.Data(5,1)  = C;
            app.UITable12.Data(6,1)  = V;
            app.UITable12.Data(7,1)  = F;
            app.UITable12.Data(8,1)  = Fd;
            app.UITable12.Data(9,1)  = Fs;
            app.UITable12.Data(10,1) = Bp;
            app.UITable12.Data(11,1) = B2;
            app.UITable12.Data(12,1) = rho;
            app.UITable12.Data(13,1) = 0;
            app.UITable12.Data(14,1) = Fy;
            app.UITable12.Data(15,1) = Fz;
            app.UITable12.Data(16,1) = Tx;
            
            bar_pro.Message = 'Calculo finalizado exitosamente';pause(2)
            close(bar_pro)
            
        end

        % Value changed function: DropDown19
        function DropDown19ValueChanged(app, event)
            
            cla(app.UIAxes13)
            switch app.DropDown19.Value
                case 'Americana'
%                     app.DropDown20.Items = {'Simplex' 'Duplex' 'Triplex'};
                    I2 = imshow('M3RSC/ansi.png','Parent',app.UIAxes13);
                    app.UIAxes13.XLim = [0 I2.XData(2)];
                    app.UIAxes13.YLim = [0 I2.YData(2)];
                case 'Europea'
%                     app.DropDown20.Items = {'Simplex' 'Duplex' 'Triplex'};
                    I2 = imshow('M3RSC/euro.png','Parent',app.UIAxes13);
                    app.UIAxes13.XLim = [0 I2.XData(2)];
                    app.UIAxes13.YLim = [0 I2.YData(2)];
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

            % Create Tab7
            app.Tab7 = uitab(app.TabGroup);
            app.Tab7.AutoResizeChildren = 'off';
            app.Tab7.Title = 'MODULO 3';
            app.Tab7.BackgroundColor = [0.9137 0.9137 0.9137];

            % Create UIAxes13
            app.UIAxes13 = uiaxes(app.Tab7);
            app.UIAxes13.PlotBoxAspectRatio = [1.4512987012987 1 1];
            app.UIAxes13.XColor = [1 1 1];
            app.UIAxes13.XTick = [];
            app.UIAxes13.XTickLabelRotation = 0;
            app.UIAxes13.YColor = [1 1 1];
            app.UIAxes13.YTick = [];
            app.UIAxes13.YTickLabelRotation = 0;
            app.UIAxes13.ZTickLabelRotation = 0;
            app.UIAxes13.GridColor = [0 0 0];
            app.UIAxes13.Position = [444 1 919 641];

            % Create Button5
            app.Button5 = uibutton(app.Tab7, 'push');
            app.Button5.ButtonPushedFcn = createCallbackFcn(app, @Button5Pushed, true);
            app.Button5.Icon = fullfile(pathToMLAPP, 'M3RSC', 'engrane.gif');
            app.Button5.FontName = 'Times';
            app.Button5.Position = [338 206 100 23];
            app.Button5.Text = 'Calcular';

            % Create NumerodeDientesdelPionLabel
            app.NumerodeDientesdelPionLabel = uilabel(app.Tab7);
            app.NumerodeDientesdelPionLabel.FontName = 'Times';
            app.NumerodeDientesdelPionLabel.Position = [220 356 109 30];
            app.NumerodeDientesdelPionLabel.Text = {'Numero de dientes'; 'del piñón'};

            % Create EditField67
            app.EditField67 = uieditfield(app.Tab7, 'numeric');
            app.EditField67.FontName = 'Times';
            app.EditField67.Position = [338 360 100 22];

            % Create NumerodeDientesdelaCoronaLabel
            app.NumerodeDientesdelaCoronaLabel = uilabel(app.Tab7);
            app.NumerodeDientesdelaCoronaLabel.FontName = 'Times';
            app.NumerodeDientesdelaCoronaLabel.Position = [220 407 109 30];
            app.NumerodeDientesdelaCoronaLabel.Text = {'Numero de dientes'; 'de la corona'};

            % Create EditField68
            app.EditField68 = uieditfield(app.Tab7, 'numeric');
            app.EditField68.FontName = 'Times';
            app.EditField68.Position = [338 411 100 22];

            % Create CaracteristicadelMotorLabel
            app.CaracteristicadelMotorLabel = uilabel(app.Tab7);
            app.CaracteristicadelMotorLabel.FontName = 'Times';
            app.CaracteristicadelMotorLabel.Position = [220 509 71 30];
            app.CaracteristicadelMotorLabel.Text = {'Característica'; 'del motor'};

            % Create DropDown17
            app.DropDown17 = uidropdown(app.Tab7);
            app.DropDown17.Items = {'Arranque Suave', 'Choques Ligeros', 'Choques Moderados'};
            app.DropDown17.FontName = 'Times';
            app.DropDown17.Position = [338 513 100 22];
            app.DropDown17.Value = 'Arranque Suave';

            % Create CaracteristicadelaMaquinaLabel
            app.CaracteristicadelaMaquinaLabel = uilabel(app.Tab7);
            app.CaracteristicadelaMaquinaLabel.FontName = 'Times';
            app.CaracteristicadelaMaquinaLabel.Position = [220 458 81 30];
            app.CaracteristicadelaMaquinaLabel.Text = {'Característica'; 'de la máquina'};

            % Create DropDown18
            app.DropDown18 = uidropdown(app.Tab7);
            app.DropDown18.Items = {'Arranque Suave', 'Choques Moderados', 'Choques Pesados'};
            app.DropDown18.FontName = 'Times';
            app.DropDown18.Position = [338 462 100 22];
            app.DropDown18.Value = 'Arranque Suave';

            % Create DistanciaentrecentroshorizontalLabel
            app.DistanciaentrecentroshorizontalLabel = uilabel(app.Tab7);
            app.DistanciaentrecentroshorizontalLabel.FontName = 'Times';
            app.DistanciaentrecentroshorizontalLabel.Position = [220 305 83 30];
            app.DistanciaentrecentroshorizontalLabel.Text = {'Distancia '; 'horizontal [mm]'};

            % Create EditField71
            app.EditField71 = uieditfield(app.Tab7, 'numeric');
            app.EditField71.FontName = 'Times';
            app.EditField71.Position = [338 309 100 22];

            % Create PotenciakWLabel
            app.PotenciakWLabel = uilabel(app.Tab7);
            app.PotenciakWLabel.FontName = 'Times';
            app.PotenciakWLabel.Position = [220 603 75 22];
            app.PotenciakWLabel.Text = 'Potencia [kW]';

            % Create EditField69
            app.EditField69 = uieditfield(app.Tab7, 'numeric');
            app.EditField69.FontName = 'Times';
            app.EditField69.Position = [338 603 100 22];

            % Create RPMEditFieldLabel_2
            app.RPMEditFieldLabel_2 = uilabel(app.Tab7);
            app.RPMEditFieldLabel_2.FontName = 'Times';
            app.RPMEditFieldLabel_2.Position = [220 558 30 22];
            app.RPMEditFieldLabel_2.Text = 'RPM';

            % Create EditField70
            app.EditField70 = uieditfield(app.Tab7, 'numeric');
            app.EditField70.FontName = 'Times';
            app.EditField70.Position = [338 558 100 22];

            % Create UITable12
            app.UITable12 = uitable(app.Tab7);
            app.UITable12.ColumnName = {'Resultados'};
            app.UITable12.RowName = {};
            app.UITable12.FontName = 'Times';
            app.UITable12.Position = [37 23 402 158];

            % Create DistanciaentrecentrosverticalLabel
            app.DistanciaentrecentrosverticalLabel = uilabel(app.Tab7);
            app.DistanciaentrecentrosverticalLabel.FontName = 'Times';
            app.DistanciaentrecentrosverticalLabel.Position = [220 250 90 30];
            app.DistanciaentrecentrosverticalLabel.Text = {'Distancia'; 'vertical [mm]'};

            % Create EditField72
            app.EditField72 = uieditfield(app.Tab7, 'numeric');
            app.EditField72.FontName = 'Times';
            app.EditField72.Position = [338 258 100 22];

            % Create Image18
            app.Image18 = uiimage(app.Tab7);
            app.Image18.Position = [31 527 164 117];
            app.Image18.ImageSource = fullfile(pathToMLAPP, 'M3RSC', 'motor.png');

            % Create Image19
            app.Image19 = uiimage(app.Tab7);
            app.Image19.Position = [41 258 150 126];
            app.Image19.ImageSource = fullfile(pathToMLAPP, 'M3RSC', 'distancias.png');

            % Create Label41
            app.Label41 = uilabel(app.Tab7);
            app.Label41.FontName = 'Times';
            app.Label41.FontSize = 25;
            app.Label41.Position = [42 679 329 33];
            app.Label41.Text = 'Módulo de cadenas [RENOLD]';

            % Create SentidodeGiroSwitchLabel_2
            app.SentidodeGiroSwitchLabel_2 = uilabel(app.Tab7);
            app.SentidodeGiroSwitchLabel_2.HorizontalAlignment = 'center';
            app.SentidodeGiroSwitchLabel_2.FontName = 'Times';
            app.SentidodeGiroSwitchLabel_2.Position = [35 207 89 22];
            app.SentidodeGiroSwitchLabel_2.Text = 'Sentido de Giro';

            % Create Switch3
            app.Switch3 = uiswitch(app.Tab7, 'slider');
            app.Switch3.Items = {'Horario', 'Antihorario'};
            app.Switch3.FontName = 'Times';
            app.Switch3.Position = [208 208 45 20];
            app.Switch3.Value = 'Horario';

            % Create NormaDropDownLabel
            app.NormaDropDownLabel = uilabel(app.Tab7);
            app.NormaDropDownLabel.HorizontalAlignment = 'right';
            app.NormaDropDownLabel.FontName = 'Times';
            app.NormaDropDownLabel.Position = [491 675 42 22];
            app.NormaDropDownLabel.Text = 'Norma';

            % Create DropDown19
            app.DropDown19 = uidropdown(app.Tab7);
            app.DropDown19.Items = {'Americana', 'Europea'};
            app.DropDown19.ValueChangedFcn = createCallbackFcn(app, @DropDown19ValueChanged, true);
            app.DropDown19.FontName = 'Times';
            app.DropDown19.Position = [548 675 100 22];
            app.DropDown19.Value = 'Americana';

            % Create TipoDropDownLabel
            app.TipoDropDownLabel = uilabel(app.Tab7);
            app.TipoDropDownLabel.HorizontalAlignment = 'right';
            app.TipoDropDownLabel.FontName = 'Times';
            app.TipoDropDownLabel.Position = [674 675 27 22];
            app.TipoDropDownLabel.Text = 'Tipo';

            % Create DropDown20
            app.DropDown20 = uidropdown(app.Tab7);
            app.DropDown20.Items = {'Simplex', 'Duplex', 'Triplex'};
            app.DropDown20.FontName = 'Times';
            app.DropDown20.Position = [716 675 100 22];
            app.DropDown20.Value = 'Simplex';

            % Create PasodelacadenaLabel
            app.PasodelacadenaLabel = uilabel(app.Tab7);
            app.PasodelacadenaLabel.HorizontalAlignment = 'right';
            app.PasodelacadenaLabel.FontName = 'Times';
            app.PasodelacadenaLabel.Position = [841 675 108 22];
            app.PasodelacadenaLabel.Text = 'Paso de la cadena';

            % Create EditField73
            app.EditField73 = uieditfield(app.Tab7, 'text');
            app.EditField73.Editable = 'off';
            app.EditField73.Position = [964 675 58 22];

            % Create TipodeLubricacionLabel
            app.TipodeLubricacionLabel = uilabel(app.Tab7);
            app.TipodeLubricacionLabel.HorizontalAlignment = 'right';
            app.TipodeLubricacionLabel.FontName = 'Times';
            app.TipodeLubricacionLabel.Position = [1057 674 99 22];
            app.TipodeLubricacionLabel.Text = 'Tipo de lubricación';

            % Create EditField74
            app.EditField74 = uieditfield(app.Tab7, 'text');
            app.EditField74.Editable = 'off';
            app.EditField74.Position = [1171 674 58 22];

            % Create CheckBox1
            app.CheckBox1 = uicheckbox(app.Tab7);
            app.CheckBox1.Text = '';
            app.CheckBox1.Position = [1307 674 16 22];

            % Create Label42
            app.Label42 = uilabel(app.Tab7);
            app.Label42.FontName = 'Times';
            app.Label42.Position = [1256 674 39 22];
            app.Label42.Text = 'Ajuste';

            % Create Image17
            app.Image17 = uiimage(app.Tab7);
            app.Image17.Position = [31 391 157 123];
            app.Image17.ImageSource = fullfile(pathToMLAPP, 'M3RSC', 'Ventilador.png');

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Modulo3

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