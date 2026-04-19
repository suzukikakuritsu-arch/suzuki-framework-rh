import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.FourOrbitStructure

namespace SuzukiRH

open Set

/--
  4点軌道は対称性により圧縮される（弱形）
-/
axiom four_orbit_reduces :
  ∀ s : ℂ,
    orbit s ⊆ fourOrbitSet s →
    (∃ t, t ∈ orbit s ∧ (1 - t = t))
    ∨ orbit s ⊆ {s, 1 - s}

end SuzukiRH
