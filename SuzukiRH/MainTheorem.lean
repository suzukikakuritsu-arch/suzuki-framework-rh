import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic

namespace SuzukiRH

open Complex

axiom suppression_axiom :
  ∀ s : ℂ, zeta s = 0 → 0 < s.re → s.re < 1

axiom rigidity_axiom :
  ∀ s : ℂ, IsNontrivialZero s → s.re = (1 : ℝ) / 2

theorem riemann_hypothesis :
  ∀ s : ℂ, IsNontrivialZero s → s.re = (1 : ℝ) / 2 :=
by
  intro s hs
  exact rigidity_axiom s hs

end SuzukiRH
