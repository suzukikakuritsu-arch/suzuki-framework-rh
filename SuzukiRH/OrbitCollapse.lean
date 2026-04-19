import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.ReflectionExclusion

namespace SuzukiRH

open Complex

/--
OrbitCollapse:
非自明零点 s の orbit は {s, 1 - s} に潰れる
（対称性＋反射作用による2点軌道構造）
-/
theorem orbitCollapse
  (s : ℂ)
  (hs : IsNontrivialZero s) :
  ∀ x ∈ orbit s, x = s ∨ x = 1 - s := by
  intro x hx

  -- orbit は作用で生成される集合
  have hmem :
      ∃ g, act g s = x := hx

  rcases hmem with ⟨g, hg⟩

  -- ここが核心：作用は恒等か反射の2種類しかない
  cases g with
  | id =>
      left
      simpa using hg

  | reflectOp =>
      right
      simpa using hg

/--
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
    | inl h => subst h; exact ⟨SymOp.id, by simp [act]⟩
    | inr h => subst h; exact ⟨SymOp.reflectOp, by simp [act]⟩

end SuzukiRH
