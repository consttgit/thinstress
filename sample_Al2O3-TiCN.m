i = 1;
sample.layer(i).material = 'Al2O3';
sample.layer(i).diffracting = true;
sample.layer(i).thickness = 2.3;
sample.layer(i).mue = 192.17;
sample.layer(i).sigma_z_model = [-6000. -3500. -100.];
i = 2;
sample.layer(i).material = 'TiCN';
sample.layer(i).diffracting = false;
sample.layer(i).thickness = 0.7;
sample.layer(i).mue = 1031.7;
i = 3;
sample.layer(i).material = 'Al2O3';
sample.layer(i).diffracting = true;
sample.layer(i).thickness = 2.3;
sample.layer(i).mue = 192.17;
sample.layer(i).sigma_z_model = [-800. -600. -550.];
i = 4;
sample.layer(i).material = 'TiCN';
sample.layer(i).diffracting = false;
sample.layer(i).thickness = 0.7;
sample.layer(i).mue = 1031.7;
i = 5;
sample.layer(i).material = 'Al2O3';
sample.layer(i).diffracting = true;
sample.layer(i).thickness = 2.3;
sample.layer(i).mue = 192.17;
sample.layer(i).sigma_z_model = [-250. -200. -220.];

sample.sigma_tau = [
    0.05  -5922  85
    0.25  -5563  92
    0.45  -5075  58
    0.65  -4821  30
    0.85  -4497  22
    1.30  -4179  23
    1.80  -3864  22
    2.30  -3602  25
    2.80  -3418  20
    3.4   -3195  18
];
