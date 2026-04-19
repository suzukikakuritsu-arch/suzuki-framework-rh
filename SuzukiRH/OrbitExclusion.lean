import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds
import SuzukiRH.Nontrivial

namespace SuzukiRH

open Set

/--
  反転2点ケースは非自明零点では起きない
-/
axiom not_orbit_subset_reflect_pair :
  ∀ s : ℂ, IsNontrivialZero s →
    ¬ (orbit s ⊆ {s, 1 - s} ∧ s ≠ 1 - s)

/--
  反転型から固定を引き出す
-/
theorem reflect_pair_forces_fixed :
  ∀ s : ℂ, IsNontrivialZero s →
    (orbit s ⊆ {s, 1 - s}) →
    (1 - s) = s :=
by
  intro s hs horb
  by_contra hneq

  -- 型合わせ：¬(1 - s = s) → s ≠ 1 - s
  have hne : s ≠ 1 - s := by
    intro h
    have : (1 - s) = s := by simpa using h.symm
    exact hneq this

  have hbad : orbit s ⊆ {s, 1 - s} ∧ s ≠ 1 - s :=
    ⟨horb, hne⟩

  exact (not_orbit_subset_reflect_pair s hs) hbad

end SuzukiRH
