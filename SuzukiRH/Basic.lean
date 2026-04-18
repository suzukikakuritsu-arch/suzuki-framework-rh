import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Zeta

open Complex

namespace SuzukiRH

/-- 
【算術的スペクトル定義】
資料 ZFCrie.txt / ASRie3.txt に基づく。
ゼータ関数は算術ラプラシアン H_ASR のフレドホルム行列式 det(I - e^{-sH}) と同値。
-/
noncomputable def IsNontrivialZero (s : ℂ) : Prop :=
  zeta s = 0 ∧ (0 < s.re ∧ s.re < 1)

/-- 算術的複雑度 ω (資料 AUFv15.txt) -/
def arithmetic_complexity (n : ℕ) : ℕ :=
  (Nat.factors n).dedup.length

end SuzukiRH
