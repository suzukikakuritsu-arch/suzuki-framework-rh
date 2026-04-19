import Mathlib.Data.Complex.Basic
import SuzukiRH.Basic
import SuzukiRH.ZetaProperties
import SuzukiRH.Symmetry

namespace SuzukiRH

/-- 対称操作 -/
inductive SymOp
| ident
| conjOp
| reflectOp
| both

open SymOp

/-- 作用（非計算的） -/
noncomputable def act : SymOp → ℂ → ℂ
| SymOp.ident, s => s
| SymOp.conjOp, s => conj s
| SymOp.reflectOp, s => 1 - s
| SymOp.both, s => conj (1 - s)

/-- 不動点 -/
def IsFixed (op : SymOp) (s : ℂ) : Prop :=
  act op s = s

/-- reflect の場合を展開 -/
theorem reflect_fixed_iff_critical :
  ∀ s : ℂ, IsFixed SymOp.reflectOp s → s.re = (1 : ℝ) / 2 :=
by
  intro s h
  have h' : (1 - s) = s := by
    simpa [IsFixed, act] using h
  exact fixed_point_critical_line s h'

end SuzukiRH
