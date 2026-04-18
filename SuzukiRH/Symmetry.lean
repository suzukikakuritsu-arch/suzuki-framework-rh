import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.ZetaProperties
import SuzukiRH.FunctionalEquation

namespace SuzukiRH

theorem zero_full_symmetry :
  ∀ s : ℂ, zeta s = 0 →
    zeta (conj s) = 0 ∧
    zeta (1 - s) = 0 :=
by
  intro s hs
  constructor
  · exact zero_conj_closed s hs
  · exact zero_symmetry_1_minus s hs

def reflect (s : ℂ) : ℂ := 1 - s

theorem fixed_point_critical_line :
  ∀ s : ℂ, reflect s = s → s.re = (1 : ℝ) / 2 :=
by
  intro s h
  have h' : 1 - s = s := by simpa [reflect] using h
  have : (1 : ℂ).re - s.re = s.re := by
    simpa using congrArg Complex.re h'
  have : (1 : ℝ) - s.re = s.re := by simpa using this
  linarith

end SuzukiRH
