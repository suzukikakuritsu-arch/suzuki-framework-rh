import SuzukiRH.ReflectionExclusion

namespace SuzukiRH

theorem FinalStep (s : ℂ) :
  act SymOp.reflect s ∈ orbit s := by
  use SymOp.reflect
  simp [act, orbit]

theorem MainTheorem (s : ℂ) :
  orbit s = {s, 1 - s} :=
  orbit_eq_pair s trivial

end SuzukiRH
