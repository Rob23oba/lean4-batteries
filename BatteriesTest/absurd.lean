import Batteries.Tactic.Basic

/-! Tests for `absurd` tactic -/

-- Basic example
/--
error: unsolved goals
p : Prop
h : p
⊢ ¬p
-/
#guard_msgs in
example {p : Prop} (h : p) : 0 = 0 := by
  absurd h

-- Negative example
/--
error: unsolved goals
p : Prop
h : ¬p
⊢ p
-/
#guard_msgs in
example {p : Prop} (h : ¬p) : 0 = 1 := by
  absurd h

-- Inequality example
/--
error: unsolved goals
n : Nat
h : n ≠ 0
⊢ n = 0
-/
#guard_msgs in
example (h : n ≠ 0) : 0 = 2 := by
  absurd h

-- Example with implies false
/--
error: unsolved goals
p : Prop
h : p → False
⊢ p
-/
#guard_msgs in
example {p : Prop} (h : p → False) : 0 = 3 := by
  absurd h

/--
error: unsolved goals
p : Prop
h : p
⊢ ¬p
-/
#guard_msgs in
example {p : Prop} {h : p} : ∀ {x : True}, 0 = 0 := by
  absurd h

-- `·` should not be legal
/--
error: invalid occurrence of `·` notation, it must be surrounded by parentheses (e.g. `(· + 1)`)
---
error: unsolved goals
p : Prop
h : p
⊢ ∀ {x : True}, 0 = 0
-/
#guard_msgs in
example {p : Prop} {h : p} : ∀ {_ : True}, 0 = 0 := by
  absurd ·
