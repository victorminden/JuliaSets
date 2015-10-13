module JuliaSets
export JuliaSetEval

function JuliaSetEval{T<:Real}(R::Function, x::AbstractArray{T,1}, y::AbstractArray{T,1}, n_iter=200, escape_tol=100.0*abs(maximum(x)+maximum(y)im))
	A = zeros(Int,length(y),length(x));

	for j in eachindex(x)
		for i in eachindex(y)
			z = Complex{T}(x[j] + y[i]im);
			for k in 1:n_iter
				z = Complex{T}(R(z));
				if abs(z) >= escape_tol
					A[i,j] = k;
					break;
				end
			end
			if abs(z) < escape_tol
				A[i,j] = n_iter + 1;
			end
		end

	end
	return A;
end #JuliaSetEval

end # module
