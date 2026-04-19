import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic

namespace SuzukiRH

/-- χ関数（抽象） -/
axiom chi : ℂ → ℂ

/-- 機能方程式 -/
axiom zeta_functional_equation :
  ∀ s : ℂ, zeta s = chi s * zeta (1 - s)

/-- 零点の 1 - s 対称性 -/
axiom zero_symmetry_1_minus :
  ∀ s : ℂ, zeta s = 0 → zeta (1 - s) = 0

end SuzukiRH
