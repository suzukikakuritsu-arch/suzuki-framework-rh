import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic

namespace SuzukiRH

open Complex

/-
  ζの基本的性質（まだaxiom）
  → 後でmathlibに置換可能
-/

/-- 共役対称性 ζ(conj s) = conj(ζ s) -/
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

/-- 臨界帯外排除（弱形式） -/
axiom no_zero_outside_strip :
  ∀ s : ℂ, zeta s = 0 → 0 < s.re → s.re < 1

/-- 零点は臨界帯に存在 -/
theorem zero_in_strip :
  ∀ s : ℂ, zeta s = 0 → 0 < s.re → s.re < 1 :=
by
  intro s hs hpos
  exact no_zero_outside_strip s hs hpos

end SuzukiRH
