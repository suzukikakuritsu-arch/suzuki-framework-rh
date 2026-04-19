import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit

namespace SuzukiRH

open Set

/--
  4点軌道なら必ずこの形に一致
-/
def fourOrbitSet (s : ℂ) : Set ℂ :=
  {s, conj s, 1 - s, 1 - conj s}

/--
  軌道が4点に含まれるときの正規形
-/
lemma orbit_subset_four :
  ∀ s : ℂ,
    orbit s ⊆ orbitCandidates s →
    orbit s ⊆ fourOrbitSet s :=
by
  intro s h
  -- orbitCandidates と同一構造として扱う
  simpa [fourOrbitSet] using h

end SuzukiRH
