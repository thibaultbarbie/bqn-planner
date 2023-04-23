Dot ← +´∘×

# 𝕩≢n‿2‿2    𝕨≢⟨k‿2, k⟩
ColSegmentsCircles ← { 
 [a,b] ← 1⍉𝕩 ⋄ c‿r ← 𝕨 ⋄ r_squared ← r⋆2 
 ca  ← {𝕩 -⎉1 c}⎉1 a ⋄ cb  ← {𝕩 -⎉1 c}⎉1 b
 
 col ← {∨´⎉1}⍟2 r_squared≥⎉1 Dot˜⎉1 {𝕩 -⎉1 c}⎉1 𝕩
 n   ← (-⌾⊑)∘⌽˘ b-a
 d_squared ← (2⋆˜ n {𝕨 Dot⎉1 𝕩}˘ ca ) ÷ Dot˜˘ b-a 
 col ↩ col ∨˘ ∨´˘  (0 ≥ ca Dot˘˘ cb) ∧ {r_squared ≥¨ 𝕩}˘ d_squared
}

# ---- Tests ----
points  ← [[⟨-10,   4⟩, ⟨-8, -6⟩],
           [⟨-10,  -2⟩, ⟨ 2, -2⟩],
           [⟨ -4, -10⟩, ⟨ 4, -6⟩],
           [⟨ -2,   0⟩, ⟨ 2, -8⟩],
           [⟨ -6,   2⟩, ⟨10, -2⟩],
           [⟨ -6,   8⟩, ⟨-4,  6⟩],
           [⟨ -4,   4⟩, ⟨ 4,  2⟩],
           [⟨ -2,   2⟩, ⟨-2,  6⟩],
           [⟨  0,   4⟩, ⟨ 4,  8⟩],
           [⟨  0,   8⟩, ⟨12,  8⟩],
           [⟨  6,  10⟩, ⟨12, -2⟩],
           [⟨ -8, -10⟩, ⟨10, 10⟩]]
	   
circle_centers ← [⟨-4,-4⟩, ⟨6,-4⟩, ⟨8,4⟩, ⟨2,2⟩, ⟨-6,6⟩]
radius         ← ⟨  4,      2,      4,     1.2,    1.2⟩

expected ← 0‿1‿0‿1‿0‿0‿1‿0‿0‿1‿1‿1
test_result ← ∧´ expected = ⟨circle_centers, radius⟩ ColSegmentsCircles points

# ---- Benchmark ----

Benchmark ← {
  n ← 𝕩 ⋄ k ← 𝕨
  points  ↩ 10 × n‿2‿2 •rand.Range 0  
  circle_centers ↩ 10 × k‿2 •rand.Range 0
  radius ↩ 10 × k •rand.Range 0
  1000 ⟨circle_centers, radius⟩⊸ColSegmentsCircles•_timed points
}

•Show (1+↕15) Benchmark⌜ (10+↕7)