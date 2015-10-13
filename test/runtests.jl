using JuliaSets
using Base.Test


# Test 1: fixed points shouldn't diverge
x = -1:0.1:1;
y = -1:0.1:1;

R(z) = z;
n_iter = 10;

A=JuliaSetEval(R,x,y,n_iter);
@test all(A.==n_iter+1);
