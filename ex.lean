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

def sum2:(ℕ → ℕ ) → ℕ → ℕ → ℕ 
| f n m:= sum1(λ x, f(x+m))(n-m)

#eval sum2 (λ x,x) 2 10

def s:= [1,5,2,6,9,5,5]

def t:= [1,5,2,6,9,5,5]

#eval (99:ℕ )::s

def sumlist: list ℕ → ℕ 
|[]:= 0
|(a::l):= sumlist l + a
#eval s++t 
#eval sumlist s 
#eval s.length 

def sumlistg5: list ℕ → ℕ 
|[]:= 0
|(a::l):= if a > 5 then sumlistg5 l + a else sumlistg5 l

#eval sumlistg5 s
-- tinh cac phan tu chan
def sumlc(p:ℕ → bool): list ℕ → ℕ 
|[]:=0
|(a::l):= if p a then a + sumlc l else sumlc l
-- p chinh la bieu thu logic is_even
def is_even: ℕ → bool
|0:=tt
|1:=ff
|(n+2):=is_even n

#eval sumlc is_even s
