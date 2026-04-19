import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds
import SuzukiRH.OrbitClassification
import SuzukiRH.Nontrivial
import SuzukiRH.OrbitExclusion
import SuzukiRH.ReflectionExclusion
import SuzukiRH.OrbitCollapse
import SuzukiRH.OrbitTransfer
import SuzukiRH.Symmetry

namespace SuzukiRH

open Set

theorem zero_implies_reflect_fixed :
  ∀ s : ℂ, IsNontrivialZero s →
    (1 - s) = s :=
by
  intro s hs
  classical

  have hclass := orbit_classification s

  cases hclass with
  | inl h1 =>
      -- orbit s = {s}
      have hmem : act SymOp.reflectOp s ∈ orbit s := by
        unfold orbit
        exact ⟨SymOp.reflectOp, by simp [act]⟩

      have hmem' : act SymOp.reflectOp s ∈ ({s} : Set ℂ) := by
        rw [h1] at hmem
        exact hmem

      have hEq : act SymOp.reflectOp s = s :=
        (Set.mem_singleton_iff.mp hmem')

      simpa [act] using hEq

  | inr hrest =>
    cases hrest with
    | inl h2 =>
        -- conj 2点 → 排除
        exfalso
        exact (not_orbit_subset_conj_pair s hs) h2.1

    | inr hrest2 =>
      cases hrest2 with
      | inl h3 =>
          -- reflect 2点
          exact reflect_pair_forces_fixed s hs h3.1

      | inr h4 =>
          -- ★新構造：固定点があれば伝播
          by_cases hfix :
            ∃ t, t ∈ orbit s ∧ (1 - t = t)

          · rcases hfix with ⟨t, ht, htfix⟩
            exact orbit_reflect_transfer s t ht htfix

          · -- なければ従来 collapse
            have horb : orbit s ⊆ {s, 1 - s} :=
              collapse_four_to_reflect s hs h4.1
            exact reflect_pair_forces_fixed s hs horb


theorem riemann_hypothesis_final :
  ∀ s : ℂ, IsNontrivialZero s →
    s.re = (1 : ℝ) / 2 :=
by
  intro s hs
  have h := zero_implies_reflect_fixed s hs
  exact fixed_point_critical_line s h

end SuzukiRH
