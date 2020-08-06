

function cutrod(p,n)
	memo = Dict(0 => 0)
	function helper(n)
		if haskey(memo,n)
			return memo[n]
		end
		q = -1
		for i in 1:n
			q = max(q,p[i]+helper(n-i))
		end
		memo[n] = q
		return q
	end
	return helper(n)

end


n = 4
p = [4,5,12,15]
if n > length(p)
		append!(p,zeros(Int,n-length(p)))
end
print(cutrod(p,n))

