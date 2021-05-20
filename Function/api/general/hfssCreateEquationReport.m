%CreateEquationCurve
function hfssCreateEquation(fid,Func,Equation,SolutionName,SweepName)
% fprintf(fid, 'Dim oAnsoftApp \n');
% fprintf(fid, 'Dim oDesktop \n');
% fprintf(fid, 'Dim oProject \n');
% fprintf(fid, 'Dim oDesign \n');
% fprintf(fid, 'Dim oEditor \n');
% fprintf(fid, 'Dim oModule \n');
% fprintf(fid, 'Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface") \n');
% fprintf(fid, 'Set oDesktop = oAnsoftApp.GetAppDesktop() \n');
% fprintf(fid, 'oDesktop.RestoreWindow \n');
% Set oProject = oDesktop.SetActiveProject("TSV inductor_turn")
% Set oDesign = oProject.SetActiveDesign("2-turn")

fprintf(fid, 'Set oModule = oDesign.GetModule("OutputVariable")\n');
fprintf(fid, 'oModule.CreateOutputVariable "%s", _\n', Func);
fprintf(fid, '"%s", _\n', Equation);
fprintf(fid, '"%s := %s", _\n', SolutionName, SweepName);
fprintf(fid, '"Terminal Solution Data", _\n');
fprintf(fid, 'Array("Domain:=", "%s"), _\n', SweepName);