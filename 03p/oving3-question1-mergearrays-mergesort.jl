

## Du skal implementere denne funksjonen 
#x og y er to sorterte arrays, coordinate angir koordinat akse
function mergearrays(x, y, coordinate)
	# Lag en to-dimensjonal liste fylt med 0
	lengthX = size(x, 1)
	lengthY = size(y, 1)
	sorted_array = zeros(lengthX + lengthY, 2)

	i = 1 # index x
	j = 1 # index y
	k = 1 # index sorted_array

	# Så lenge iallfall x eller y har igjen elementer fortsetter vi
	while ((i - 1) < lengthX || (j - 1) < lengthY)
		# Dersom x er tom for elementer, forsett å legg til alle elementene fra y
		if ((i - 1) == lengthX)
			sorted_array[k, :] = y[j,:]
			j += 1 
		# Derson y er tom for elementer, fortsett å legg til alle elementene fra x
		elseif ((j - 1) == lengthY)
			sorted_array[k,:] = x[i,:]
			i += 1

		# Både x og y har igjen elementer
		else		
			if (x[i,coordinate] <= y[j,coordinate])
				sorted_array[k,:] = x[i,:]
				i += 1
    		else
				sorted_array[k,:] = y[j,:]
				j += 1
			end
		end
		# Øk indeksen til sorted_array
		k += 1
	end
	# Retuner svar
	sorted_array
end

## Du skal implementere denne funksjonen 
#x usortert array, coordinate angir koordinat akse vi skal sortere langs
function mergesort(x, coordinate)
	# Sorterer 
	n = size(x, 1)
	q = div(n, 2)
	if n <= 1
		return x
	else
		leftList = x[1:q,:]
		rightList = x[q + 1:end,:]
		return mergearrays(mergesort(leftList, coordinate), mergesort(rightList, coordinate), coordinate)
	end
end





### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
println("Kjører testene for mergeararys!")
@testset "Basic tests for mergeararys" begin
    @test mergearrays([1 0; 3 0], [2 0; 4 0], 1) == [1 0; 2 0; 3 0; 4 0]
    @test mergearrays([1 0; 4 0], [2 0; 3 0], 1) == [1 0; 2 0; 3 0; 4 0]
end

println("\n--------------------------------------------\n")

println("Kjører testene for mergesort!")
println("Husk at om du gir et array med float, any, eller int, gjør det ikke noe.\n")
@testset "Basic tests for mergesort" begin
    @test mergesort([4 0; 3 0; 1 0; 2 0],1) == [1 0; 2 0; 3 0; 4 0]
    @test mergesort([1 2; 4 6; 2 1],1) == [1 2; 2 1; 4 6]
    @test mergesort([1 2; 4 6; 2 1],2) == [2 1; 1 2; 4 6]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n\n")
