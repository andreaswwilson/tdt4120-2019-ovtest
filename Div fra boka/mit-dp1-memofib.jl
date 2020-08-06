
function fib(n)
	memo = Dict()
	function helper(n)
		if haskey(memo,n)
			return memo[n]
		end
		if n <= 2
			f = 1
		else
			f = helper(n-1) + helper(n-2)
		end
		memo[n] = f
		return f
	end
	return helper(n)
end

print(fib(100))