import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit

namespace SuzukiRH

open Set

/-- 軌道の候補集合（最大4点） -/
def orbitCandidates (s : ℂ) : Set ℂ :=
  {x | x = s ∨ x = conj s ∨ x = (1 - s) ∨ x = conj (1 - s)}

/-- act の値は候補集合に入る（完全展開） -/
theorem act_mem_candidates :
  ∀ (g : SymOp) (s : ℂ),
    act g s ∈ orbitCandidates s :=
by
  intro g s
  cases g with
  | ident =>
      simp [act, orbitCandidates]
  | conjOp =>
      simp [act, orbitCandidates]
  | reflectOp =>
      simp [act, orbitCandidates]
  | both =>
      simp [act, orbitCandidates]

/-- 軌道は候補集合に含まれる -/
theorem orbit_subset_candidates :
  ∀ s : ℂ, orbit s ⊆ orbitCandidates s :=
by
  intro s x hx
  rcases hx with ⟨g, hg⟩
  have hmem := act_mem_candidates g s
  simpa [hg] using hmem

end SuzukiRH
