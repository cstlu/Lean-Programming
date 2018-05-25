-- implicit agruments
---- Dinh nghi ham dong nhat
def id1(α : Type) (x: α ):α := x 
-- π (α :Type),α → α
#eval id1 ℕ 12
#eval id1 ℤ (-12)
#eval id1 string "Thang"

--Nhan xet: Tham so cua ham id1 tu x se suy ra kieu α 

def id2{α : Type} (x: α ):α := x 
-- π {α :Type},α → α
#eval id2 (12)
#eval id2 "thang"
#eval id2 true

-- INDUCTIVE TYPE
-- Xay dung kieu du lieu moi

universe u 
inductive weekday: Type
| sunday: weekday -- goi la contructor
| monday: weekday
|tuesday: weekday
|wednesday: weekday
|thursday: weekday
|friday: weekday
|saturday: weekday
--weekday.rec_on 
--kieu liet ke
#print weekday.rec

#eval weekday

-- Ham gan gia tri cho cac ngay trong tuan

def number_of_day: weekday → ℕ := weekday.rec 1 2 3 4 5 6 7

--test 1
#eval number_of_day weekday.friday
--test 2
def dd: weekday:= weekday.monday
#eval number_of_day dd

def next_day: weekday → weekday
| sunday: monday -- goi la contructor
| monday: tuesday
|tuesday: wednesday
|wednesday: thursday
|thursday: friday
|friday: saturday
|saturday: sunday

-- CARTESIAN PRODUCTS

universe u v
inductive tich {α :Type u} {β :Type v}
|mk: α → β → tich 

def p: tich ℕ ℕ : tich.mk 10 12
#print p 


inductive BinaryTree(α : Type u)
|nil {}: BinaryTree 
|leaf : α → BinaryTree 
|node: α → BinaryTree → BinaryTree → BinaryTree

def bt1a :BinaryTree ℕ
:= BinaryTree.node 1 (BinaryTree.leaf 2) (BinaryTree.leaf 3)

def bt1b :BinaryTree ℕ
:= BinaryTree.node 1 (BinaryTree.leaf 2) (BinaryTree.nil)

#eval bt1a 

namespace BinaryTree
open BinaryTree
def nVers { α :Type}: BinaryTree α → ℕ 
| nil:=0
| (leaf a):= 1
| (node a T1 T2):= 1 + (nVers T1) + (nVers T2)

#eval nVers bt1a

def isNil{ α :Type }: BinaryTree α → bool
| nil := tt 
| (leaf a):= ff 
| (node a T1 T2):= ff

def nEdges{ α :Type}: BinaryTree α → ℕ 
| nil := 0
| (leaf a):= 0
|(node a T1 T2):= if isNil T1 ∧ isNil T2 then 0 else 
if isNil T1 then (nEdges T2) + 1 else
if isNil T2 then (nEdges T1) +1 else 
(nEdges T1)+(nEdges T2) + 2


#eval nEdges bt1a

end BinaryTree
