import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.ZetaProperties

namespace SuzukiRH

/-- 非自明零点は実軸上にない（標準的性質） -/
axiom nontrivial_zero_im_ne_zero :
  ∀ s : ℂ, IsNontrivialZero s → s.im ≠ 0

/-- conj 固定（= 実軸）と非自明零点は両立しない -/
theorem nontrivial_not_conj_fixed :
  ∀ s : ℂ, IsNontrivialZero s → conj s ≠ s :=
by
  intro s hs hfix
  -- conj s = s → Im(s) = 0
  have hreal : s.im = 0 := by
    -- 既存の補助（axiom）を使用
    have := conj_fixed_imp_real s hfix
    simpa using this
  -- 非自明零点は Im ≠ 0
  have him := nontrivial_zero_im_ne_zero s hs
  exact him hreal

end SuzukiRH
