import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds
import SuzukiRH.Nontrivial

namespace SuzukiRH

open Set

axiom not_orbit_subset_reflect_pair :
  ∀ s : ℂ, IsNontrivialZero s →
    ¬ (orbit s ⊆ {s, 1 - s} ∧ s ≠ 1 - s)

theorem reflect_pair_forces_fixed :
  ∀ s : ℂ, IsNontrivialZero s →
    (orbit s ⊆ {s, 1 - s}) →
    (1 - s) = s :=
by
  intro s hs horb
  classical

  by_contra hneq
  -- hneq : ¬((1 - s) = s)

  -- ★ここで必ず新しく作る（hneqは使わない）
  have hne : s ≠ 1 - s := by
    intro h
    -- h : s = 1 - s
    have : (1 - s) = s := by simpa using h.symm
    exact hneq this

  -- ★ここで hneq を絶対に使わない
  have hbad : orbit s ⊆ {s, 1 - s} ∧ s ≠ 1 - s :=
    ⟨horb, hne⟩

  exact (not_orbit_subset_reflect_pair s hs) hbad

end SuzukiRH
