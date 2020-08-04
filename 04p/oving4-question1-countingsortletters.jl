## Du skal implementere denne funksjonen 
function countingsortletters(A, position)
	ALPHABETH = collect('a':'z')
	k = chartodigit('z') - chartodigit('a') + 1 # Number of possible elements, ie 26
	count = zeros(Int64, k)
	B = []
	for i in 1:length(A)
		push!(B, "")
	end

	

	
	# Count the occurences
	for word in A
		count[chartodigit(word[position])] += 1
	end

	for i in 2:k
		count[i] += count[i - 1]
	end

	for i in length(A):-1:1
		 B[count[chartodigit(A[i][position])]] = A[i]
		 count[chartodigit(A[i][position])] -= 1
	end
	return B




end


# Don't mind me 
function chartodigit(character)
    # Dette er en hjelpefunksjon for å få omgjort en char til tall
    # Den konverterer 'a' til 1, 'b' til 2 osv.
    # Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.
    return character - '`'
end

