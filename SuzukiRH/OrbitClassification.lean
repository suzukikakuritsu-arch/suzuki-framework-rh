import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction
import SuzukiRH.Orbit
import SuzukiRH.OrbitBounds

namespace SuzukiRH

open Set

/-- 軌道が1点に潰れる条件（代表形） -/
def orbitIsSingleton (s : ℂ) : Prop :=
  orbit s = {s}

/-- 2点に潰れる代表パターン（例：共役固定） -/
def orbitIsTwoPoint_conj (s : ℂ) : Prop :=
  orbit s ⊆ {s, conj s} ∧ s ≠ conj s

/-- 2点に潰れる代表パターン（例：反転固定） -/
def orbitIsTwoPoint_reflect (s : ℂ) : Prop :=
  orbit s ⊆ {s, 1 - s} ∧ s ≠ 1 - s

/--
  分類スキーム（公理的）
  ※ 後で候補集合と同一化関係から lemma 化できる
-/
axiom orbit_classification :
  ∀ s : ℂ,
    orbitIsSingleton s ∨
    orbitIsTwoPoint_conj s ∨
    orbitIsTwoPoint_reflect s ∨
    (orbit s ⊆ orbitCandidates s ∧
     ¬ orbitIsSingleton s ∧
     ¬ orbitIsTwoPoint_conj s ∧
     ¬ orbitIsTwoPoint_reflect s)

end SuzukiRH
