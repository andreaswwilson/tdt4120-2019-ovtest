include("oving04-question1-countingsortletters.jl")
include("oving04-question2-contingsortlength.jl")

## Du skal implementere denne funksjonen 
function flexradix(A, maxlength)
    n = length(A)
    sorted_array = countingsortlength(A)
    count_lenght = zeros(Int, n)
	# make array with all lengths of the array
	# B is sorted by length at this time
    for i in 1:n
        count_lenght[i] = length(sorted_array[i])
    end
	while maxlength > 0
		# Iterate the count array and find the lowest index where
		# we have the length of maxlength 
		for i in 1:n
			if count_lenght[i] == maxlength
				# We now know that all elements from i:end have the length maxlength
				# And we can sort all these elements by the current least significant letter
				sorted_array[i:end] = countingsortletters(sorted_array[i:end],maxlength)
				# Decrease the count by 1. Dont need to decrease i+1:end because we will 
				# stop before that during our iteration
				count_lenght[i] -= 1
				break
			end
		end
		maxlength -= 1
		
	end
	return sorted_array
end



### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

using Test
@testset "Basic tests" begin
    #@test flexradix(["d", "c", "b", "a"], 1) == ["a", "b", "c", "d"]
    @test flexradix(["d", "c", "b", ""], 1) == ["", "b", "c", "d"]
    # @test flexradix(["jeg", "elsker", "deg"], 6) == ["deg", "elsker", "jeg"]
    # @test flexradix(["denne", "oppgaven", "mangler", "emojies"], 8) == ["denne", "emojies", "mangler", "oppgaven"]
    # @test flexradix(["kobra", "aggie", "agg", "kort", "hyblen"], 6) == ["agg", "aggie", "hyblen", "kobra", "kort"] # Fra oppgaven
end

# println("\nFungerte alt? Prøv å kjør koden i inginious!")
# println("Husk at disse testene ikke alltid sjekker alle edge-cases")
# println("---------------------------------------------------------\n\n")