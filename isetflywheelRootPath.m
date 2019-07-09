function rootPath = isetflywheelRootPath()
% Return the path to the isetflywheel directory
%
% Syntax:
%    rootPath = isetflywheelRootPath;
%
% Description:
%    Return base bath of the isetflywheel directory.
%
% Inputs:
%    None.
%
% Outputs:
%    None.
%
% Optional key/value pairs:
%    None.
%
% See Also:
%    isetbioRootPath, isetbioDataPath.

%% Find this file, then find its path
rootPath = fileparts(mfilename('fullpath'));
end
