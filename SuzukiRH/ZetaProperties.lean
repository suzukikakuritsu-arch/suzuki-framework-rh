import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic

namespace SuzukiRH

open Complex

/-- 共役対称性 -/
axiom zeta_conj :
  ∀ s : ℂ, zeta (Complex.conj s) = Complex.conj (zeta s)

/-- 零点の共役閉性 -/
theorem zero_conj_closed :
  ∀ s : ℂ, zeta s = 0 → zeta (Complex.conj s) = 0 :=
by
  intro s hs
  have h := zeta_conj s
  simp [hs] at h
  exact h

/-- 臨界帯制約 -/
axiom no_zero_outside_strip :
  ∀ s : ℂ, zeta s = 0 → 0 < s.re → s.re < 1

end SuzukiRH
