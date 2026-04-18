import Mathlib.Data.Complex.Basic

namespace SuzukiRH

open Complex

/-
  ゼータ関数（抽象）
-/
axiom zeta : ℂ → ℂ

/-
  非自明零点
-/
def IsNontrivialZero (s : ℂ) : Prop :=
  zeta s = 0 ∧ s ≠ 0 ∧ s ≠ 1

end SuzukiRH
