import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.ZetaProperties
import SuzukiRH.FunctionalEquation

namespace SuzukiRH

def reflect (s : ℂ) : ℂ := 1 - s

theorem reflect_involutive :
  ∀ s : ℂ, reflect (reflect s) = s :=
by
  intro s
  simp [reflect]

theorem zero_full_symmetry :
  ∀ s : ℂ, zeta s = 0 →
    zeta (conj s) = 0 ∧
    zeta (reflect s) = 0 :=
by
  intro s hs
  constructor
  · exact zero_conj_closed s hs
  · simpa [reflect] using zero_symmetry_1_minus s hs

/-- ★ 修正された部分 -/
theorem fixed_point_critical_line :
  ∀ s : ℂ, reflect s = s → s.re = (1 : ℝ) / 2 :=
by
  intro s h
  have h' : 1 - s = s := by simpa [reflect] using h

  -- 実部を取る
  have hreal : (1 : ℝ) - s.re = s.re := by
    simpa using congrArg Complex.re h'

  -- 両辺に s.re を足す
  have hsum : (1 : ℝ) = s.re + s.re := by
    have := hreal
    linarith

  -- 2 * s.re = 1
  have h2 : 2 * s.re = 1 := by
    simpa [two_mul] using hsum.symm

  -- 割る
  have : s.re = 1 / 2 := by
    have := h2
    field_simp at this
    exact this

  exact this

end SuzukiRH
