% ----------------------------------------------------------------------------

function hfssInterpolatingSweepStep(fid, Name, SolutionName, fStartGHz, ...
                                fStopGHz, fStepGHz)
% create script.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("AnalysisSetup")\n');

fprintf(fid, 'oModule.InsertFrequencySweep "%s", _\n', SolutionName);
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '"IsEnabled:=", true, _\n');
fprintf(fid, '"RangeType:=", "LinearStep", _\n');
fprintf(fid, '"RangeStart:=", "%fGHz", _\n', fStartGHz);
fprintf(fid, '"RangeEnd:=", "%fGHz", _\n', fStopGHz);
fprintf(fid, '"RangeStep:=", "%fGHz", _\n', fStepGHz);
fprintf(fid, '"Type:=", "Interpolating", _\n');
fprintf(fid, '"SaveFields:=", false, "SaveRadFields:=", _\n');
fprintf(fid, 'false, "InterpTolerance:=", 0.5, "InterpMaxSolns:=", 250, "InterpMinSolns:=", _\n');
fprintf(fid, '0, "InterpMinSubranges:=", 1, "ExtrapToDC:=", false, "InterpUseS:=", true, "InterpUsePortImped:=", _\n');
fprintf(fid, 'false, "InterpUsePropConst:=", true, "UseDerivativeConvergence:=", false, "InterpDerivTolerance:=", _\n');
fprintf(fid, '0.2, "UseFullBasis:=", true, "EnforcePassivity:=", true, "PassivityErrorTolerance:=", _\n');
fprintf(fid, '0.0001)\n');
fprintf(fid, '\n');