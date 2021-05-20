function hfssAssignWavePort_terminal(fid, FaceID, Reference, portnum)

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup") \n');
fprintf(fid, '\n');
fprintf(fid, 'oModule.AutoIdentifyPorts _\n');
fprintf(fid, 'Array( _\n');
fprintf(fid, '"NAME:Faces", %d), _\n', FaceID);
fprintf(fid, 'true, _\n');
fprintf(fid, 'Array("NAME:ReferenceConductors", _\n');
fprintf(fid, '"%s"), _\n', Reference);

fprintf(fid, '"%d", _\n', portnum);
fprintf(fid, 'true \n');