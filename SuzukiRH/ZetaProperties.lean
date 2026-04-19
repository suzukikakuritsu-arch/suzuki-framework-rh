import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic

namespace SuzukiRH

/-- 共役（抽象化） -/
axiom conj : ℂ → ℂ

/-- 共役対称性 -/
axiom zeta_conj :
  ∀ s : ℂ, zeta (conj s) = conj (zeta s)

/-- 零点の共役閉性 -/
theorem zero_conj_closed :
  ∀ s : ℂ, zeta s = 0 → zeta (conj s) = 0 :=
by
  intro s hs
  have h := zeta_conj s
  simp [hs] at h
  exact h

/-- 臨界帯制約 -/
axiom no_zero_outside_strip :
  ∀ s : ℂ, zeta s = 0 → 0 < s.re → s.re < 1

end SuzukiRH
