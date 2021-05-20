function F_Model_Element(fid,Seed,sr_rwg_x,sr_rwg_w,sr_rwg_l,rf_pm_x,rf_pm_y,rf_pt_x,...
    rf_pt_y,rf_siw_w,me_4x4_x,rf_port_dx,me_in_x,sr_sub_h,rf_sub_l,rf_sub_w,...
    sr_sub_w,sr_sub_l,sr_rwg_h,rf_siw_r,rf_siw_p,rf_2t4_ps_r,rf_pt_w,Units)
%% Create Design Properties
%% ------------------Seed---------------------%%
a1=Seed(1,1);  % A1
rf_2t4_o=Seed(1,2); % A2
sr_fl_w=Seed(1,9); % W
sr_fl_l=Seed(1,10); %L
sr_viab_y=Seed(1,3);sr_viab_x=Seed(1,4);  % via_a
sr_viaa_x=Seed(1,5);sr_viaa_y=Seed(1,6);  % via_b
sr_via2_y=Seed(1,7); % D
sr_via1_n=Seed(1,8); % N
rf_ptc_y=Seed(1,11);rf_ptc_x=Seed(1,12);rf_ptc_r=Seed(1,13);  % via_g
rf_ps_p=Seed(1,14);rf_ps_n=Seed(1,15);rf_ps_dx=Seed(1,16);rf_ps_dy=Seed(1,17); %via_h
rf_ps1_dx=Seed(1,18);rf_ps1_dy=Seed(1,19); % via_f
rf_2t4_ps1_dx=Seed(1,20);rf_2t4_ps1_dy=Seed(1,21);
rf_2t4_ps1_n=Seed(1,22);rf_2t4_ps1_p=Seed(1,23);  %via_e

rf_2t4_ps_dx=Seed(1,24);rf_2t4_ps_dy=Seed(1,25);  %via_c
rf_2t4c_x=Seed(1,26);rf_2t4c_y=Seed(1,27); %via_d

sr_via5_n=18;
sr_via4_y=0.1;sr_via4_x=-0.08;sr_via3_y=0.6;sr_via3_n=5;
sr_via2_x=0.5;sr_via2_n=11;sr_via1_x=0.9;
% sr_via2_y=0.78;
% ;sr_via1_n=16;
%% ------------------Dimension=43---------------------%%
% via1
hfssaddVar(fid, 'sr_viaa_x', sr_viaa_x, Units);
hfssaddVar(fid, 'sr_viaa_y', sr_viaa_y, Units);
% via2
hfssaddVar(fid, 'sr_viab_x', sr_viab_x, Units);
hfssaddVar(fid, 'sr_viab_y', sr_viab_y, Units);
% via3
hfssaddVar(fid, 'rf_ps1_dx', rf_ps1_dx, Units);
hfssaddVar(fid, 'rf_ps1_dy', rf_ps1_dy, Units);
% via4
hfssaddVar(fid, 'rf_2t4c_x', rf_2t4c_x, Units);
hfssaddVar(fid, 'rf_2t4c_y', rf_2t4c_y, Units);
% via5
hfssaddVar(fid, 'rf_2t4_ps_dx', rf_2t4_ps_dx, Units);
hfssaddVar(fid, 'rf_2t4_ps_dy', rf_2t4_ps_dy, Units);
% via6
hfssaddVar(fid, 'rf_2t4_ps1_p', rf_2t4_ps1_p, Units);
hfssaddVar(fid, 'rf_2t4_ps1_dx', rf_2t4_ps1_dx, Units);
hfssaddVar(fid, 'rf_2t4_ps1_dy', rf_2t4_ps1_dy, Units);
hfssaddVar(fid, 'rf_2t4_ps1_n', rf_2t4_ps1_n, []);
% via7
hfssaddVar(fid, 'rf_ptc_x', rf_ptc_x, Units);
hfssaddVar(fid, 'rf_ptc_y', rf_ptc_y, Units);
hfssaddVar(fid, 'rf_ptc_r', rf_ptc_r, Units);
% via8
hfssaddVar(fid, 'rf_ps_p', rf_ps_p, Units);
hfssaddVar(fid, 'rf_ps_dx', rf_ps_dx, Units);
hfssaddVar(fid, 'rf_ps_dy', rf_ps_dy, Units);
hfssaddVar(fid, 'rf_ps_n', rf_ps_n, []);
% rotate angle
hfssaddVar(fid, 'a1', a1, 'deg');
hfssaddVar(fid, 'rf_2t4_o', rf_2t4_o, 'deg');
% number of vias
hfssaddVar(fid, 'sr_via2_n', sr_via2_n, []);
hfssaddVar(fid, 'sr_via3_n', sr_via3_n, []);
hfssaddVar(fid, 'sr_via5_n', sr_via5_n, []);
% w2
hfssaddVar(fid, 'sr_via2_y', sr_via2_y, Units);
% w1 l1
hfssaddVar(fid, 'sr_fl_l', sr_fl_l, Units);
hfssaddVar(fid, 'sr_fl_w', sr_fl_w, Units);
% D1
hfssaddVar(fid, 'sr_via3_y', sr_via3_y, Units);



hfssaddVar(fid, 'sr_via1_n', sr_via1_n, []);
hfssaddVar(fid, 'sr_via1_x', sr_via1_x, Units);
hfssaddVar(fid, 'sr_via4_y', sr_via4_y, Units);
hfssaddVar(fid, 'sr_via4_x', sr_via4_x, Units);

hfssaddVar(fid, 'sr_via2_x', sr_via2_x, Units);
%% ------------------constant---------------------%%
hfssaddVar(fid, 'rf_siw_w', rf_siw_w, Units);

hfssaddVar(fid, 'rf_pt_x', rf_pt_x, Units);
hfssaddVar(fid, 'rf_pt_y', rf_pt_y, Units);

hfssaddVar(fid, 'sr_rwg_x', sr_rwg_x, Units);
hfssaddVar(fid, 'sr_rwg_w', sr_rwg_w, Units);
hfssaddVar(fid, 'sr_rwg_l', sr_rwg_l, Units);

hfssaddVar(fid, 'rf_pm_x', rf_pm_x, Units);
hfssaddVar(fid, 'rf_pm_y', rf_pm_y, Units);

hfssaddVar(fid, 'sr_sub_w', sr_sub_w, Units);
hfssaddVar(fid, 'sr_sub_l', sr_sub_l, Units);
hfssaddVar(fid, 'rf_sub_l', rf_sub_l, Units);
hfssaddVar(fid, 'rf_sub_w', rf_sub_w, Units);
hfssaddVar(fid, 'sr_sub_h', sr_sub_h, Units);
hfssaddVar(fid, 'sr_rwg_h', sr_rwg_h, Units);
hfssaddVar(fid, 'rf_siw_r', rf_siw_r, Units);
hfssaddVar(fid, 'rf_siw_p', rf_siw_p, Units);
hfssaddVar(fid, 'rf_2t4_ps_r', rf_2t4_ps_r, Units);
hfssaddVar(fid, 'rf_pt_w', rf_pt_w, Units);

hfssaddVar(fid, 'me_4x4_x', me_4x4_x, Units);
hfssaddVar(fid, 'rf_port_dx', rf_port_dx, Units);
hfssaddVar(fid, 'me_in_x', me_in_x, Units);
%% ------------------CS---------------------%%
hfssSetWCS(fid, 'Global');
hfssCreateRelativeCS(fid, 'rf_Pm_X', {'-rf_pt_w/2+0.1mm',...
    '-rf_siw_p/2-rf_siw_p*6+rf_siw_p*9/2', '0'}, Units)

hfssSetWCS(fid, 'rf_Pm_X');
hfssCreateRelativeCS(fid, 'rf_Pm_X_1',...
    {'rf_pm_x-(int(sr_via5_n)-1)*rf_siw_p','0', '0'}, Units);

hfssSetWCS(fid, 'rf_Pm_X_1');
hfssCreateRelativeCS(fid, 'RWG_SIW_trans',...
    {'sr_via4_x-rf_siw_p*(int(sr_via3_n)+int(sr_via2_n)-1)-sr_via2_x-sr_via1_x',...
    'rf_pm_y', '0'}, Units);

hfssSetWCS(fid, 'Global');
hfssCreateRelativeCS(fid, 'rf_P1_jianqu_rf_port_dx', {'me_4x4_x+rf_port_dx', '-me_4x4_x', '0'}, Units)

hfssSetWCS(fid, 'Global');
hfssCreateRelativeCS(fid, 'rf_2to4_center', {'me_in_x/2', '-me_4x4_x-me_in_x/2', '0'}, Units)
%% ------------------RWG_SIW_trans---------------------%%
hfssSetWCS(fid, 'RWG_SIW_trans');

hfssBox(fid,'RWG',[sr_rwg_x,-sr_rwg_w/2,0],...
    [sr_rwg_l, sr_rwg_w, sr_rwg_h], Units);
hfssChangePropertyBox(fid, 'RWG',...
    {'sr_rwg_x', '-sr_rwg_w/2', '0'},...
    {'sr_rwg_l', 'sr_rwg_w', 'sr_rwg_h'});
hfssAssignMaterial(fid, 'RWG', 'air')

faceID_RWG1 = 'faceID_RWG1';
hfssFaceID(fid,faceID_RWG1,'RWG',[sr_rwg_x+sr_rwg_l/2 ,-sr_rwg_w/2 ,sr_rwg_h/2],Units)
hfssAssignPE_faceID(fid, 'PEC_RWG1', faceID_RWG1)

faceID_RWG2 = 'faceID_RWG2';
hfssFaceID(fid,faceID_RWG2,'RWG',[sr_rwg_x+sr_rwg_l/2 ,-sr_rwg_w/2+sr_rwg_w ,sr_rwg_h/2],Units)
hfssAssignPE_faceID(fid, 'PEC_RWG2', faceID_RWG2)

faceID_RWG3 = 'faceID_RWG3';
hfssFaceID(fid,faceID_RWG3,'RWG',[sr_rwg_x ,0 ,sr_rwg_h/2],Units)
hfssAssignPE_faceID(fid, 'PEC_RWG3', faceID_RWG3)

% real_start4 = sr_rwg_x+sr_rwg_l;
% real_start_round4 = round(real_start4, 6);
% if real_start_round4 > real_start4
%     start_x4 = real_start_round4-1e-6;
% end
faceID_RWG4 = 'faceID_RWG4';
hfssFaceID(fid,faceID_RWG4,'RWG',[sr_rwg_x+sr_rwg_l ,0 ,sr_rwg_h/2],Units)
hfssAssignPE_faceID(fid, 'PEC_RWG4', faceID_RWG4)
%% ------------------Substrate---------------------%%
hfssSetWCS(fid, 'Global');
hfssBox(fid,'Substrate',[-rf_sub_l/2, -rf_sub_w/2, 0],...
    [rf_sub_l,rf_sub_w,sr_sub_h], Units);
hfssChangePropertyBox(fid, 'Substrate',...
    {'-rf_sub_l/2', '-rf_sub_w/2', '0'},...
    {'rf_sub_l', 'rf_sub_w', 'sr_sub_h'});
hfssAssignMaterial(fid, 'Substrate', 'Rogers RT/duroid 5880 (tm)');
%% ------------------GND---------------------%%
hfssRectangle(fid,'GND','Z',[-rf_sub_l/2, -rf_sub_w/2, 0],rf_sub_l,rf_sub_w, Units);
hfssChangePropertyRectangle(fid, 'GND',{'-rf_sub_l/2','-rf_sub_w/2','0'},...
    {'rf_sub_l','rf_sub_w'})

hfssRectangle(fid,'top','Z',[-rf_sub_l/2, -rf_sub_w/2, sr_sub_h],rf_sub_l,rf_sub_w, Units);
hfssChangePropertyRectangle(fid, 'top',{'-rf_sub_l/2','-rf_sub_w/2','sr_sub_h'},...
    {'rf_sub_l','rf_sub_w'})
%% ------------------Cylinder---------------------%%
hfssBox(fid,'Pm_X',[-rf_pt_w/2-2*rf_siw_r-0.1 ,-rf_siw_p/2-rf_siw_p*6 ,0],...
    [2*rf_siw_r+0.2,rf_siw_p*9,sr_sub_h], Units);
hfssChangePropertyBox(fid, 'Pm_X',...
    {'-rf_pt_w/2-2*rf_siw_r-0.1mm', '-rf_siw_p/2-rf_siw_p*6', '0'},...
    {'2*rf_siw_r+0.2mm', 'rf_siw_p*9', 'sr_sub_h'});
%% ------------------rf_Pm_X---------------------%%
hfssSetWCS(fid, 'rf_Pm_X');
hfssCylinder(fid, 'Pm', 'Z', [rf_pm_x ,rf_pm_y-rf_siw_w/2-rf_siw_r ,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'Pm', {'rf_pm_x','rf_pm_y-rf_siw_w/2-rf_siw_r','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'Pm'}, {'-rf_siw_p','0','0'}, fix(sr_via5_n), Units)
hfssChangePropertyDupLine(fid, 'Pm', [], 'int(sr_via5_n)')
hfssDuplicateAlongLine_unit(fid, {'Pm'}, {'0','rf_siw_w+2*rf_siw_r','0'}, 2, Units)

hfssCylinder(fid, 'Pm1', 'Z', [rf_pm_x ,rf_pm_y+rf_siw_w/2+rf_siw_r ,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'Pm1', {'rf_pm_x','rf_pm_y+rf_siw_w/2+rf_siw_r','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'Pm1'}, {'rf_siw_p','0','0'}, 3, Units)
hfssUnites(fid,'Pm,Pm1')

hfssCylinder(fid, 'PT_c', 'Z', [rf_ptc_x ,rf_ptc_y ,0], rf_ptc_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'PT_c', {'rf_ptc_x','rf_ptc_y','0'}, 'rf_ptc_r', 'sr_sub_h');
hfssRotate(fid, {'PT_c'}, 'Z', a1)
hfssChangePropertyRotate(fid, 'PT_c', 'a1')
%% ------------------rf_Pm_X_1---------------------%%
hfssSetWCS(fid, 'rf_Pm_X_1');
hfssCylinder(fid,'via4','Z',[sr_via4_x,...
    rf_pm_y-rf_siw_w/2-rf_siw_r-sr_via4_y-rf_siw_p,0],...
    rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'via4', {'sr_via4_x',...
    'rf_pm_y-rf_siw_w/2-rf_siw_r-sr_via4_y-rf_siw_p','0'},...
    'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'via4'}, {'0', '-rf_siw_p', '0'}, 2, Units)

hfssCylinder(fid, 'via3', 'Z', [sr_via4_x-rf_siw_p,...
    rf_pm_y-rf_siw_w/2-rf_siw_r-sr_via4_y-rf_siw_p-sr_via3_y,0],...
    rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'via3', {'sr_via4_x-rf_siw_p',...
    'rf_pm_y-rf_siw_w/2-rf_siw_r-sr_via4_y-rf_siw_p-sr_via3_y','0'},...
    'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'via3'}, {'-rf_siw_p', '0', '0'}, fix(sr_via3_n), Units)
hfssChangePropertyDupLine(fid, 'via3', [], 'int(sr_via3_n)')

hfssCylinder(fid, 'via2', 'Z', [sr_via4_x-rf_siw_p*fix(sr_via3_n)-sr_via2_x,...
    rf_pm_y-rf_siw_w/2-rf_siw_r-sr_via4_y-rf_siw_p-sr_via3_y-sr_via2_y,0],...
    rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'via2', {'sr_via4_x-rf_siw_p*int(sr_via3_n)-sr_via2_x',...
    'rf_pm_y-rf_siw_w/2-rf_siw_r-sr_via4_y-rf_siw_p-sr_via3_y-sr_via2_y','0'},...
    'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'via2'}, {'-rf_siw_p', '0', '0'}, fix(sr_via2_n), Units)
hfssChangePropertyDupLine(fid, 'via2', [], 'int(sr_via2_n)')
%% ------------------RWG_SIW_trans---------------------%%
hfssSetWCS(fid, 'RWG_SIW_trans');

hfssCylinder(fid, 'viaa', 'Z', [sr_viaa_x ,-sr_viaa_y/2 ,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'viaa', {'sr_viaa_x','-sr_viaa_y/2','0'}, 'rf_siw_r', 'sr_sub_h')

hfssCylinder(fid, 'viab', 'Z', [sr_viab_x ,-sr_viab_y/2 ,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'viab', {'sr_viab_x','-sr_viab_y/2','0'}, 'rf_siw_r', 'sr_sub_h')

hfssUnites(fid, 'via2,via3,via4,viaa,viab')
hfssDuplicateMirror_base_nornal(fid, {'via2'}, [0,0,0], [0,1,0], Units)

hfssCylinder(fid, 'via1', 'Z', [0, -rf_siw_p*(sr_via1_n-1)/2, 0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'via1', {'0','-rf_siw_p*(sr_via1_n-1)/2','0'}, 'rf_siw_r', 'sr_sub_h')
hfssDuplicateAlongLine_unit(fid, {'via1'}, {'0', 'rf_siw_p', '0'}, fix(sr_via1_n), Units)
hfssChangePropertyDupLine(fid, 'via1', [], 'int(sr_via1_n)')

hfssUnites(fid, 'via1,via2,via2_1')
% hfssAssignMaterial(fid, 'via1', 'pec')

hfssBox(fid,'sub1',[-3, -sr_sub_w/2, 0],...
    [sr_sub_l, sr_sub_w, sr_sub_h], Units);
hfssChangePropertyBox(fid, 'sub1',...
    {'-3mm', '-sr_sub_w/2', '0'},...
    {'sr_sub_l', 'sr_sub_w', 'sr_sub_h'});
hfssAssignMaterial(fid, 'sub1', 'Rogers RT/duroid 5880 (tm)')
hfssUnites(fid, 'Substrate,sub1')

hfssRectangle(fid,'GND1','Z',[-3, -sr_sub_w/2, 0],sr_sub_l,sr_sub_w, Units);
hfssChangePropertyRectangle(fid, 'GND1',{'-3mm', '-sr_sub_w/2', '0'},...
    {'sr_sub_l','sr_sub_w'})

hfssRectangle(fid,'GND_sub','Z',[sr_rwg_x+sr_rwg_l/2-sr_fl_l/2, -sr_fl_w/2,0],sr_fl_l,sr_fl_w, Units);
hfssChangePropertyRectangle(fid, 'GND_sub',{'sr_rwg_x+sr_rwg_l/2-sr_fl_l/2', '-sr_fl_w/2', '0'},...
    {'sr_fl_l','sr_fl_w'})
hfssSubtract(fid, 'GND1', {'GND_sub'});

hfssRectangle(fid,'top1','Z',[-3, -sr_sub_w/2, sr_sub_h],sr_sub_l,sr_sub_w, Units);
hfssChangePropertyRectangle(fid, 'top1',{'-3mm', '-sr_sub_w/2', 'sr_sub_h'},...
    {'sr_sub_l','sr_sub_w'})

hfssUnites(fid, 'GND,GND1')
hfssUnites(fid, 'top,top1')

hfssAssignPE(fid, 'PEC1', {'GND'})
hfssAssignPE(fid, 'PEC2', {'top'})

hfssBox(fid,'RWG_pec',[sr_rwg_x,-sr_rwg_w/2,sr_rwg_h],...
    [sr_rwg_l, sr_rwg_w, -2], Units);
hfssChangePropertyBox(fid, 'RWG_pec',...
    {'sr_rwg_x', '-sr_rwg_w/2', 'sr_rwg_h'},...
    {'sr_rwg_l', 'sr_rwg_w', '-2mm'});
hfssAssignMaterial(fid, 'RWG_pec', 'pec')
%% ------------------Global---------------------%%
hfssSetWCS(fid, 'Global');
hfssCylinder(fid, 'PmT', 'Z', [rf_pt_w/2+rf_siw_r,0,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'PmT', {'rf_pt_w/2+rf_siw_r','0','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'PmT'}, {'0','rf_siw_p ','0'}, 10, Units)

hfssCylinder(fid, 'PmT1', 'Z', [-rf_pt_w/2-rf_siw_r,0,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'PmT1', {'-rf_pt_w/2-rf_siw_r','0','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'PmT1'}, {'0','rf_siw_p ','0'}, 8, Units)
% hfssChangePropertyDupLine(fid, 'PmT1', [], 'int(rf_pt_n2)')
hfssUnites(fid,'PmT,PmT1')
hfssDuplicateAroundAxis(fid, {'PmT'}, 'Z', 180, 2)
hfssUnites(fid,'PmT,PmT_1')
hfssSubtract(fid, 'PmT', {'Pm_X'});
hfssRotate(fid, {'PmT'}, 'Z', a1)
hfssChangePropertyRotate(fid, 'Pm_X', 'a1')
%% ------------------rf_P1_jianqu_rf_port_dx---------------------%%
hfssSetWCS(fid, 'rf_P1_jianqu_rf_port_dx');

hfssBox(fid,'Rf_2t4',[0, -rf_siw_w/2-rf_siw_r,0],...
    [-5,rf_siw_r,sr_sub_h], Units);
hfssChangePropertyBox(fid, 'Rf_2t4',...
    {'0', '-rf_siw_w/2-rf_siw_r', '0'},...
    {'-5mm', 'rf_siw_r', 'sr_sub_h'});
hfssBox(fid,'P1_Box_1',[-5, -rf_siw_w/2-rf_siw_r,0],...
    [-rf_siw_r,2*(rf_siw_w/2+rf_siw_r),sr_sub_h], Units);
hfssChangePropertyBox(fid, 'P1_Box_1',...
    {'-5mm', '-rf_siw_w/2-rf_siw_r', '0'},...
    {'rf_siw_r', '2*(rf_siw_w/2+rf_siw_r)', 'sr_sub_h'});
hfssBox(fid,'P1_Box_2',[0, rf_siw_w/2+rf_siw_r,0],...
    [-5,-rf_siw_r,sr_sub_h], Units);
hfssChangePropertyBox(fid, 'P1_Box_2',...
    {'0', 'rf_siw_w/2+rf_siw_r', '0'},...
    {'-5mm', '-rf_siw_r', 'sr_sub_h'});
hfssUnites(fid,'Rf_2t4,P1_Box_1,P1_Box_2')

hfssCylinder(fid, 'p1_Via', 'Z', [0,-rf_siw_w/2-rf_siw_r,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'p1_Via', {'0','-rf_siw_w/2-rf_siw_r','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateMirror_base_nornal(fid, {'p1_Via'}, [-1,0,0], [0,1,0], Units)
hfssUnites(fid,'p1_Via,p1_Via_1')
hfssUnites(fid,'Rf_2t4,p1_Via')

hfssSetWCS(fid, 'Global');
hfssDuplicateMirror_base_nornal(fid, {'Rf_2t4'}, [0,-2,0], [1,0,0], Units)
hfssMove(fid, {'Rf_2t4_1'}, {'me_in_x', '0', '0'}, 'in');
hfssMove(fid, {'Rf_2t4'}, {'0', '-me_in_x', '0'}, 'in');

hfssCylinder(fid, 'pt', 'Z', [-rf_siw_w/2-rf_siw_r+rf_pt_x, rf_pt_y,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'pt', {'-rf_siw_w/2-rf_siw_r+rf_pt_x','rf_pt_y','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'pt'}, {'rf_siw_w+2*rf_siw_r', '0', '0'}, 2, Units)
% hfssMove(fid, {'pt'}, {'rf_siw_w+2*rf_siw_r', '0', '0'}, 'in');
%% ------------------rf_2to4_center---------------------%%
hfssSetWCS(fid, 'rf_2to4_center');

hfssCylinder(fid, 'rf_2t4_via1', 'Z', [-rf_siw_p/2 ,-rf_siw_w/2-rf_siw_r ,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'rf_2t4_via1', {'-rf_siw_p/2','-rf_siw_w/2-rf_siw_r','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'rf_2t4_via1'}, {'-rf_siw_p', '0', '0'}, 7, Units)
% hfssChangePropertyDupLine(fid, 'rf_2t4_via1', [], 'int(rf_st4_n1)')

hfssCylinder(fid, 'rf_2t4_via2', 'Z', [-rf_siw_p/2 ,rf_siw_w/2+rf_siw_r ,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'rf_2t4_via2', {'-rf_siw_p/2','rf_siw_w/2+rf_siw_r','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'rf_2t4_via2'}, {'-rf_siw_p', '0', '0'}, 6, Units)
% hfssChangePropertyDupLine(fid, 'rf_2t4_via2', [], 'int(rf_st4_n2)')

hfssUnites(fid, 'rf_2t4_via1,rf_2t4_via2')
hfssDuplicateAroundAxis(fid, {'rf_2t4_via1'}, 'Z', 180, 2)
hfssUnites(fid, 'rf_2t4_via1,rf_2t4_via1_1')

hfssBox(fid,'rf_2t4_X_box',[-rf_siw_p-2*rf_siw_p, -rf_siw_w/2-rf_siw_r*2,0],...
    [rf_siw_p*8,rf_siw_r*2, sr_sub_h], Units);
hfssChangePropertyBox(fid, 'rf_2t4_X_box',...
    {'-rf_siw_p-2*rf_siw_p', '-rf_siw_w/2-rf_siw_r*2-0.1mm', '0'},...
    {'rf_siw_p*8', 'rf_siw_r*2+0.2mm', 'sr_sub_h'});
hfssSubtract(fid, 'rf_2t4_via1', {'rf_2t4_X_box'});
hfssRotate(fid, {'rf_2t4_via1'}, 'Z', rf_2t4_o)
hfssChangePropertyRotate(fid, 'rf_2t4_X_box', 'rf_2t4_o')

hfssCylinder(fid, 'rf_2t4_ps', 'Z', [-rf_2t4_ps_dx,rf_siw_w/2+rf_siw_r-rf_2t4_ps_dy,0], rf_2t4_ps_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'rf_2t4_ps',...
    {'-rf_2t4_ps_dx','rf_siw_w/2+rf_siw_r-rf_2t4_ps_dy','0'}, 'rf_2t4_ps_r', 'sr_sub_h');
hfssMirror(fid, {'rf_2t4_ps'}, [-1,0,0], [0,-1,0], Units)
hfssRotate(fid, {'rf_2t4_ps'}, 'Z', rf_2t4_o)
hfssChangePropertyRotate(fid, 'rf_2t4_ps', 'rf_2t4_o')
hfssSetWCS(fid, 'Global');
hfssDuplicateAroundAxis(fid, {'rf_2t4_ps'}, 'Z', 180, 2)
hfssUnites(fid,'rf_2t4_ps,rf_2t4_ps_1')

hfssSetWCS(fid, 'rf_2to4_center');
hfssCylinder(fid, 'rf_2t4_ps1', 'Z', [rf_2t4_ps1_dx,rf_siw_w/2+rf_siw_r-rf_2t4_ps1_dy,0], rf_2t4_ps_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'rf_2t4_ps1', {'rf_2t4_ps1_dx','rf_siw_w/2+rf_siw_r-rf_2t4_ps1_dy','0'}, 'rf_2t4_ps_r', 'sr_sub_h');
hfssMove(fid, {'rf_2t4_ps1'}, {'rf_2t4_ps1_p ', '0', '0'}, 'in');
hfssDuplicateAlongLine_unit(fid, {'rf_2t4_ps1'}, {'rf_2t4_ps1_p ', '0', '0'}, fix(rf_2t4_ps1_n), Units)
hfssChangePropertyDupLine(fid, 'rf_2t4_ps1', [], 'int(rf_2t4_ps1_n)')
hfssMove(fid, {'rf_2t4_ps1'}, {'-rf_siw_p ', '0', '0'}, 'in');
hfssRotate(fid, {'rf_2t4_ps1'}, 'Z', rf_2t4_o)
hfssChangePropertyRotate(fid, 'rf_2t4_ps1', 'rf_2t4_o')
hfssSetWCS(fid, 'Global');
hfssDuplicateAroundAxis(fid, {'rf_2t4_ps1'}, 'Z', 180, 2)

hfssCylinder(fid, 'rf_2t4_viac', 'Z',...
    [-rf_siw_r+rf_pt_x+rf_2t4c_x,rf_pt_y-2*rf_siw_p+rf_2t4c_y,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'rf_2t4_viac',...
    {'-rf_siw_r+rf_pt_x+rf_2t4c_x','rf_pt_y-2*rf_siw_p+rf_2t4c_y','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAroundAxis(fid, {'rf_2t4_viac'}, 'Z', 180, 2)
hfssUnites(fid, 'rf_2t4_ps,rf_2t4_ps_1,rf_2t4_ps1,rf_2t4_ps1_1,rf_2t4_viac,rf_2t4_viac_1')
%% ------------------Global---------------------%%
hfssSetWCS(fid, 'Global');

hfssUnites(fid,'Rf_2t4,Rf_2t4_1,pt,rf_2t4_via1')
hfssDuplicateAroundAxis(fid, {'Rf_2t4'}, 'Z', 180, 2)
hfssUnites(fid, 'Rf_2t4,Rf_2t4_2')

hfssCylinder(fid, 'Pt_ps', 'Z', [rf_pt_w/2+rf_siw_r-rf_ps_dx,rf_ps_dy,0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'Pt_ps', {'rf_pt_w/2+rf_siw_r-rf_ps_dx','rf_ps_dy','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateAlongLine_unit(fid, {'Pt_ps'}, {'0', 'rf_ps_p', '0'}, fix(rf_ps_n), Units)
hfssChangePropertyDupLine(fid, 'Pt_ps', [], 'int(rf_ps_n)')
hfssRotate(fid, {'Pt_ps'}, 'Z', a1)
hfssChangePropertyRotate(fid, 'Pt_ps', 'a1')

hfssCylinder(fid, 'Pt_ps1', 'Z', [rf_pt_w/2+rf_siw_r-rf_ps1_dx, rf_ps1_dy, 0], rf_siw_r, sr_sub_h, Units);
hfssChangePropertyCylinder(fid, 'Pt_ps1', {'rf_pt_w/2+rf_siw_r-rf_ps1_dx','rf_ps1_dy','0'}, 'rf_siw_r', 'sr_sub_h');
hfssDuplicateMirror_base_nornal(fid, {'Pt_ps1'}, [0,2,0], [-1,0,0], Units)
hfssUnites(fid, 'Pt_ps1,Pt_ps1_1')
hfssRotate(fid, {'Pt_ps1'}, 'Z', a1)
hfssChangePropertyRotate(fid, 'Pt_ps1', 'a1')

hfssUnites(fid, 'Pm,PmT,PT_c,Pt_ps,Pt_ps1,Rf_2t4,rf_2t4_ps')
hfssUnites(fid, 'Pm,via1')
hfssAssignMaterial(fid, 'Pm', 'pec')
%% ------------------Port---------------------%%
global_rwgx = sr_via4_x-rf_siw_p*(fix(sr_via3_n)+fix(sr_via2_n)-1)-...
    sr_via2_x-sr_via1_x+rf_pm_x-(fix(sr_via5_n)-1)*rf_siw_p-...
    rf_pt_w/2+0.1;

global_rwgy = -(rf_siw_p/2+rf_siw_p*6-...
    rf_siw_p*9/2-rf_pm_y+...
    rf_siw_r-rf_siw_r);

start_x =sr_rwg_x+global_rwgx;
end_x = sr_rwg_x+sr_rwg_l+global_rwgx;
hfssSetWCS(fid, 'RWG_SIW_trans');
faceID_m = 'faceID_m';
hfssFaceID(fid,faceID_m,'RWG',[sr_rwg_x+sr_rwg_l/2, 0, sr_rwg_h],Units)
hfssAssignWaveport_faceID(fid, 'm', faceID_m, 1, true,...
    [start_x, global_rwgy, sr_rwg_h],...
    [end_x,  global_rwgy, sr_rwg_h], Units)

hfssSetWCS(fid, 'Global');
faceID_1 = 'faceID_1';
hfssFaceID(fid,faceID_1,'Pm',[rf_siw_r+me_4x4_x+rf_port_dx-5-me_in_x,...
    me_4x4_x,sr_sub_h/2],Units)
hfssAssignWaveport_faceID(fid, '1', faceID_1, 1, true,...
    [rf_siw_r+me_4x4_x+rf_port_dx-5-me_in_x,me_4x4_x,0],...
    [rf_siw_r+me_4x4_x+rf_port_dx-5-me_in_x,me_4x4_x,sr_sub_h], Units)

faceID_2 = 'faceID_2';
hfssFaceID(fid,faceID_2,'Pm',[5-(rf_siw_r+me_4x4_x+rf_port_dx),...
    me_in_x+me_4x4_x,sr_sub_h/2],Units)
hfssAssignWaveport_faceID(fid, '2', faceID_2, 1, true,...
    [5-(rf_siw_r+me_4x4_x+rf_port_dx),me_in_x+me_4x4_x,0],...
    [5-(rf_siw_r+me_4x4_x+rf_port_dx),me_in_x+me_4x4_x,sr_sub_h], Units)

faceID_3 = 'faceID_3';
hfssFaceID(fid,faceID_3,'Pm',[5-(rf_siw_r+me_4x4_x+rf_port_dx-me_in_x),...
    -me_4x4_x,sr_sub_h/2],Units)
hfssAssignWaveport_faceID(fid, '3', faceID_3, 1, true,...
    [5-(rf_siw_r+me_4x4_x+rf_port_dx-me_in_x),-me_4x4_x,0],...
    [5-(rf_siw_r+me_4x4_x+rf_port_dx-me_in_x),-me_4x4_x,sr_sub_h], Units)

faceID_4 = 'faceID_4';
hfssFaceID(fid,faceID_4,'Pm',[rf_siw_r+me_4x4_x+rf_port_dx-5,...
    -me_in_x-me_4x4_x,sr_sub_h/2],Units)
hfssAssignWaveport_faceID(fid, '4', faceID_4, 1, true,...
    [rf_siw_r+me_4x4_x+rf_port_dx-5,-me_in_x-me_4x4_x,0],...
    [rf_siw_r+me_4x4_x+rf_port_dx-5,-me_in_x-me_4x4_x,sr_sub_h], Units)
%% Airbox
hfssRegion_AbsOffset(fid,'AirBox', 0.2, Units)
hfssSetTransparency(fid, {'AirBox'}, 0.95);
hfssAssignRadiation(fid, 'Rad1', 'AirBox');
end