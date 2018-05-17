def add :ℕ → ℕ := (λ x, x+3)

#eval add 4

meta def foo : ℕ → ℕ
| n := foo n + 1

#reduce foo 5

meta def m91 : ℕ → ℕ
| n := if n > 100 then n - 10 else m91 (m91 (n + 11))

#eval m91 10
#eval m91 100
#eval m91 1000


meta def fact : ℕ → ℕ 
| n := if n < 1 then 1 else fact(n-1)*n 

#eval fact 5

def fibo : ℕ → ℕ 
|0:=1
|1:=1 
|(n + 2) :=  fibo(n+1) + fibo(n)

#eval fibo 5

open nat
def hmu :ℕ → ℕ → ℕ 
|x 0 := 1
|x 1 := x
|x (succ n ) :=(hmu x n)*x 

#eval hmu 2 64

def sum1:(ℕ → ℕ ) → ℕ → ℕ 
| f 0:=  f 0
| f (n+1):= sum1 f (n) + f (n+1)

#eval sum1 (λ x,x) 10

