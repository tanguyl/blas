-module(sgbmv_test).
-include_lib("eunit/include/eunit.hrl").

sgbmv_test()->
    M = 4,
    N = 4,
    Kl = 1,
    Ku = 1,
    A = blas:new(chain:ltb(s, [0,1,2, 5,6,7, 10,11,12, 15,16,0])),
    X = blas:new(chain:ltb(s, [1.0, 2.0, 3.0, 4.0])),
    Y = blas:new(chain:ltb(s, [5.0, 6.0, 7.0, 8.0])),
    blas:run({sgbmv, blasRowMajor, blasNoTrans, M, N, Kl, Ku, 1.0, A, Kl+Ku+1, X, 1, 0.0, Y, 1}),
    %io:format("~w\n", chain:btl(s, blas:to_bin(Y))),
    [5.0, 38.0, 101.0, 109.0] = chain:btl(s, blas:to_bin(Y)).