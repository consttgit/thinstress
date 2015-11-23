i = 1;
sample.layer(i).material = '100Cr6';
sample.layer(i).diffracting = true;
sample.layer(i).thickness = 300;
sample.layer(i).mue = 608.15;
sample.layer(i).sigma_z_model = [
    -500. -1250. -600. 0. 250. 240. 160. 100. 55. 25.  0.
];

sample.sigma_tau = [
    1    -534  15
    5    -732  12
    10   -880  7
    15   -937  9
    30   -892  8
    45   -751  9
    60   -645  6
    75   -559  7
    90   -499  5
    105  -448  6
    120  -409  4
    135  -378  4
    150  -357  3
];
