⟨ ColSegmentsCircles, FK⟩ ← •Import "collision.bqn"

points  ← [[⟨-10, -8⟩, ⟨-10,  2⟩, ⟨-4, 4⟩, ⟨-2,  2⟩, ⟨-6, 10⟩, ⟨-6, -4⟩,
            ⟨ -4,  4⟩, ⟨ -2, -2⟩, ⟨ 0, 4⟩, ⟨ 0, 12⟩, ⟨ 6, 12⟩, ⟨-8, 10⟩],
	   [⟨4, -6⟩, ⟨-2, -2⟩, ⟨-10, -6⟩, ⟨0, -8⟩,⟨ 2, -2⟩,⟨  8,  6⟩,
            ⟨4,  2⟩, ⟨ 2,  6⟩, ⟨  4,  8⟩, ⟨8,  8⟩,⟨10, -2⟩,⟨-10, 10⟩ ]]
	   
circle_centers ← [⟨-4,  6, 8,   2,  -6⟩,
                  ⟨-4, -4, 4,   2,   6⟩]
radius         ← ⟨  4,  2, 4, 1.2, 1.2⟩

expected ← 0‿1‿0‿1‿0‿0‿1‿0‿0‿1‿1‿1
test_result ← ∧´ expected = ⟨(circle_centers), radius⟩ ColSegmentsCircles points
•Show test_result 
