# JuliaSets -- A Julia package for fractals through iterated function application

The *JuliaSets* packages provides a simple function, ``JuliaSetEval``, for constructing an array that can be used to visualize Julia sets.

The function takes the inputs:

- ``R``, a rational function on the complex numbers (or just a function).
- ``x``, a 1-D array that will be used for grid points on the real line
- ``y``, a 1-D array that will be used for grid points on the imaginary line
- ``n_iter``, the maximum number of iterations on a point (default: 200)
- ``escape_tol``, if the norm of a point goes beyond this tolerance, consider it gone to infinity (default: 100 times the maximum absolute value of an initial point in the grid)

It returns as output an array ``A`` of size ``length(x)`` by ``length(y)``, where ``A[i,j]`` is the number of iterations it took ``z = x[i] + 1im * y[j]`` to surpass the ``escape_tol`` parameter in norm. If the point did not escape, set ``A[i,j]`` to ``escape_tol + 1``.

The function can be invoked as follows
```julia
using JuliaSets;

xrange = 1.0;
yrange = 1.25;
h = 1e-3;
x = -xrange:h:xrange;
y = -yrange:h:yrange;
n_iter = 200;
escape_tol = 100;

R(z) = z.^2 - 0.4 + 0.6im;

A = JuliaSetEval(R,x,y,n_iter,escape_tol);
''

It is interesting to visualize the output with, for example, the ``imshow`` function in *PyPlot*.
