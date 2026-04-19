import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds

namespace SuzukiRH

open Set

axiom collapse_four_to_reflect :
  ∀ s : ℂ, IsNontrivialZero s →
    orbit s ⊆ orbitCandidates s →
    orbit s ⊆ {s, 1 - s}

end SuzukiRH
