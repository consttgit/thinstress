i = 1;
sample.layer(i).material = 'Al2O3';
sample.layer(i).diffracting = true;
sample.layer(i).thickness = 2.3;
sample.layer(i).mue = 192.17;
sample.layer(i).sigma_z_model = [-6000. -3500. 0.];
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
    0.05   -5880   85
    0.25   -5577   92
    0.45   -5098   58
    0.65   -4836   30
    0.85   -4500   22
    1.30   -4165   23
    1.80   -3835   22
    2.30   -3555   25
    2.80   -3293   20
    3.4    -3036   18
];
