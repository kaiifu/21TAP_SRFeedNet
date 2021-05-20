function F_Export(fid,Smm_file,Sm1_file,Sm2_file,Sm3_file,Sm4_file,...
    Degm1_file,Degm2_file,Degm3_file,Degm4_file)
% hfssExportToFile(fid, 'S11', S11_file);
% hfssExportToFile(fid, 'Gain', Gain_file);
% hfssExportToFile_restore(fid, 'S11', S11_file);
% hfssExportToFile_restore(fid, 'Gain', Gain_file);
hfssExportToFile_restore(fid, 'Smm', Smm_file);
hfssExportToFile_restore(fid, 'Sm1', Sm1_file);
hfssExportToFile_restore(fid, 'Sm2', Sm2_file);
hfssExportToFile_restore(fid, 'Sm3', Sm3_file);
hfssExportToFile_restore(fid, 'Sm4', Sm4_file);
hfssExportToFile_restore(fid, 'Degm1', Degm1_file);
hfssExportToFile_restore(fid, 'Degm2', Degm2_file);
hfssExportToFile_restore(fid, 'Degm3', Degm3_file);
hfssExportToFile_restore(fid, 'Degm4', Degm4_file);
end