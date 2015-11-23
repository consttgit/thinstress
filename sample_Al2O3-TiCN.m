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
    0.05  -6409  25
    0.15  -6224  22
    0.25  -6003  20
    0.30  -5896  12
    0.45  -5562  18
    0.65  -5199  10
    0.85  -4918  11
    1.30  -4491  10
    1.80  -4186  9
    2.30  -3933  8
    2.80  -3694  7
    3.4   -3459  8
];
