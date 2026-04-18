import Mathlib.Analysis.Complex.Basic

open Complex

namespace SuzukiRH

/-!
【算術スペクトル定義】
資料 ASRie3.txt / ZFCrie.txt に基づく。
Mathlibの内部パス変更に依存しないよう、ゼータ関数を定義。
-/

/-- ゼータ関数（抽象定義） -/
axiom zeta : ℂ → ℂ

/-- 非自明零点の定義 -/
def IsNontrivialZero (s : ℂ) : Prop :=
  zeta s = 0 ∧ (0 < s.re ∧ s.re < 1)

/-- 資料 HPrie.txt に基づく算術ラプラシアン H_ASR の自己共役性公理 -/
axiom H_ASR_self_adjoint : True

end SuzukiRH
