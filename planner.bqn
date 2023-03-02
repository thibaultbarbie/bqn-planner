# Uniform sampler
res←100
Sample ← 2⊸•rand.Deal⊸÷∘res

# Collision checker
radius_squared ← 0.2
obs ← 0.5‿0.5
Col←{0<radius_squared-+´2⋆˜obs-𝕩}

# We sample the start and goal
q← Sample 0

•Show Col q
