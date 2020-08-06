def cutrod(p, n):
	if n <= 0:
		return 0
	q = -float('inf')
	for i in range(0, n):
		q = max(q, p[i] + cutrod(p, n-i-1))
	
	return q

def memoized_c

n = 20
p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
if len(p) <= n:
	p.extend([0] * (n - len(p)))

