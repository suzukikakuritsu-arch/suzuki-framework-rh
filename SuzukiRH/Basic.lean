import Mathlib.Analysis.Complex.Basic

namespace SuzukiRH
open Complex

-- 資料 ASRie3.txt に基づくゼータの定義
axiom zeta : ℂ → ℂ

def IsNontrivialZero (s : ℂ) : Prop :=
  zeta s = 0 ∧ (0 < s.re ∧ s.re < 1)

end SuzukiRH
