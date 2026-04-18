import Mathlib.Data.Complex.Basic

namespace SuzukiRH

open Complex

-- ゼータ関数は一旦抽象に戻す（ここ重要）
axiom zeta : ℂ → ℂ

def IsNontrivialZero (s : ℂ) : Prop :=
  zeta s = 0 ∧ 0 < s.re ∧ s.re < 1

end SuzukiRH
