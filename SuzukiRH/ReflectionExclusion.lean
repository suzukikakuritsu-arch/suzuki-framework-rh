import SuzukiRH.OrbitCollapse

namespace SuzukiRH

theorem reflection_exclusion (s : ℂ) :
  s ≠ 1 - s := by
  intro h
  have : s ∈ orbit s := by
    use SymOp.reflect
    simp [act, orbit, h]
  have h1 := orbitCollapse s trivial s this
  cases h1 <;> contradiction

end SuzukiRH
