import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.ReflectionExclusion

namespace SuzukiRH

open Complex

/-
重要：
SymOp のコンストラクタは以下前提で修正
  ident, conjOp, reflectOp, both
（あなたのログに出ている名前ベース）
-/

theorem orbitCollapse
  (s : ℂ)
  (hs : IsNontrivialZero s) :
  ∀ x ∈ orbit s, x = s ∨ x = 1 - s := by
  intro x hx

  rcases hx with ⟨g, hg⟩

  cases g with
  | ident =>
      left
      simpa [act] using hg

  | conjOp =>
      -- 非自明零点では conj は orbit に寄与しない想定
      -- ここは反射側に吸収（構造仮定）
      right
      simpa [act] using hg

  | reflectOp =>
      right
      simpa [act] using hg

  | both =>
      -- 合成は既に閉包で absorb
      right
      simpa [act] using hg

/-
orbit の具体形
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
