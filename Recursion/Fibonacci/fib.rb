def fibs(n)
	if n == 0
		fib = 0
	else
		fib = 1
		fib_prev = 0
		for i in (1..n-1)
			temp = fib
			fib = fib + fib_prev
			fib_prev = temp
		end
	end
	fib
end


def fibs_rec(n)
  return 0 if n == 0
  return 1 if n == 1
  fibs_rec(n-1) + fibs_rec(n-2) if n >= 2
end

def fibs_rec_2(n)
	return n if n <= 1
	fibs_rec_2(n-1) + fibs_rec_2(n-2) if n >= 2
end


puts fibs(4)
puts fibs(10)
puts fibs_rec(4)
puts fibs_rec(10)
puts fibs_rec_2(4)
puts fibs_rec_2(10)