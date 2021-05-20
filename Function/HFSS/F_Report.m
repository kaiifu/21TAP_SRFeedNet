function F_Report(fid, Smm_file, Deg_file, Smi_file, Optimetrics_name, NonOptmetrics_name)
% report type and others need to be set up
reportType = "Modal Solution Data";
solutionName = 'Setup1';
sweepname = 'Sweep';
%% Smm
reportName1 = "Smm";
Function = "db(S(m,m))";
displayType = "Rectangular Plot";
if (nargin < 6)
    hfssCreateReport(fid, reportName1, reportType, displayType,...
        solutionName, sweepname, Function)
else
    hfssCreateReportVar(fid, reportName1, reportType, displayType,...
        solutionName, sweepname, Optimetrics_name, NonOptmetrics_name, Function)
end
%% Phase
reportName2 = "Rad";
Function = "cang_rad(S(m,1))";
displayType = "Rectangular Plot";
if (nargin < 6)
    hfssCreateReport(fid, reportName2, reportType, displayType,...
        solutionName, sweepname, Function)
else
    hfssCreateReportVar(fid, reportName2, reportType, displayType,...
        solutionName, sweepname, Optimetrics_name, NonOptmetrics_name, Function)
end
hfssAddTraces(fid, reportName2, solutionName, sweepname, 'cang_rad(S(m,2))')
hfssAddTraces(fid, reportName2, solutionName, sweepname, 'cang_rad(S(m,3))')
hfssAddTraces(fid, reportName2, solutionName, sweepname, 'cang_rad(S(m,4))')
%% Smm
reportName3 = "Smi_single";
Function = "db(S(m,1))";
displayType = "Rectangular Plot";
if (nargin < 6)
    hfssCreateReport(fid, reportName3, reportType, displayType,...
        solutionName, sweepname, Function)
else
    hfssCreateReportVar(fid, reportName3, reportType, displayType,...
        solutionName, sweepname, Optimetrics_name, NonOptmetrics_name, Function)
end
hfssAddTraces(fid, reportName3, solutionName, sweepname, 'db(S(m,2))')
hfssAddTraces(fid, reportName3, solutionName, sweepname, 'db(S(m,3))')
hfssAddTraces(fid, reportName3, solutionName, sweepname, 'db(S(m,4))')
%% Export
hfssExportToFile_restore(fid, reportName1, Smm_file);
hfssExportToFile_restore(fid, reportName2, Deg_file);
hfssExportToFile_restore(fid, reportName3, Smi_file);
end