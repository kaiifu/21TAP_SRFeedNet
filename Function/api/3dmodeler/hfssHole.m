% ----------------------------------------------------------------------------
% function hfssBox(fid, Name, Start, Size, Units, [Center1], [Radius1], ...
%                  [Axis1], [Center2], [Radius2], [Axis2], ...)
% 
% Description :
% -------------
% Create the VB Script necessary to create a Box (or Cuboid) in HFSS. This 
% function also provides for optional holes (specified by their Center, 
% Radii and Axes) in the box. This feature is useful to allow things like
% vias, cables etc., to penetrate the box without intersection violations.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of the box (appears in HFSS).
% Start   - starting location of the box (specify as [x, y, z]).
% Size    - size of the box (specify as [sx, sy, sz]).
% Units   - units of the box (specify using either 'in', 'mm', 'meter' or 
%           anything else defined in HFSS).
% Center  - (Optional) center of the hole to be punched through the box.
%           It can lie anywhere within or on the surface of the box.
% Radius  - (Optional) radius of the hole to be punched through the box.
% Axis    - (Optional) axis of the hole to be punched through the box.
% 
% Note :
% ------
% If you happen to specify a hole that lies outside the box, it will have
% no effect. The script will run without interruption. 
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% % a Box with 2 holes punched thro' it.
% hfssBox(fid, 'FR4_Base', [-bpHeight/2, -baseLength/2, 0], [bpHeight, ...
%         baseLength, -baseThick], 'in', [cX1, cY1, cZ1], R1, 'Z',...
%         [cX2, cY2, cZ2], R2, 'X');
%
% ----------------------------------------------------------------------------

% ----------------------------------------------------------------------------
% This file is part of HFSS-MATLAB-API.
%
% HFSS-MATLAB-API is free software; you can redistribute it and/or modify it 
% under the terms of the GNU General Public License as published by the Free 
% Software Foundation; either version 2 of the License, or (at your option) 
% any later version.
%
% HFSS-MATLAB-API is distributed in the hope that it will be useful, but 
% WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
% or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License 
% for more details.
%
% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, Boston, MA  02111-1307  USA
%
% Copyright 2004, Vijay Ramasami (rvc@ku.edu)
% ----------------------------------------------------------------------------
function hfssHole(fid, Name, Start, Size, Units, varargin)
Start = reshape(Start, length(Start), 1);
Size = reshape(Size, length(Size), 1);
if iscell(Start)
    1;
else
    Start = mat2cell(Start,[1,1,1],1);
end
if iscell(Size)
    1;
else
    Size = mat2cell(Size,[1,1,1],1);
end
% Add Holes.
nHoles = length(varargin)/3;

% For each Hole Request create cylinder that satisfies the request and then 
% subtract it from the Box.
for iH = 1:nHoles,
	Center = varargin{3*(iH-1) + 1};
	Radius = varargin{3*(iH-1) + 2};
	Axis   = upper(varargin{3*(iH-1) + 3});
		
	switch(Axis)
		case 'X', 
			Center(1) = Start{1};
			Length = Size{1};
		case 'Y', 
			Center(2) = Start{2};
			Length = Size{2};
		case 'Z', 
            Center(3) = Start{3};
			Length = Size{3};
% % 			Center(3) = Start(3);
% % 			Length = Size(3);
	end;
	
	hfssCylinder(fid, strcat(Name, '_subhole', num2str(iH)), Axis, ... 
	             Center, Radius, Length, Units);
	hfssSubtract(fid, Name, strcat(Name, '_subhole', num2str(iH)));
end;	                   
