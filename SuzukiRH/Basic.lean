import Mathlib.Data.Complex.Basic

namespace SuzukiRH

/-- 抽象ゼータ関数 -/
axiom zeta : ℂ → ℂ

/-- 非自明零点 -/
def IsNontrivialZero (s : ℂ) : Prop :=
  zeta s = 0 ∧ 0 < s.re ∧ s.re < 1

/-- 臨界線 -/
def OnCriticalLine (s : ℂ) : Prop :=
  s.re = (1 : ℝ) / 2

end SuzukiRH
