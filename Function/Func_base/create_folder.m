function create_folder(newdir)
% 
% CREATE_FOLDER(NEWDIR) creates a folder called NEWDIR.
% 
% If there is already a folder named NEWDIR with any file regardless of the
% level, it will be renamed to NEWDIR-backup (or NEWDIR-backup02,
% NEWDIR-backup03, ...).
% 
% If NEWDIR is empty or contains only folders, nothing is done.
% 
% See also WAIT_FOR_EXISTENCE

% Guilherme Coco Beltramini (guicoco@gmail.com)
% 2012-Jan-29, 04:10 pm
% 
% Changelog
%--------------------------------------------------------------------------
% 2013-Jan-06, 11:49 pm: function will wait until folder is created
%   (maximum time and pause time can be changed in the code)
% 2013-Feb-08, 11:23 pm: "ls" command in Windows and Linux gives different
%   results. It was changed to "dir"
% 2013-Apr-12, 02:38 am: if "newdir" contains only folders inside, nothing
%   is done (if there is any file regardless of the level the existing
%   folder is renamed)


max_time   = 5;   % [s]
pause_time = 0.5; % [s]


% Directory exists and is empty
%==============================
if exist(newdir,'dir')==7 && length(dir(newdir))==2
    
    % Do nothing
    %-----------
    fprintf(' Folder %s already exists and is empty.\n',newdir)
    fprintf(' Nothing was done.\n')
    return
    
    
% Directory exists and is not empty
%==================================
elseif exist(newdir,'dir')==7
    
    % Check if folders inside are empty
    %----------------------------------
    folders    = genpath(newdir); % get all subfolders
    folder_sep = strfind(folders,pathsep);
    empty_dir  = 1;
    for ff=1:length(folder_sep)
        if ff>1
            tmp = dir(folders( (folder_sep(ff-1)+1) : (folder_sep(ff)-1) ));
        else
            tmp = dir(folders( 1 : (folder_sep(ff)-1) ));
        end
        if any(~[tmp.isdir])
            % there are files in "newdir"
            empty_dir = 0;
            break
        end
    end
    if empty_dir % "newdir" is empty
        fprintf(' Folder %s already exists and contains no files.\n',newdir)
        fprintf(' Nothing was done.\n')
        return
    end
    
    % Rename existing directory to a non-existing name
    %-------------------------------------------------
    if exist([newdir '-backup'],'dir')==7
        tmp = 2;
        while exist([newdir sprintf('-backup%.2d',tmp)],'dir')==7
            tmp = tmp + 1;
        end
        tmp = [newdir sprintf('-backup%.2d',tmp)];
    else
        tmp = [newdir '-backup'];
    end
    s = movefile(newdir,tmp);
    if ~s
        error('Check folder permission. %s could not be renamed',newdir)
    end
    waited = wait_for_existence(tmp,'dir',pause_time,max_time);
    if waited
        error('%s could not be renamed',newdir)
    end
    
end


% Create new directory
%=====================
s = mkdir(newdir);
if ~s
    pause(5) % wait for some time and try again
    s = mkdir(newdir);
    if ~s
        error('Check folder permission. %s could not be created',newdir)
    end
end


% Wait for folder creation
%=========================
waited = wait_for_existence(newdir,'dir',pause_time,max_time);
if waited
    fprintf('%s could not be created.\n',newdir)
end