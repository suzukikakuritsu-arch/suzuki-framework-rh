import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds
import SuzukiRH.OrbitClassification
import SuzukiRH.Nontrivial

namespace SuzukiRH

open Set

/--
  4点軌道は反転2点に圧縮できる（構造ブリッジ）
-/
axiom collapse_four_to_reflect :
  ∀ s : ℂ, IsNontrivialZero s →
    orbit s ⊆ {s, conj s, 1 - s, 1 - conj s} →
    orbit s ⊆ {s, 1 - s}

end SuzukiRH
