⟨ ColSegmentsCircles, FK, IsValid ⟩ ⇐ 

# Compute if a segment is in collision with a circle.
# First we compute if the segment endpoints are in the circle (function F)
# If F is false we compute the distance from the circle to the segment
# This function can handle multiple segments and multiple circles
# 𝕩≢2‿n‿2    𝕨≢⟨2‿k, k⟩
ColSegmentsCircles← {
 c‿r ← 𝕨 ⋄ r_sq ← ×˜r 
 F ← {∨´∘⥊˘ (r_sq⊸≥)⎉1 +˝×˜ 𝕩 -⌜˘ c}
 G ← { cacb ← 𝕩 -⌜˘ c ⋄ ca ← ⊏⎉2 cacb ⋄ ab ← -˝⎉1 𝕩 
          n ← (-⌾⊏)∘⌽ ab
       d_sq ← (×˜ +˝ n × ca) ÷ +˝×˜ ab
       ∨˝˘(0 ≥ +˝ ca × 1⊏⎉2 cacb) ∧ r_sq⊸≥⎉1 d_sq}
 m ← ¬F 𝕩 ⋄ col ← (G m /⎉2 𝕩)⌾(m⊸/) (1⊑≢𝕩) ⥊ 1
}

# Output should be 2‿n‿2 (x/y ‿ number of q × =l ‿ A/B)
FK ← {
 l‿q ←𝕩 ⋄ a ← +`˘ q
 x ← ∾˝ (2↕(0˙∾+`))˘ l ×˘ •math.Cos a
 y ← ∾˝ (2↕(0˙∾+`))˘ l ×˘ •math.Sin a
 x≍y
}

IsValid ← {
  q ← (1‿3)⥊ π×𝕩 ⋄ l ← 1‿3 ⥊⟨0.5,0.5,0.5⟩
  circle_centers ← 2‿4 ⥊ [⟨0,-0.5, 1, -1⟩, ⟨1,0, 0.9, 1⟩]
  radius ← ⟨0.173, 0.173, 0.08, 0.08⟩
  
  ¬ ∨´(⟨circle_centers, radius⟩⊸ColSegmentsCircles)∘FK l‿q
}
