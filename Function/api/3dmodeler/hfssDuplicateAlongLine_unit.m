% ----------------------------------------------------------------------------
% function hfssDuplicateAlongLine(fid, ObjectList, dVector, nClones, Units, ...
%				                  [dupBoundaries = true])
% 
% Description :
% -------------
% Creates the VB Script necessary to clone (duplicate) a list of objects 
% along a line.
%
% Parameters :
% ------------
% fid        - file identifier of the HFSS script file.
% ObjectList - a cell-array of strings that represent the objects to be 
%              cloned. (specified as {'name'})
% dVector    - (vector) the translation vector for the duplication process 
%              (specified as [dx, dy, dz]).
% nClones    - # of clones to be created.
% Units      - specified as either 'mm', 'meter', 'in' or anything else 
%              defined in HFSS.
% [dupBoundaries] - (optional, boolean) set to false if you wish NOT to 
%                   duplicate boundaries along with the geometry.
% 
% Note :
% ------
% If you have used this 3D modeler feature before, then you will probably
% realize that if the original object (to be cloned) has the name 'Name',
% then the cloned objects will have names 'Name1', 'Name2', ... This applies
% to the cloned boundaries and excitations also.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
%
% ----------------------------------------------------------------------------
% varargin - specify 'true' (default) to duplicate boundaries or 'false'
%            otherwise
function hfssDuplicateAlongLine_unit(fid, ObjectList, dVector, nClones, Units, ...
				dupBoundaries)


% arguments processor.
if (nargin < 5)
	error('Insufficient number of arguments !');
elseif (nargin < 6)
	dupBoundaries = [];
end;

% default arguments.
if isempty(dupBoundaries)
	dupBoundaries = true;
end;

nObjects = length(ObjectList);

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.DuplicateAlongLine _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');

% Object Selections.
fprintf(fid, '"Selections:=", "');
for iObj = 1:nObjects,
	fprintf(fid, '%s', ObjectList{iObj});
	if (iObj ~= nObjects)
		fprintf(fid, ',');
	end;
end;
fprintf(fid, '"), _\n');

% Duplication Vectors.
%if isvector(dVector)
%    fprintf(fid, 'Array("NAME:DuplicateToAlongLineParameters", _\n');
%    fprintf(fid, '"XComponent:=", "%f%s", _\n', dVector(1), Units);
%    fprintf(fid, '"YComponent:=", "%f%s", _\n', dVector(2), Units);
%    fprintf(fid, '"ZComponent:=", "%f%s", _\n', dVector(3), Units);
%else
%    if iscell(dVector)
%        fprintf(fid, 'Array("NAME:DuplicateToAlongLineParameters", _\n');
%        fprintf(fid, '"XComponent:=", "%s", _\n', dVector(1));
%        fprintf(fid, '"YComponent:=", "%s", _\n', dVector(2));
%        fprintf(fid, '"ZComponent:=", "%s", _\n', dVector(3));
%    end
%end

dVector = reshape(dVector, length(dVector), 1);
if iscell(dVector)
    1;
else
    dVector = mat2cell(dVector,[1,1,1],1);
end
fprintf(fid, 'Array("NAME:DuplicateToAlongLineParameters", _\n');
fprintf(fid, '"CreateNewObjects:=", false, _\n');  %组合到一起

if isnumeric(dVector{1,1})
    fprintf(fid, '"XComponent:=", "%f%s", _\n', dVector{1,1}, Units);
else
    fprintf(fid, '"XComponent:=", "%s", _\n', dVector{1,1});
end
    
if isnumeric(dVector{2,1})
    fprintf(fid, '"YComponent:=", "%f%s", _\n', dVector{2,1}, Units);
else
    fprintf(fid, '"YComponent:=", "%s", _\n', dVector{2,1});
end
  
if isnumeric(dVector{3,1})
   fprintf(fid, '"ZComponent:=", "%f%s", _\n', dVector{3,1}, Units);
else
     fprintf(fid, '"ZComponent:=", "%s", _\n', dVector{3,1});
end
    
if ischar(nClones)
    fprintf(fid, '"NumClones:=", %s), _\n', nClones);
else
    fprintf(fid, '"NumClones:=", %d), _\n', nClones);
end

% Duplicate Boundaries with Geometry or not.
fprintf(fid, 'Array("NAME:Options", _\n');
if (dupBoundaries)
	fprintf(fid, '"DuplicateBoundaries:=", true)\n');
else
	fprintf(fid, '"DuplicateBoundaries:=", false)\n');
end

% oEditor.DuplicateAlongLine Array("NAME:Selections", "Selections:=", "Pm", "NewPartsModelFlag:=",  _
%   "Model"), Array("NAME:DuplicateToAlongLineParameters", "CreateNewObjects:=", false, "XComponent:=",  _
%   "-2.1mm", "YComponent:=", "0mm", "ZComponent:=", "0mm", "NumClones:=", "2"), Array("NAME:Options", "DuplicateAssignments:=",  _
%   false), Array("CreateGroupsForNewObjects:=", false)
