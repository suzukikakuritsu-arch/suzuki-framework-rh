import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.ZetaProperties
import SuzukiRH.OrbitReduction   -- ★ これが必要

namespace SuzukiRH

/-- 非自明零点は実軸上にない -/
axiom nontrivial_zero_im_ne_zero :
  ∀ s : ℂ, IsNontrivialZero s → s.im ≠ 0

/-- conj 固定と非自明零点は両立しない -/
theorem nontrivial_not_conj_fixed :
  ∀ s : ℂ, IsNontrivialZero s → conj s ≠ s :=
by
  intro s hs hfix
  -- conj 固定 → Im = 0
  have hreal : s.im = 0 :=
    conj_fixed_imp_real s hfix

  -- 非自明零点 → Im ≠ 0
  have him := nontrivial_zero_im_ne_zero s hs

  exact him hreal

end SuzukiRH
