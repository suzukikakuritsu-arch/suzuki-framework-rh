import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds

namespace SuzukiRH

open Set

/-- conj 固定なら実数部に制約 -/
axiom conj_fixed_imp_real :
  ∀ s : ℂ, conj s = s → s.im = 0

/-- reflect 固定なら臨界線 -/
theorem reflect_fixed_imp_critical :
  ∀ s : ℂ, (1 - s) = s → s.re = (1 : ℝ) / 2 :=
by
  intro s h
  exact fixed_point_critical_line s h

end SuzukiRH
