import Mathlib.Data.Set.Basic
import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.GroupAction

namespace SuzukiRH

open Set

/-- 軌道（集合として定義） -/
noncomputable def orbit (s : ℂ) : Set ℂ :=
  {x | ∃ g : SymOp, act g s = x}

/-- 自分自身は必ず軌道に含まれる -/
theorem mem_orbit_self (s : ℂ) :
  s ∈ orbit s :=
by
  refine ⟨SymOp.ident, ?_⟩
  simp [orbit, act]

/-- 固定点なら軌道は1点に潰れる（弱形式） -/
theorem fixed_implies_orbit_trivial :
  ∀ s : ℂ,
    (∀ g : SymOp, act g s = s) →
    orbit s = {s} :=
by
  intro s hfix
  ext x
  constructor
  · intro hx
    rcases hx with ⟨g, hg⟩
    have := hfix g
    simpa [hg] using this
  · intro hx
    simp at hx
    subst hx
    exact mem_orbit_self s

end SuzukiRH
