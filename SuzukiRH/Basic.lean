import Mathlib.Analysis.SpecialFunctions.Zeta
import Mathlib.Data.Complex.Basic

namespace SuzukiRH

open Complex

/-
  mathlib のリーマンゼータ関数
-/
noncomputable def zeta := Complex.riemannZeta

/-
  非自明零点（古典定義に寄せる）
  ※ trivial zeros (-2, -4, ...) を排除するため Re(s) > 0 を採用
-/
def IsNontrivialZero (s : ℂ) : Prop :=
  zeta s = 0 ∧ 0 < s.re ∧ s.re < 1

end SuzukiRH
