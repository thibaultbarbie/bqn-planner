⟨ ColSegmentsCircles, FK⟩ ← •Import "collision.bqn"

Benchmark ← {
  n ← 𝕩 ⋄ k ← 𝕨
  points  ← 10 × 2‿n‿2 •rand.Range 0
  circle_centers ← 10 × 2‿k •rand.Range 0
  radius ← 10 × k •rand.Range 0
   
  1000 ⟨circle_centers, radius⟩⊸ColSegmentsCircles•_timed points
}

benchmark_res ← 5 Benchmark⌜  10
•Show benchmark_res


FullBenchmark ← {
  n ← 𝕩 ⋄ d ← 4 ⋄ k ← 𝕨 ⋄ q ← (n‿d)⥊ 10 × d •rand.Range 0 ⋄ l ← (≢q)⥊d •rand.Range 0
  circle_centers ← 10 × 2‿k •rand.Range 0
  radius ← 10 × k •rand.Range 0
   
  1000 ((⟨circle_centers, radius⟩⊸ColSegmentsCircles)∘FK)•_timed l‿q
}

benchmark_res ↩ 50 FullBenchmark 10
•Show benchmark_res
