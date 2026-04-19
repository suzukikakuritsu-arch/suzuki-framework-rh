namespace SuzukiRH

open Complex

inductive SymOp where
  | ident
  | reflect
  | conj
  | both

def act (g : SymOp) (s : ℂ) : ℂ :=
  match g with
  | SymOp.ident   => s
  | SymOp.reflect => 1 - s
  | SymOp.conj    => Complex.conj s
  | SymOp.both    => Complex.conj (1 - s)

def orbit (s : ℂ) : Set ℂ :=
  {x | ∃ g, act g s = x}

end SuzukiRH
