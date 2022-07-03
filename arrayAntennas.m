% Creating an antenna array on a line.
a=linearArray;

% Finding wavelength for frequency 70 MHz.
lamda=(3*10^8)/(70*10^6);

% Antenna length calculation for Hertz Dipole.
length=(lamda/100);

% Creating a dipole antenna according to the values found.
% Its width is given as 0.5 mm in order to be as much as the wire.
d1=dipole('Length',length,'Width',0.0005);

% Adding 5 of the generated hertz dipoles to the generated antenna array.
a.Element=[d1,d1,d1,d1,d1];

% Adjusting the spacing between antennas.
a.ElementSpacing=lamda;

% Adjusting the phase shifts of antennas.
a.PhaseShift=[0 90 180 270 360];

% Show the antenna.
figure;
show(d1)

% Show the location of the antennas.
figure;
layout(a);

% 3D pattern display.
figure;
pattern(a,70e6);

% Show antenna pattern in polar coordinates.
figure;
P = polarpattern(patternElevation(a,2e9));



% Antenna pattern in the 'azimuth' (horizontal plane).
figure;
patternAzimuth(a,2e9);

% 'Elevation', the antenna pattern in the vertical plane.
figure;
patternElevation(a,2e9);

% To show electromagnetic fields.
figure;
EHfields(a,4e9)