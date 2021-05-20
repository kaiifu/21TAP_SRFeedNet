function F_Project_veri(Seed,tmpPrjFile,tmpScriptFile,Smm_file,Deg_file,Smi_file)
global hfssExePath maxDeltaS maxPass...
    operating_freq passband_low passband_up freq_step
%% Parameters;
sr_rwg_x=1.68;sr_rwg_w=8.636;sr_rwg_l=4.318;rf_pm_x = -2.48;
rf_pm_y = 0.55;rf_pt_x=2.2;rf_pt_y=7;rf_siw_w=6.2;me_4x4_x = -11.1;
rf_port_dx = 5.65;me_in_x = 0.95;sr_sub_h = 1.57;rf_sub_l = 31;
rf_sub_w = 35;sr_sub_w = 20;sr_sub_l = 31;sr_rwg_h = -4;
rf_siw_r= 0.25;rf_siw_p= 0.8;rf_2t4_ps_r = 0.2;rf_pt_w= 6;
Units = 'mm';
%% Script and project  files.
fid = fopen(tmpScriptFile, 'wt');
hfssNewProject(fid);
hfssInsertDesign(fid,'PatchAnt','driven modal');
%% Main
F_Model_Element(fid,Seed,sr_rwg_x,sr_rwg_w,sr_rwg_l,rf_pm_x,rf_pm_y,rf_pt_x,...
    rf_pt_y,rf_siw_w,me_4x4_x,rf_port_dx,me_in_x,sr_sub_h,rf_sub_l,rf_sub_w,...
    sr_sub_w,sr_sub_l,sr_rwg_h,rf_siw_r,rf_siw_p,rf_2t4_ps_r,rf_pt_w,Units)
%% Insert solution and sweep
hfssInsertSolutionFarField(fid, 'Setup1', operating_freq, maxDeltaS, maxPass);
hfssDiscreteSweep(fid,'Sweep','Setup1', passband_low, passband_up, freq_step);
%% Save project and close file.
fprintf(fid, 'oProject.SimulateAll\n');     % Run simulation
F_Report(fid, Smm_file,Deg_file,Smi_file)
hfssSaveProject(fid, tmpPrjFile, true);     % Save project and close file
fclose(fid);
%% Open HFSS executing the script.
hfssExecuteScript(hfssExePath, tmpScriptFile, true, true);
end