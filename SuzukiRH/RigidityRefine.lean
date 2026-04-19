import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds
import SuzukiRH.OrbitClassification
import SuzukiRH.Rigidity

namespace SuzukiRH

/-- 零点は singleton 軌道に入る（分類経由） -/
theorem zero_orbit_singleton :
  ∀ s : ℂ, IsNontrivialZero s → orbitIsSingleton s :=
by
  intro s hs
  -- 既存の強剛性から直接結論
  have h := orbit_collapse s hs
  simpa [orbitIsSingleton] using h

end SuzukiRH
