%% Download a pre-computed mosaic from Flywheel 
%
%  We can use these in computations, without building them up which
%  can be slow for the hex cone mosaics.
%
% Wandell, July 9, 2019
%
% See also
%

%% 
ieInit
chdir(fullfile(isetbioRootPath,'local'));

%% Require scitran

st = scitran('stanfordlabs');
project = st.lookup('wandell/ISETBio Mosaics');
fovea = project.sessions.findOne('label=fovea');

%%
acq = fovea.acquisitions.findOne('label="0.40 deg"');
files = acq.files;
matFiles = stSelect(files,'type','MATLAB data');
hexMatFile = stSelect(matFiles,'name','hex','contains',true);
hexMatFile{1}.download(hexMatFile{1}.name);
load(hexMatFile{1}.name,'hexMosaic');
hexMosaic.window('show','cone mosaic');

%%  We do not have the window option for the hex mosaic
%s
vcNewGraphWin;
hFig1 = hexMosaic.visualizeGrid(...
    'axesHandle', gca, ...
    'visualizedConeAperture', visualizedAperture, ...
    'apertureShape', 'disks', ...
    'ticksInMicrons', true);

%% For the rect, we do
acq = fovea.acquisitions.findOne('label="2.00 deg"');
files = acq.files;
matFiles = stSelect(files,'type','MATLAB data');
rectMatFile = stSelect(matFiles,'name','rect','contains',true);
rectMatFile{1}.download(rectMatFile{1}.name);
load(rectMatFile{1}.name,'rectMosaic');

%%
scene = sceneCreate('rings rays');
scene = sceneSet(scene,'fov',3);
oi = oiCreate; oi = oiCompute(oi,scene);

rectMosaic.emGenSequence(50);
rectMosaic.compute(oi);
rectMosaic.window;

%% END