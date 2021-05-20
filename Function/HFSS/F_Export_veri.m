function F_Export_veri(fid, S11_file, Gain_file)
% hfssExportToFile(fid, 'S11', S11_file);
% hfssExportToFile(fid, 'Gain', Gain_file);
hfssExportToFile_restore(fid, 'S11', S11_file);
hfssExportToFile_restore(fid, 'Gain', Gain_file);
end