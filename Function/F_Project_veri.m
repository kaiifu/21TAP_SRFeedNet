function F_Project_veri(Seed, optimetrics, S11_file, Gain_file, tmpPrjFile, tmpScriptFile)
global optimetrics_name optimetrics_file hfssExePath maxDeltaS maxPass operating_freq passband_low passband_up
%% Parameters;
a1 = Seed(1,1);
a2 = Seed(1,2);
a3 = Seed(1,3);
a4 = Seed(1,4);
a5 = Seed(1,5);
a6 = Seed(1,6);
b1 = Seed(1,7);
b2 = Seed(1,8);
b3 = Seed(1,9);
b4 = Seed(1,10);
b5 = Seed(1,11);
c1 = Seed(1,12);
c2 = Seed(1,13);
c3 = Seed(1,14);
c4 = Seed(1,15);
c5 = Seed(1,16);
c6 = Seed(1,17);
d1 = Seed(1,18);
x_feed  = Seed(1,19);
sub_x = 400;
sub_y = 200;
sub_h = 0.8;
z_gnd = 4.25;
in_r = 0.27548;
out_h = 9.6031-sub_h;
out_r = 1.68;
Units = 'mm';
NonOptmetrics_name = {F_getVarName(sub_x), F_getVarName(sub_y),...
    F_getVarName(sub_h), F_getVarName(in_r), F_getVarName(out_h),...
    F_getVarName(out_r),F_getVarName(z_gnd),};
box_value = 3*1e11/(2*operating_freq*1e9);
%% Script and project  files.
fid = fopen(tmpScriptFile, 'wt'); 
hfssNewProject(fid);
hfssInsertDesign(fid,'PatchAnt','driven modal');
%% Main
F_Model_Element(fid,a1,a2,a3,a4,a5,a6,b1,b2,b3,b4,b5,c1,c2,c3,...
    c4,c5,c6,d1,x_feed,sub_x,sub_y,sub_h,in_r,out_h,out_r,z_gnd,box_value,Units)
%% Insert solution and sweep
hfssInsertSolutionFarField(fid, 'Setup1', operating_freq, maxDeltaS, maxPass);
hfssDiscreteSweep(fid,'Sweep','Setup1', passband_low-0.5, passband_up+0.5, 0.1);
%% Far field
% hfssFarFieldSetup(fid, '3D', [0, 180, 2], [0, 360, 2]);
hfssFarFieldSetup(fid, 'EH', [-180, 180, 5], [0, 90, 90]);
%% Add optimetrics
if optimetrics
    hfssAddOptiParametricFile(fid, optimetrics_file);
    hfssSaveFarFieldOpti(fid);
end
%% Save project and close file.
fprintf(fid, 'oProject.SimulateAll\n');     % Run simulation
if optimetrics
    F_Report_veri(fid, operating_freq, optimetrics_name, NonOptmetrics_name)
else
    F_Report_veri(fid, operating_freq)
end
F_Export_veri(fid, S11_file, Gain_file); 
hfssSaveProject(fid, tmpPrjFile, true);     % Save project and close file
fclose(fid);
%% Open HFSS executing the script.
hfssExecuteScript(hfssExePath, tmpScriptFile, true, true);
end