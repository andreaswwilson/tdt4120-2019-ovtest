### Du skal implementere denne funksjonen ###
function cumulative(weights)
	rows, cols = size(weights)
	for row in 2:rows
		for col in 1:cols
			minimum_previous = weights[row-1,col]
			if (col-1) >= 1
				minimum_previous = min(minimum_previous,weights[row-1,col-1])
			end
			if (col+1) <= cols
				minimum_previous = min(minimum_previous,weights[row-1,col+1])
			end
			weights[row, col] += minimum_previous
		end
		
	end
	return weights
end


### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

# printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test cumulative([1 1 ; 1 1; 1 1]) == [1 1 ;2 2; 3 3]
	@test cumulative([1 1 1; 0 0 0]) == [1 1 1; 1 1 1]
    #Dette er samme eksempel som det vist i oppgaveteskten
	@test cumulative([3  6  8 6 3; 7  6  5 7 3; 4  10 4 1 6; 10 4  3 1 2;6  1  7 3 9])== [3  6  8  6  3;10 9  11 10 6;13 19 13 7  12;23 17 10 8  9;23 11 15 11 17;]
end


# println("\nFungerte alt? Prøv å kjør koden i inginious!")
# println("Husk at disse testene ikke alltid sjekker alle edge-cases")
# println("---------------------------------------------------------\n\n")
