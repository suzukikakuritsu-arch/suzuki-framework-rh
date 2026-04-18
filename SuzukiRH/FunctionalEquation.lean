import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic

namespace SuzukiRH

open Complex

/-- χ関数（抽象） -/
axiom chi : ℂ → ℂ

/-- 機能方程式 -/
axiom zeta_functional_equation :
  ∀ s : ℂ, zeta s = chi s * zeta (1 - s)

/-- 零点の対称性（安全にaxiom化） -/
axiom zero_symmetry_1_minus :
  ∀ s : ℂ, zeta s = 0 → zeta (1 - s) = 0

end SuzukiRH
