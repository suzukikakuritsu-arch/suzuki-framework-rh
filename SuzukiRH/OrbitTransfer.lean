import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit

namespace SuzukiRH

open Set

/--
  軌道内で反転固定性は伝播する
-/
axiom orbit_reflect_transfer :
  ∀ s t : ℂ,
    t ∈ orbit s →
    (1 - t = t) →
    (1 - s = s)

end SuzukiRH
