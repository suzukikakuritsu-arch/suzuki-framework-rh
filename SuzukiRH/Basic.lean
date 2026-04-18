import Mathlib.Data.Complex.Basic

namespace SuzukiRH

open Complex

/-- ゼータ関数（現段階では抽象） -/
axiom zeta : ℂ → ℂ

/-- 非自明零点（臨界帯に制限） -/
def IsNontrivialZero (s : ℂ) : Prop :=
  zeta s = 0 ∧ 0 < s.re ∧ s.re < 1

/-- 臨界線 -/
def OnCriticalLine (s : ℂ) : Prop :=
  s.re = (1 : ℝ) / 2

end SuzukiRH
