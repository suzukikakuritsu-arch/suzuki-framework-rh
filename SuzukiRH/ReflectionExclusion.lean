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
  -- hneq : (1 - s) ≠ s

  -- 必要な形に変換
  have hne : s ≠ 1 - s := by
    intro h
    have : (1 - s) = s := by simpa using h.symm
    exact hneq this

  have hbad : orbit s ⊆ {s, 1 - s} ∧ s ≠ 1 - s :=
    ⟨horb, hne⟩

  -- ここが核心：False を作る
  have hf : False :=
    (not_orbit_subset_reflect_pair s hs) hbad

  -- False から何でも出せる
  exact False.elim hf

end SuzukiRH
