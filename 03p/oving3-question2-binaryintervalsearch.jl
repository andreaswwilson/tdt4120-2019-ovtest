


## Du skal implementere denne funksjonen 
function getMedian(list,coordinate)
function binaryintervalsearch(x, delta, coordinate)
    indexinterval = [-1, -1]
    n = size(x,1)
    median = (x[floor(Int,(n+1)/2),coordinate] + x[ceil(Int,(n+1)/2),coordinate])/2
	bottom_interval = median - delta
	top_interval = median + delta
	middle = div(size(x,1),2)
	for i in 1:size(x,1)
		if (indexinterval[1] == -1) &&  (x[i,coordinate] >= bottom_interval && (x[i,coordinate] <= top_interval))
			indexinterval[1] = i
			indexinterval[2] = i
		end
		if (indexinterval[1] != -1 && x[i,coordinate] <= top_interval)
			indexinterval[2] = i
		end
	end
	(indexinterval[1],indexinterval[2])
end





### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test binaryintervalsearch([1 2; 2 3; 3 0; 4 0; 5 1], 1.5, 1) == (2, 4)
    @test binaryintervalsearch([1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0], 1, 1) == (2, 5)
    @test binaryintervalsearch([1 2; 2 0; 3 3; 4 4], 0.25, 1) == (-1, -1) # Tom mengde
    @test binaryintervalsearch([2 1; 3 2; 0 3; 0 4; 1 5], 1.5, 2) == (2, 4)

end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n\n")
