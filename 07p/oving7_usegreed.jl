function usegreed(coins)
    for i in 1:length(coins) - 1
        for j in i + 1:length(coins)
            if mod(coins[i], coins[j]) != 0
              return false
            end
        end
    end
    
    return true
end
  
usegreed([20, 10, 5, 1])

# ### Tester ###
# # Disse testene blir kjørt når du kjører filen
# # Du trenger ikke å endre noe her, men du kan eksperimentere!

# printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color=:magenta)

using Test
@testset "Tester" begin

	@test usegreed([20, 10, 5, 1]) == true
    @test usegreed([20, 15, 10, 5, 1]) == false
    @test usegreed([100, 1]) == true
    @test usegreed([5, 4, 3, 2, 1]) == false
    @test usegreed([1]) == true

end

# println("\nFungerte alt? Prøv å kjør koden i inginious!")
# println("Husk at disse testene ikke alltid sjekker alle edge-cases")
# println("---------------------------------------------------------\n\n")
