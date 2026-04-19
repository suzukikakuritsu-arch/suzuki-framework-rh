import SuzukiRH.Basic

namespace SuzukiRH

theorem orbitCollapse
  (s : ℂ)
  (hs : True) :
  ∀ x ∈ orbit s, x = s ∨ x = 1 - s := by
  intro x hx
  rcases hx with ⟨g, hg⟩
  cases g with
  | ident =>
      left; simpa [act, orbit] using hg
  | reflect =>
      right; simpa [act, orbit] using hg
  | conj =>
      right; simpa [act, orbit] using hg
  | both =>
      right; simpa [act, orbit] using hg

theorem orbit_eq_pair
  (s : ℂ)
  (hs : True) :
  orbit s = {s, 1 - s} := by
  ext x
  constructor
  · intro hx
    exact orbitCollapse s hs x hx
  · intro hx
    cases hx with
    | inl h => subst h; use SymOp.ident; simp [act]
    | inr h => subst h; use SymOp.reflect; simp [act]

end SuzukiRH
