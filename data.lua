local settings = settings["startup"]

if settings["startup"]['undarl-enable-fission'].value then
	require('prototypes.fission.fission-entities')
	require('prototypes.fission.fission-items')
	require('prototypes.fission.fission-recipes')
	require('prototypes.fission.fission-equipment')
	require('prototypes.fission.fission-technologies')
end

if settings["startup"]['undarl-enable-fusion'].value then
	require('prototypes.fusion.fusion-fluids')
	require('prototypes.fusion.fusion-entities')
	require('prototypes.fusion.fusion-items')
	require('prototypes.fusion.fusion-recipes')
	require('prototypes.fusion.fusion-technologies')
end

if settings["startup"]['undarl-enable-radioisotopes'].value then
	require('prototypes.radioisotopes.radioisotopes-entities')
	require('prototypes.radioisotopes.radioisotopes-items')
	require('prototypes.radioisotopes.radioisotopes-recipes')
	require('prototypes.radioisotopes.radioisotopes-equipment')
	require('prototypes.radioisotopes.radioisotopes-technologies')
end

--Changes to techs and recipes based on enabled settings
require('integrations.setting-data-updates')
