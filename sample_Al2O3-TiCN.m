i = 1;
sample.layer(i).material = 'Al2O3';
sample.layer(i).diffracting = true;
sample.layer(i).thickness = 2.3;
sample.layer(i).mue = 192.17;
sample.layer(i).sigma_z_model = [-2000. -1200. 0.];
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
sample.layer(i).sigma_z_model = [400. 350. 300.];
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
sample.layer(i).sigma_z_model = [150. 120. 100.];

sample.sigma_tau = [
    0.05  -1982  18
    0.25  -1847  12
    0.45  -1713  15
    0.65  -1607  10
    0.85  -1535  11
    1.30  -1403  8
    1.80  -1294  9
    2.30  -1191  7
    2.80  -1087  9
    3.4   -985   6
];
