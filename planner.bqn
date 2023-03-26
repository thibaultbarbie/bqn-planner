# Linear sampling between two points
# n LinSample a‿b will gives [a, a+0.001, a+0.002, (n times), b]
LinSample ← {n←𝕨 ÷˜ ⟜(¯1×-´)𝕩 ⋄ (1⊑𝕩)∾˜ ⍉ (⊑𝕩)+ n× (≠⊑𝕩)‿𝕨 ⥊ (⊢∾⊢)⟜↕ 𝕨}

# Collision checkers
radius_squared ← 0.2
obs ← 0.5‿0.5
Col←{0<radius_squared-+´2⋆˜obs-𝕩}
TransitionCol ← {∧´ Col˘ (10 LinSample 𝕩)}

# We sample the start and goal
s ←  2 •rand.Range 0
g ←  2 •rand.Range 0

•Show s
#•Show g

start_tree ← ⟨s⟩
start_tree_parents ← ⟨0⟩

q_rand ← 2 •rand.Range 0
•Show q_rand
•Show TransitionCol s‿q_rand

start_tree ↩ {(TransitionCol s‿q_rand) ? start_tree; start_tree ∾ ⋈q_rand  }
•Show start_tree


# Memo
# Can we align the numbers to the same unit?
#    0.001
# 1418.6
#
# Can we limit the number of digits after the period?
