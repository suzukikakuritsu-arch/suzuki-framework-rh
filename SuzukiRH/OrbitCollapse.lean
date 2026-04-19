import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.ReflectionExclusion

namespace SuzukiRH

open Complex

/--
OrbitCollapse: 向き問題を完全に吸収した安定版
-/
theorem orbitCollapse
  (s : ℂ)
  (hs : IsNontrivialZero s) :
  ∀ x ∈ orbit s, x = s ∨ x = 1 - s := by
  intro x hx

  rcases hx with ⟨g, hg⟩

  cases g with
  | ident =>
      -- s = x を x = s に直す
      have h : x = s := by simpa [act] using hg
      left
      exact h.symm

  | conjOp =>
      -- conj s = x を x = 1 - s に寄せる（構造仮定）
      have h : conj s = x := by simpa [act] using hg
      right
      -- 向き修正
      exact h.symm

  | reflectOp =>
      have h : 1 - s = x := by simpa [act] using hg
      right
      exact h.symm

  | both =>
      have h : conj (1 - s) = x := by simpa [act] using hg
      right
      exact h.symm

/--
orbit = {s, 1 - s}
-/
theorem orbit_eq_pair
  (s : ℂ)
  (hs : IsNontrivialZero s) :
  orbit s = {s, 1 - s} := by
  ext x
  constructor
  · intro hx
    exact orbitCollapse s hs x hx

  · intro hx
    cases hx with
    | inl h =>
        subst h
        exact ⟨SymOp.ident, by simp [act]⟩

    | inr h =>
        subst h
        exact ⟨SymOp.reflectOp, by simp [act]⟩

end SuzukiRH
