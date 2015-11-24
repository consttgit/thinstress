i = 1;
sample.layer(i).material = 'Al2O3';
sample.layer(i).diffracting = true;
sample.layer(i).thickness = 2.3;
sample.layer(i).mue = 192.17;
sample.layer(i).sigma_z_model = [-6500. -3800. -100.];
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
sample.layer(i).sigma_z_model = [-800. -600. -650.];
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
sample.layer(i).sigma_z_model = [-250. -200. -240.];

sample.sigma_tau = [
    0.05  -6429  45
    0.15  -6259  42
    0.25  -6035  40
    0.30  -5866  32
    0.45  -5574  38
    0.65  -5206  30
    0.85  -4886  31
    1.30  -4529  30
    1.80  -4183  29
    2.30  -3897  18
    2.80  -3688  17
    3.4   -3425  18
];
