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

/--
  軌道は候補集合に含まれる（構造公理）
  ※ ここは後で act の場合分けから lemma に落とせる
-/
axiom orbit_subset_candidates :
  ∀ s : ℂ, orbit s ⊆ orbitCandidates s

end SuzukiRH
