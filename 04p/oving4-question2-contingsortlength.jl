## Du skal implementere denne funksjonen 
function countingsortlength(A)
	# Må legge til 1 her pga den tomme strengen
	# k er den lengste strengen vi har
	k = maximum(length, A) + 1
	count = zeros(Int64, k)
	B = []
	for i in 1:length(A)
		push!(B, "")
	end
	# Count the occurences
	for word in A
		# Må legge til 1 her pga den tomme strengen
		count[length(word) + 1] += 1
	end
	for i in 2:k
		count[i] += count[i - 1]
	end
	for i in length(A):-1:1
		index = length(A[i]) + 1
		B[count[index]] = A[i]
		count[index] -= 1
	end

	return B
end
