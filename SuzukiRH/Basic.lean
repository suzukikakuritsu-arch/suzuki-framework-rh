import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Zeta.Basic

open Complex

namespace SuzukiRH

/-- 
【算術的スペクトル定義】
資料 ASRie3.txt に基づく。
非自明零点とは、ゼータ関数の零点であり、かつ臨界帯（0 < Re(s) < 1）に存在するもの。
-/
def IsNontrivialZero (s : ℂ) : Prop :=
  RiemannZeta s = 0 ∧ (0 < s.re ∧ s.re < 1)

/-- 
資料 HPrie.txt / ZFCrie.txt に基づく算術ラプラシアン H_ASR。
自己共役作用素としての実体は、将来的に SpectralTriple として実装。
-/
axiom H_ASR_self_adjoint : True

end SuzukiRH
