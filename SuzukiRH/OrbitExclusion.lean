import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds
import SuzukiRH.Nontrivial

namespace SuzukiRH

open Set

/--
  非自明零点では「軌道 ⊆ {s, conj s}」は起きない
  （共役2点ケースの排除）
-/
axiom not_orbit_subset_conj_pair :
  ∀ s : ℂ, IsNontrivialZero s →
    ¬ (orbit s ⊆ {s, conj s})

end SuzukiRH
